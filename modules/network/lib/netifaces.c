
#include "ruby.h"

#ifndef RUBY_19
#include "rubysig.h"
#endif

#ifndef WIN32

#  include <sys/types.h>
#  include <sys/socket.h>
#  include <net/if.h>
#  include <netdb.h>

#  if HAVE_SOCKET_IOCTLS
#    include <sys/ioctl.h>
#    include <netinet/in.h>
#    include <arpa/inet.h>
#if defined(__sun)
#include <unistd.h>
#include <stropts.h>
#include <sys/sockio.h>
#endif
#  endif /* HAVE_SOCKET_IOCTLS */

/* For logical interfaces support we convert all names to same name prefixed with l */
#if HAVE_SIOCGLIFNUM
#define CNAME(x) l##x
#else
#define CNAME(x) x
#endif

#if HAVE_NET_IF_DL_H
#  include <net/if_dl.h>
#endif

/* For Linux, include all the sockaddr
   definitions we can lay our hands on. */
#if !HAVE_SOCKADDR_SA_LEN
#  if HAVE_NETASH_ASH_H
#    include <netash/ash.h>
#  endif
#  if HAVE_NETATALK_AT_H
#    include <netatalk/at.h>
#  endif
#  if HAVE_NETAX25_AX25_H
#    include <netax25/ax25.h>
#  endif
#  if HAVE_NETECONET_EC_H
#    include <neteconet/ec.h>
#  endif
#  if HAVE_NETIPX_IPX_H
#    include <netipx/ipx.h>
#  endif
#  if HAVE_NETPACKET_PACKET_H
#    include <netpacket/packet.h>
#  endif
#  if HAVE_NETROSE_ROSE_H
#    include <netrose/rose.h>
#  endif
#  if HAVE_LINUX_IRDA_H
#    include <linux/irda.h>
#  endif
#  if HAVE_LINUX_ATM_H
#    include <linux/atm.h>
#  endif
#  if HAVE_LINUX_LLC_H
#    include <linux/llc.h>
#  endif
#  if HAVE_LINUX_TIPC_H
#    include <linux/tipc.h>
#  endif
#  if HAVE_LINUX_DN_H
#    include <linux/dn.h>
#  endif

/* Map address families to sizes of sockaddr structs */
static int af_to_len(int af) 
{
	switch (af) 
	{
  	case AF_INET: return sizeof (struct sockaddr_in);
#if defined(AF_INET6) && HAVE_SOCKADDR_IN6
  	case AF_INET6: return sizeof (struct sockaddr_in6);
#endif
#if defined(AF_AX25) && HAVE_SOCKADDR_AX25
#  if defined(AF_NETROM)
  	case AF_NETROM: /* I'm assuming this is carried over x25 */
#  endif
  	case AF_AX25: return sizeof (struct sockaddr_ax25);
#endif
#if defined(AF_IPX) && HAVE_SOCKADDR_IPX
  	case AF_IPX: return sizeof (struct sockaddr_ipx);
#endif
#if defined(AF_APPLETALK) && HAVE_SOCKADDR_AT
  	case AF_APPLETALK: return sizeof (struct sockaddr_at);
#endif
#if defined(AF_ATMPVC) && HAVE_SOCKADDR_ATMPVC
  	case AF_ATMPVC: return sizeof (struct sockaddr_atmpvc);
#endif
#if defined(AF_ATMSVC) && HAVE_SOCKADDR_ATMSVC
  	case AF_ATMSVC: return sizeof (struct sockaddr_atmsvc);
#endif
#if defined(AF_X25) && HAVE_SOCKADDR_X25
  	case AF_X25: return sizeof (struct sockaddr_x25);
#endif
#if defined(AF_ROSE) && HAVE_SOCKADDR_ROSE
  	case AF_ROSE: return sizeof (struct sockaddr_rose);
#endif
#if defined(AF_DECnet) && HAVE_SOCKADDR_DN
  	case AF_DECnet: return sizeof (struct sockaddr_dn);
#endif
#if defined(AF_PACKET) && HAVE_SOCKADDR_LL
  	case AF_PACKET: return sizeof (struct sockaddr_ll);
#endif
#if defined(AF_ASH) && HAVE_SOCKADDR_ASH
  	case AF_ASH: return sizeof (struct sockaddr_ash);
#endif
#if defined(AF_ECONET) && HAVE_SOCKADDR_EC
  	case AF_ECONET: return sizeof (struct sockaddr_ec);
#endif
#if defined(AF_IRDA) && HAVE_SOCKADDR_IRDA
  	case AF_IRDA: return sizeof (struct sockaddr_irda);
#endif
	}
	return sizeof (struct sockaddr);
}

#define SA_LEN(sa)      af_to_len(sa->sa_family)
#if HAVE_SIOCGLIFNUM
#define SS_LEN(sa)      af_to_len(sa->ss_family)
#else
#define SS_LEN(sa)      SA_LEN(sa)
#endif
#else
//remove a warning on openbsd
#ifndef SA_LEN
#define SA_LEN(sa)      sa->sa_len
#endif
#endif /* !HAVE_SOCKADDR_SA_LEN */

#  if HAVE_GETIFADDRS
#    include <ifaddrs.h>
#  endif /* HAVE_GETIFADDRS */

#  if !HAVE_GETIFADDRS && (!HAVE_SOCKET_IOCTLS || !HAVE_SIOCGIFCONF)
/* If the platform doesn't define, what we need, barf.  If you're seeing this,
   it means you need to write suitable code to retrieve interface information
   on your system. */
#    error You need to add code for your platform.
#  endif

#else /* defined(WIN32) */

#include <windows.h>
#include <winsock2.h>
#include <iphlpapi.h>

#endif /* defined(WIN32) */

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

/* On systems without AF_LINK (Windows, for instance), define it anyway, but
   give it a crazy value.  On Linux, which has AF_PACKET but not AF_LINK,
   define AF_LINK as the latter instead. */
#ifndef AF_LINK
#  ifdef AF_PACKET
#    define AF_LINK  AF_PACKET
#  else
#    define AF_LINK  -1000
#  endif
#  define HAVE_AF_LINK 0
#else
#  define HAVE_AF_LINK 1
#endif

#if !defined(WIN32)
#if  !HAVE_GETNAMEINFO
#undef getnameinfo
#undef NI_NUMERICHOST

#define getnameinfo our_getnameinfo
#define NI_NUMERICHOST 1

/* A very simple getnameinfo() for platforms without */
static int
getnameinfo (const struct sockaddr *addr, int addr_len,
             char *buffer, int buflen,
             char *buf2, int buf2len,
             int flags)
{
	switch (addr->sa_family) 
	{
	case AF_INET:
	{
		const struct sockaddr_in *sin = (struct sockaddr_in *)addr;
		const unsigned char *bytes = (unsigned char *)&sin->sin_addr.s_addr;
		char tmpbuf[20];

		sprintf (tmpbuf, "%d.%d.%d.%d",
		       bytes[0], bytes[1], bytes[2], bytes[3]);

		strncpy (buffer, tmpbuf, buflen);
	}
	break;
#ifdef AF_INET6
	case AF_INET6:
	{
		const struct sockaddr_in6 *sin = (const struct sockaddr_in6 *)addr;
		const unsigned char *bytes = sin->sin6_addr.s6_addr;
		int n;
		char tmpbuf[80], *ptr = tmpbuf;
		int done_double_colon = FALSE;
		int colon_mode = FALSE;

		for (n = 0; n < 8; ++n) 
		{
			unsigned char b1 = bytes[2 * n];
			unsigned char b2 = bytes[2 * n + 1];

			if (b1) 
			{
		  		if (colon_mode) 
				{
					colon_mode = FALSE;
					*ptr++ = ':';
		  		}
		  	sprintf (ptr, "%x%02x", b1, b2);
		  	ptr += strlen (ptr);
		  	*ptr++ = ':';
			} 
			else if (b2) 
			{
			  	if (colon_mode) 
				{
				    colon_mode = FALSE;
				    *ptr++ = ':';
				}
				sprintf (ptr, "%x", b2);
				ptr += strlen (ptr);
				*ptr++ = ':';
			} 
			else {
		  		if (!colon_mode) 
				{
		    			if (done_double_colon) 
					{
						*ptr++ = '0';
						*ptr++ = ':';
		    			} 
					else 
					{
		      				if (n == 0)
						*ptr++ = ':';
		      				colon_mode = TRUE;
		      				done_double_colon = TRUE;
		    			}
		  		}
			}
		}
		if (colon_mode) 
		{
			colon_mode = FALSE;
			*ptr++ = ':';
			*ptr++ = '\0';
		} 
		else 
		{
			*--ptr = '\0';
		}

		strncpy (buffer, tmpbuf, buflen);
	}
	break;
#endif /* AF_INET6 */
  	default:
    		return -1;
  }

	return 0;
}
#endif

static int
string_from_sockaddr (struct sockaddr *addr,
                      char *buffer,
                      int buflen)
{
	if (!addr || addr->sa_family == AF_UNSPEC)
    		return -1;

  	if (getnameinfo (addr, SA_LEN(addr),
                   buffer, buflen,
                   NULL, 0,
                   NI_NUMERICHOST) != 0) 
	{
    		int n, len;
		char *ptr;
		const char *data;

		len = SA_LEN(addr);

#if HAVE_AF_LINK
	/* BSD-like systems have AF_LINK */
		if (addr->sa_family == AF_LINK) 
		{
			struct sockaddr_dl *dladdr = (struct sockaddr_dl *)addr;
			len = dladdr->sdl_alen;
			if(len >=0)
				data = LLADDR(dladdr);
		} 
		else 
		{
#endif
#if defined(AF_PACKET)
      /* Linux has AF_PACKET instead */
		if (addr->sa_family == AF_PACKET) 
		{
			struct sockaddr_ll *lladdr = (struct sockaddr_ll *)addr;
			len = lladdr->sll_halen;
			//msf: openbsd and maybe other systems have a len of 0 for enc0,pflog0 .. interfaces
			if(len >=0)
				data = (const char *)lladdr->sll_addr;
		} 	
		else 
		{
#endif
			/* We don't know anything about this sockaddr, so just display
			   the entire data area in binary. */
			len -= (sizeof (struct sockaddr) - sizeof (addr->sa_data));
			data = addr->sa_data;
#if defined(AF_PACKET)
		}
#endif
#if HAVE_AF_LINK
		}
#endif

		if ((buflen < 3 * len) || len <= 0)
			return -1;

		ptr = buffer;
		buffer[0] = '\0';

		for (n = 0; n < len; ++n) 
		{
			sprintf (ptr, "%02x:", data[n] & 0xff);
			ptr += 3;
		}
		*--ptr = '\0';
	}

  	return 0;
}
#endif /* !defined(WIN32) */

static VALUE rb_cNetifaces;

#define NETIFACES_VERSION "0.1"

static VALUE add_to_family(VALUE result, VALUE family, VALUE value)
{
	Check_Type(result, T_HASH);
	Check_Type(family, T_FIXNUM);
	Check_Type(value, T_HASH);
	VALUE list;

	list = rb_hash_aref(result, family);

	if (list == Qnil)
		list = rb_ary_new();
	else
		Check_Type(list, T_ARRAY);

	rb_ary_push(list, value);
	rb_hash_aset(result, family, list);
	return result;
}

static VALUE
rbnetifaces_s_version(VALUE class)
{
	return rb_str_new2(NETIFACES_VERSION);	
}

static VALUE
rbnetifaces_s_addresses (VALUE class, VALUE dev)
{
	VALUE result;
	int found = FALSE;
	result = rb_hash_new();
	
#if defined(WIN32)
	PIP_ADAPTER_INFO pAdapterInfo = NULL;
	PIP_ADAPTER_INFO pInfo = NULL;
	ULONG ulBufferLength = 0;
	DWORD dwRet;
	PIP_ADDR_STRING str;

	//First, retrieve the adapter information.  We do this in a loop, in
  //case someone adds or removes adapters in the meantime. 
	do 
	{
		dwRet = GetAdaptersInfo(pAdapterInfo, &ulBufferLength);

		if (dwRet == ERROR_BUFFER_OVERFLOW) 
		{
			if (pAdapterInfo)
				free (pAdapterInfo);
			pAdapterInfo = (PIP_ADAPTER_INFO)malloc (ulBufferLength);

			if (!pAdapterInfo) 
			{
				rb_raise(rb_eRuntimeError, "Unknow error at OS level");
				return Qnil;
		}
    }
  } while (dwRet == ERROR_BUFFER_OVERFLOW);

	// If we failed, then fail in Ruby too 
	if (dwRet != ERROR_SUCCESS && dwRet != ERROR_NO_DATA) 
	{
		if (pAdapterInfo)
			free (pAdapterInfo);
		rb_raise(rb_eRuntimeError, "Unable to obtain adapter information.");
		return Qnil;
	}

	for (pInfo = pAdapterInfo; pInfo; pInfo = pInfo->Next) 
	{
		char buffer[256];

		if (strcmp (pInfo->AdapterName, StringValuePtr(dev)) != 0)
			continue;

		VALUE rbhardw = Qnil;
		VALUE rbaddr = Qnil;	
		VALUE rbnetmask = Qnil;
		VALUE rbbraddr = Qnil;
	
		found = TRUE;

		// Do the physical address 
		if (256 >= 3 * pInfo->AddressLength) 
		{
			VALUE hash_hardw;
			hash_hardw = rb_hash_new();

			char *ptr = buffer;
			unsigned n;
		  
			*ptr = '\0';
			for (n = 0; n < pInfo->AddressLength; ++n) 
			{
				sprintf (ptr, "%02x:", pInfo->Address[n] & 0xff);
				ptr += 3;
			}
			*--ptr = '\0';

			rbhardw = rb_str_new2(buffer);
			rb_hash_aset(hash_hardw, rb_str_new2("addr"), rbhardw);
			result = add_to_family(result, INT2FIX(AF_LINK), hash_hardw);
		}

		for (str = &pInfo->IpAddressList; str; str = str->Next) 
		{
			
			VALUE result2;
			result2 = rb_hash_new();
				
			if(str->IpAddress.String)
				rbaddr = rb_str_new2(str->IpAddress.String);
			if(str->IpMask.String)
				rbnetmask = rb_str_new2(str->IpMask.String);
			
			//If this isn't the loopback interface, work out the broadcast
			//address, for better compatibility with other platforms. 
			if (pInfo->Type != MIB_IF_TYPE_LOOPBACK) 
			{
				unsigned long inaddr = inet_addr (str->IpAddress.String);
				unsigned long inmask = inet_addr (str->IpMask.String);
				struct in_addr in;
				char *brstr;

				in.S_un.S_addr = (inaddr | ~inmask) & 0xfffffffful;

				brstr = inet_ntoa (in);

				if (brstr)
					rbbraddr = rb_str_new2(brstr);
			}

			if (rbaddr)
				rb_hash_aset(result2, rb_str_new2("addr"), rbaddr);
			if (rbnetmask)
				rb_hash_aset(result2, rb_str_new2("netmask"), rbnetmask);
			if (rbbraddr)
				rb_hash_aset(result2, rb_str_new2("broadcast"), rbbraddr);
		
			result = add_to_family(result, INT2FIX(AF_INET), result2);
				
		}
	} // for

	free (pAdapterInfo);

#elif HAVE_GETIFADDRS
	struct ifaddrs *addrs = NULL;
	struct ifaddrs *addr = NULL;

	if (getifaddrs (&addrs) < 0) 
	{
		rb_raise(rb_eRuntimeError, "Unknow error at OS level");
  	}

  	for (addr = addrs; addr; addr = addr->ifa_next) 
	{
		char buffer[256];
		VALUE rbaddr = Qnil;
		VALUE rbnetmask = Qnil;
		VALUE rbbraddr = Qnil;

		if (strcmp (addr->ifa_name, StringValuePtr(dev)) != 0)
			continue;
	 
		/* Sometimes there are records without addresses (e.g. in the case of a
		dial-up connection via ppp, which on Linux can have a link address
		record with no actual address).  We skip these as they aren't useful.
		Thanks to Christian Kauhaus for reporting this issue. */
		if (!addr->ifa_addr)
			continue;  

		found = TRUE;

		if (string_from_sockaddr (addr->ifa_addr, buffer, sizeof (buffer)) == 0)
			rbaddr = rb_str_new2(buffer);

		if (string_from_sockaddr (addr->ifa_netmask, buffer, sizeof (buffer)) == 0)
			rbnetmask = rb_str_new2(buffer);

		if (string_from_sockaddr (addr->ifa_broadaddr, buffer, sizeof (buffer)) == 0)
			rbbraddr = rb_str_new2(buffer);

		VALUE result2;
		result2 = rb_hash_new();

		if (rbaddr)
			rb_hash_aset(result2, rb_str_new2("addr"), rbaddr);
		if (rbnetmask)
			rb_hash_aset(result2, rb_str_new2("netmask"), rbnetmask);
		if (rbbraddr) 
		{
			if (addr->ifa_flags & (IFF_POINTOPOINT | IFF_LOOPBACK))
				rb_hash_aset(result2, rb_str_new2("peer"), rbbraddr);
			else
				rb_hash_aset(result2, rb_str_new2("broadcast"), rbbraddr);
		}
		if (rbaddr || rbnetmask || rbbraddr)
			result = add_to_family(result, INT2FIX(addr->ifa_addr->sa_family), result2);
	}
  	freeifaddrs (addrs);
#elif HAVE_SOCKET_IOCTLS

	int sock = socket(AF_INET, SOCK_DGRAM, 0);

	if (sock < 0) 
	{
	    	rb_raise(rb_eRuntimeError, "Unknow error at OS level");
		return Qnil;
	}

	struct CNAME(ifreq) ifr;
	
	char buffer[256];
	int is_p2p = FALSE;
	VALUE rbaddr = Qnil;
	VALUE rbnetmask = Qnil;
	VALUE rbbraddr = Qnil;
	VALUE rbdstaddr = Qnil;

	strncpy (ifr.CNAME(ifr_name), StringValuePtr(dev), IFNAMSIZ);

#if HAVE_SIOCGIFHWADDR
	if (ioctl (sock, SIOCGIFHWADDR, &ifr) == 0) 
	{
		if (string_from_sockaddr (&(ifr.CNAME(ifr_addr)), buffer, sizeof (buffer)) == 0) 
		{
			found = TRUE;

			VALUE rbhardw = Qnil;
			VALUE hash_hardw;
			hash_hardw = rb_hash_new();
			rbhardw = rb_str_new2(buffer);
			rb_hash_aset(hash_hardw, rb_str_new2("addr"), rbhardw);
			result = add_to_family(result, INT2FIX(AF_LINK), hash_hardw);
		}
	}
#endif


#if HAVE_SIOCGIFADDR
#if HAVE_SIOCGLIFNUM
	if (ioctl (sock, SIOCGLIFADDR, &ifr) == 0) 
	{
#else
	if (ioctl (sock, SIOCGIFADDR, &ifr) == 0) 
	{
#endif
		if (string_from_sockaddr ((struct sockaddr *)&ifr.CNAME(ifr_addr), buffer, sizeof (buffer)) == 0)
		{
			found = TRUE;
	      		rbaddr = rb_str_new2(buffer);
		}
  	}
#endif

#if HAVE_SIOCGIFNETMASK
#if HAVE_SIOCGLIFNUM
	if (ioctl (sock, SIOCGLIFNETMASK, &ifr) == 0) 
	{
#else
  	if (ioctl (sock, SIOCGIFNETMASK, &ifr) == 0) 
	{
#endif
		if (string_from_sockaddr ((struct sockaddr *)&ifr.CNAME(ifr_addr), buffer, sizeof (buffer)) == 0)
		{
			found = TRUE;
			rbnetmask = rb_str_new2(buffer);
		}
	}
#endif

#if HAVE_SIOCGIFFLAGS
#if HAVE_SIOCGLIFNUM
	if (ioctl (sock, SIOCGLIFFLAGS, &ifr) == 0) 
	{
#else
	if (ioctl (sock, SIOCGIFFLAGS, &ifr) == 0) 
	{
#endif

		if (ifr.CNAME(ifr_flags) & IFF_POINTOPOINT)
		{
			is_p2p = TRUE;
		}
  	}
#endif

#if HAVE_SIOCGIFBRDADDR
#if HAVE_SIOCGLIFNUM
	if (!is_p2p && ioctl (sock, SIOCGLIFBRDADDR, &ifr) == 0) 
	{
#else
	if (!is_p2p && ioctl (sock, SIOCGIFBRDADDR, &ifr) == 0) 
	{
#endif


		if (string_from_sockaddr ((struct sockaddr *)&ifr.CNAME(ifr_addr), buffer, sizeof (buffer)) == 0)
		{
	    		found = TRUE;
			rbbraddr = rb_str_new2(buffer);
		}
  	}
#endif

#if HAVE_SIOCGIFDSTADDR
#if HAVE_SIOCGLIFNUM
	if (is_p2p && ioctl (sock, SIOCGLIFBRDADDR, &ifr) == 0) 
	{
#else
	if (is_p2p && ioctl (sock, SIOCGIFBRDADDR, &ifr) == 0) 
	{
#endif
		if (string_from_sockaddr ((struct sockaddr *)&ifr.CNAME(ifr_addr), buffer, sizeof (buffer)) == 0)
		{
			found = TRUE;
      			rbdstaddr = rb_str_new2(buffer);
		}
	}

#endif
	VALUE result2;
	result2 = rb_hash_new();

	if (rbaddr)
		rb_hash_aset(result2, rb_str_new2("addr"), rbaddr);
	if (rbnetmask)
		rb_hash_aset(result2, rb_str_new2("netmask"), rbnetmask);
	if (rbbraddr) 
		rb_hash_aset(result2, rb_str_new2("broadcast"), rbbraddr);
  	if (rbdstaddr)
		rb_hash_aset(result2, rb_str_new2("peer"), rbbraddr);

	if (rbaddr || rbnetmask || rbbraddr || rbdstaddr)
		result = add_to_family(result, INT2FIX(AF_INET), result2);

	close (sock);
#endif /* HAVE_SOCKET_IOCTLS */

	if (found)
		return result;
	else
		return Qnil;

}

static VALUE
rbnetifaces_s_interfaces (VALUE self)
{
  	VALUE result;
	result = rb_ary_new();

#if defined(WIN32)
	PIP_ADAPTER_INFO pAdapterInfo = NULL;
	PIP_ADAPTER_INFO pInfo = NULL;
	ULONG ulBufferLength = 0;
	DWORD dwRet;

	// First, retrieve the adapter information 
	do {
		dwRet = GetAdaptersInfo(pAdapterInfo, &ulBufferLength);

		if (dwRet == ERROR_BUFFER_OVERFLOW) 
		{
			if (pAdapterInfo)
			free (pAdapterInfo);
			pAdapterInfo = (PIP_ADAPTER_INFO)malloc (ulBufferLength);

			if (!pAdapterInfo) 
			{
				rb_raise(rb_eRuntimeError, "Unknow error at OS level");
			}
    	}
  	} while (dwRet == ERROR_BUFFER_OVERFLOW);

	// If we failed, then fail in Ruby too 
	if (dwRet != ERROR_SUCCESS && dwRet != ERROR_NO_DATA) 
	{
		if (pAdapterInfo)
			free (pAdapterInfo);

    	rb_raise(rb_eRuntimeError, "Unknow error at OS level");
   	 	return Qnil;
	}
	if (dwRet == ERROR_NO_DATA) 
	{
		free (pAdapterInfo);
		return result;
	}

	for (pInfo = pAdapterInfo; pInfo; pInfo = pInfo->Next) 
	{
		VALUE ifname =  rb_str_new2(pInfo->AdapterName);
		//VALUE ifname =  rb_str_new2(pInfo->Description);
		if(!rb_ary_includes(result, ifname))
			rb_ary_push(result, ifname);
	}

	free (pAdapterInfo);

#elif HAVE_GETIFADDRS
	const char *prev_name = NULL;
	struct ifaddrs *addrs = NULL;
	struct ifaddrs *addr = NULL;

	if (getifaddrs (&addrs) < 0) 
	{
		rb_raise(rb_eRuntimeError, "Unknow error at OS level");
	}

	for (addr = addrs; addr; addr = addr->ifa_next) 
	{
		if (!prev_name || strncmp (addr->ifa_name, prev_name, IFNAMSIZ) != 0) 
		{
			VALUE ifname =  rb_str_new2(addr->ifa_name);

		if(!rb_ary_includes(result, ifname))
			rb_ary_push(result, ifname);

		prev_name = addr->ifa_name;
		}
	}

	freeifaddrs (addrs);
#elif HAVE_SIOCGIFCONF

	const char *prev_name = NULL;
	int fd = socket (AF_INET, SOCK_DGRAM, 0);
	struct CNAME(ifconf) ifc;
	int len = -1, n;
	if (fd < 0) {
		rb_raise(rb_eRuntimeError, "Unknow error at OS level");
		return Qnil;
	}

  // Try to find out how much space we need
#if HAVE_SIOCGSIZIFCONF
	if (ioctl (fd, SIOCGSIZIFCONF, &len) < 0)
		len = -1;
#elif HAVE_SIOCGLIFNUM
#error This code need to be checked
/*
	{ struct lifnum lifn;
	lifn.lifn_family = AF_UNSPEC;
	lifn.lifn_flags = LIFC_NOXMIT | LIFC_TEMPORARY | LIFC_ALLZONES;
	ifc.lifc_family = AF_UNSPEC;
	ifc.lifc_flags = LIFC_NOXMIT | LIFC_TEMPORARY | LIFC_ALLZONES;
	if (ioctl (fd, SIOCGLIFNUM, (char *)&lifn) < 0)
		len = -1;
	else
		len = lifn.lifn_count;
	}
*/
#endif

	// As a last resort, guess
	if (len < 0)
	len = 64;

	ifc.CNAME(ifc_len) = len * sizeof (struct CNAME(ifreq));
	ifc.CNAME(ifc_buf) = malloc (ifc.CNAME(ifc_len));

	if (!ifc.CNAME(ifc_buf)) {
		close (fd);
		rb_raise(rb_eRuntimeError, "Not enough memory");
		return Qnil;
	  }

#if HAVE_SIOCGLIFNUM
	if (ioctl (fd, SIOCGLIFCONF, &ifc) < 0) {
#else
	if (ioctl (fd, SIOCGIFCONF, &ifc) < 0) {

#endif
		free (ifc.CNAME(ifc_req));
		close (fd);
		rb_raise(rb_eRuntimeError, "Unknow error at OS level");
		return Qnil;
	}

	struct CNAME(ifreq) *pfreq = ifc.CNAME(ifc_req);

	for (n = 0; n < ifc.CNAME(ifc_len)/sizeof(struct CNAME(ifreq));n++,pfreq++) 
	{
		if (!prev_name || strncmp (prev_name, pfreq->CNAME(ifr_name), IFNAMSIZ) != 0) 
		{
			VALUE ifname =  rb_str_new2(pfreq->CNAME(ifr_name));
			if(!rb_ary_includes(result, ifname))
				rb_ary_push(result, ifname);

			prev_name = pfreq->CNAME(ifr_name);
		}
	}

	free (ifc.CNAME(ifc_buf));
	close (fd);

#endif //

	return result;
}


void
Init_netifaces()
{
	// Netifaces
	rb_cNetifaces = rb_define_class("Netifaces", rb_cObject);
	// methods
	rb_define_module_function(rb_cNetifaces, "version", rbnetifaces_s_version, 0);
	rb_define_module_function(rb_cNetifaces, "interfaces", rbnetifaces_s_interfaces, 0);
	rb_define_module_function(rb_cNetifaces, "addresses", rbnetifaces_s_addresses, 1);
	//constants
  /* Address families (auto-detect using #ifdef) */
#ifdef AF_UNSPEC  
	rb_define_const(rb_cNetifaces, "AF_UNSPEC", AF_UNSPEC);
#endif
#ifdef AF_UNIX
	rb_define_const(rb_cNetifaces, "AF_UNIX", AF_UNIX);
#endif
#ifdef AF_FILE
	rb_define_const(rb_cNetifaces, "AF_FILE", AF_FILE);
#endif
#ifdef AF_INET
	rb_define_const(rb_cNetifaces, "AF_INET", AF_INET);
#endif
#ifdef AF_AX25
	rb_define_const(rb_cNetifaces, "AF_AX25", AF_AX25);
#endif
#ifdef AF_IMPLINK  
	rb_define_const(rb_cNetifaces, "AF_IMPLINK", AF_IMPLINK);
#endif
#ifdef AF_PUP  
	rb_define_const(rb_cNetifaces, "AF_PUP", AF_PUP);
#endif
#ifdef AF_CHAOS
	rb_define_const(rb_cNetifaces, "AF_CHAOS", AF_CHAOS);
#endif
#ifdef AF_NS
	rb_define_const(rb_cNetifaces, "AF_NS", AF_NS);
#endif
#ifdef AF_ISO
	rb_define_const(rb_cNetifaces, "AF_ISO", AF_ISO);
#endif
#ifdef AF_ECMA
	rb_define_const(rb_cNetifaces, "AF_ECMA", AF_ECMA);
#endif
#ifdef AF_DATAKIT
	rb_define_const(rb_cNetifaces, "AF_DATAKIT", AF_DATAKIT);
#endif
#ifdef AF_CCITT
	rb_define_const(rb_cNetifaces, "AF_CCITT", AF_CCITT);
#endif
#ifdef AF_SNA
	rb_define_const(rb_cNetifaces, "AF_SNA", AF_SNA);
#endif
#ifdef AF_DECnet
	rb_define_const(rb_cNetifaces, "AF_DECnet", AF_DECnet);
#endif
#ifdef AF_DLI
	rb_define_const(rb_cNetifaces, "AF_DLI", AF_DLI);
#endif
#ifdef AF_LAT
	rb_define_const(rb_cNetifaces, "AF_LAT", AF_LAT);
#endif
#ifdef AF_HYLINK
	rb_define_const(rb_cNetifaces, "AF_HYLINK", AF_HYLINK);
#endif
#ifdef AF_APPLETALK
	rb_define_const(rb_cNetifaces, "AF_APPLETALK", AF_APPLETALK);
#endif
#ifdef AF_ROUTE
	rb_define_const(rb_cNetifaces, "AF_ROUTE", AF_ROUTE);
#endif
#ifdef AF_LINK
	rb_define_const(rb_cNetifaces, "AF_LINK", AF_LINK);
#endif
#ifdef AF_PACKET
	rb_define_const(rb_cNetifaces, "AF_PACKET", AF_PACKET);
#endif
#ifdef AF_COIP
	rb_define_const(rb_cNetifaces, "AF_COIP", AF_COIP);
#endif
#ifdef AF_CNT
	rb_define_const(rb_cNetifaces, "AF_CNT", AF_CNT);
#endif
#ifdef AF_IPX
	rb_define_const(rb_cNetifaces, "AF_IPX", AF_IPX);
#endif
#ifdef AF_SIP
	rb_define_const(rb_cNetifaces, "AF_SIP", AF_SIP);
#endif
#ifdef AF_NDRV
	rb_define_const(rb_cNetifaces, "AF_NDRV", AF_NDRV);
#endif
#ifdef AF_ISDN
	rb_define_const(rb_cNetifaces, "AF_ISDN", AF_ISDN);
#endif
#ifdef AF_INET6
	rb_define_const(rb_cNetifaces, "AF_INET6", AF_INET6);
#endif
#ifdef AF_NATM
	rb_define_const(rb_cNetifaces, "AF_NATM", AF_NATM);
#endif
#ifdef AF_SYSTEM
	rb_define_const(rb_cNetifaces, "AF_SYSTEM", AF_SYSTEM);
#endif
#ifdef AF_NETBIOS
	rb_define_const(rb_cNetifaces, "AF_NETBIOS", AF_NETBIOS);
#endif
#ifdef AF_NETBEUI
	rb_define_const(rb_cNetifaces, "AF_NETBEUI", AF_NETBEUI);
#endif
#ifdef AF_PPP
	rb_define_const(rb_cNetifaces, "AF_PPP", AF_PPP);
#endif
#ifdef AF_ATM
	rb_define_const(rb_cNetifaces, "AF_ATM", AF_ATM);
#endif
#ifdef AF_ATMPVC
	rb_define_const(rb_cNetifaces, "AF_ATMPVC", AF_ATMPVC);
#endif
#ifdef AF_ATMSVC
	rb_define_const(rb_cNetifaces, "AF_ATMSVC", AF_ATMSVC);
#endif
#ifdef AF_NETGRAPH
	rb_define_const(rb_cNetifaces, "AF_NETGRAPH", AF_NETGRAPH);
#endif
#ifdef AF_VOICEVIEW
	rb_define_const(rb_cNetifaces, "AF_VOICEVIEW", AF_VOICEVIEW);
#endif
#ifdef AF_FIREFOX
	rb_define_const(rb_cNetifaces, "AF_FIREFOX", AF_FIREFOX);
#endif
#ifdef AF_UNKNOWN1
	rb_define_const(rb_cNetifaces, "AF_UNKNOWN1", AF_UNKNOWN1);
#endif
#ifdef AF_BAN
	rb_define_const(rb_cNetifaces, "AF_BAN", AF_BAN);
#endif
#ifdef AF_CLUSTER
	rb_define_const(rb_cNetifaces, "AF_CLUSTER", AF_CLUSTER);
#endif
#ifdef AF_12844
	rb_define_const(rb_cNetifaces, "AF_12844", AF_12844);
#endif
#ifdef AF_IRDA
	rb_define_const(rb_cNetifaces, "AF_IRDA", AF_IRDA);
#endif
#ifdef AF_NETDES
	rb_define_const(rb_cNetifaces, "AF_NETDES", AF_NETDES);
#endif
#ifdef AF_NETROM
	rb_define_const(rb_cNetifaces, "AF_NETROM", AF_NETROM);
#endif
#ifdef AF_BRIDGE
	rb_define_const(rb_cNetifaces, "AF_BRIDGE", AF_BRIDGE);
#endif
#ifdef AF_X25
	rb_define_const(rb_cNetifaces, "AF_X25", AF_X25);
#endif
#ifdef AF_ROSE
	rb_define_const(rb_cNetifaces, "AF_ROSE", AF_ROSE);
#endif
#ifdef AF_SECURITY
	rb_define_const(rb_cNetifaces, "AF_SECURITY", AF_SECURITY);
#endif
#ifdef AF_KEY
	rb_define_const(rb_cNetifaces, "AF_KEY", AF_KEY);
#endif
#ifdef AF_NETLINK
	rb_define_const(rb_cNetifaces, "AF_NETLINK", AF_NETLINK);
#endif
#ifdef AF_ASH
	rb_define_const(rb_cNetifaces, "AF_ASH", AF_ASH);
#endif
#ifdef AF_ECONET
	rb_define_const(rb_cNetifaces, "AF_ECONET", AF_ECONET);
#endif
#ifdef AF_PPPOX
	rb_define_const(rb_cNetifaces, "AF_PPPOX", AF_PPPOX);
#endif
#ifdef AF_WANPIPE
	rb_define_const(rb_cNetifaces, "AF_WANPIPE", AF_WANPIPE);
#endif
#ifdef AF_BLUETOOTH
	rb_define_const(rb_cNetifaces, "AF_BLUETOOTH", AF_BLUETOOTH);
#endif
}
