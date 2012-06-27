require 'mkmf'

@supported_archs = ["i386-mingw32", "i486-linux", "universal-darwin10.0", "i386-openbsd4.8","i386-freebsd8"]
#uncoment to force ioctl on non windows systems
#@force_ioctl = true
@headers = [	'net/if_dl.h', 'netash/ash.h',
		'netatalk/at.h', 'netax25/ax25.h',
		'neteconet/ec.h', 'netipx/ipx.h',
		'netpacket/packet.h', 'netrose/rose.h'
	]
if RUBY_PLATFORM =~ /linux/
	@headers += [	'linux/irda.h', 'linux/atm.h',
			'linux/llc.h', 'linux/tipc.h',
			'linux/dn.h']
end

@optional_headers = []
@additionnal_headers = ["sys/types.h","sys/socket.h","sys/un.h","net/if.h","netinet/in.h"]

def check_optionnal_headers  
	@headers.each do |header|
		if have_header(header)
			@optional_headers.push(header)
		end
	end
end



def check_sockaddr_len
	# On certain platforms (Linux), there's no sa_len.
	# Unfortunately, getifaddrs() doesn't return the
	# lengths, because they're in the sa_len field on just about
	# everything but Linux.
	#In this case we will define a macro that will return the sa_len from 
	#the sockaddr_xx structure if they are available

	additionnal_headers =  ["sys/types.h","sys/socket.h","sys/un.h","net/if.h","netinet/in.h"]
	sockaddrs = [	'at', 'ax25', 'dl', 'eon', 'in', 'in6',
			'inarp', 'ipx', 'iso', 'ns', 'un', 'x25',
			'rose', 'ash', 'ec', 'll', 'atmpvc', 'atmsvc',
			'dn', 'irda', 'llc']
	if (!have_struct_member("struct sockaddr", "sa_len", ["sys/types.h","sys/socket.h","net/if.h"]))
		sockaddrs.each do |sockaddr|
			have_type("struct sockaddr_" +  sockaddr, @additionnal_headers + @optional_headers)
		end	
	end
end

# Used when no getifaddrs has been found 
def check_ioctls
	ioctls = [
		'SIOCGIFCONF',
		'SIOCGSIZIFCONF',
		'SIOCGIFHWADDR',
		'SIOCGIFADDR',
		'SIOCGIFFLAGS',
		'SIOCGIFDSTADDR',
		'SIOCGIFBRDADDR',
		'SIOCGIFNETMASK',
		'SIOCGLIFNUM',
		'SIOCGLIFCONF',
		'SIOCGLIFFLAGS'
		]
	ioctls_headers = [
			'sys/types.h',
			'sys/socket.h',
			'sys/ioctl.h',
			'net/if.h',
			'netinet/in.h',
			'arpa/inet.h'
			]
=begin
                if mos.startswith('sunos'):
                    added_includes = """
                     #include <unistd.h>
                     #include <stropts.h>
                     #include <sys/sockio.h>
                    """
=end
	$defs.push '-DHAVE_SOCKET_IOCTLS'
	ioctls.each do |ioctl|
		if have_macro(ioctl, ioctls_headers)
			$defs.push "-DHAVE_#{ioctl}" 
		end

	end
end

puts("platform is #{RUBY_PLATFORM}")

puts "[*] Warning : this platform as not been tested, if you manage to get netifaces running correctly send me an email" +
	" at alex_maloteaux'_at_'metasploit.com" unless @supported_archs.include? RUBY_PLATFORM

if RUBY_PLATFORM =~ /i386-mingw32/

	unless  have_library("ws2_32" ) and 
		have_library("iphlpapi") and 
		have_header("windows.h") and 
		have_header("winsock2.h") and 
		have_header("iphlpapi.h")
			puts "\nNot all dependencies are satisfied, please check logs"
			exit
	end
	

else
	unless @force_ioctl
		need_ioctl =  !(have_func("getifaddrs"))
	end
	have_func("getnameinfo")
	if need_ioctl or @force_ioctl
		check_ioctls
	end
	check_optionnal_headers
	check_sockaddr_len
end

$CFLAGS += " -DRUBY_19" if ( RUBY_VERSION =~ /^1\.9/ )

#rework the defs to make them compatible with the original netifaces.c code 
$defs = $defs.map do |a| 
			if a =~ /^-DHAVE_TYPE_STRUCT_SOCKADDR_.*$/ then a.gsub("TYPE_STRUCT_","")
			elsif a == "-DHAVE_ST_SA_LEN" then a.gsub("HAVE_ST_","HAVE_SOCKADDR_")
			else a
			end 	
		  end

create_makefile('netifaces')
