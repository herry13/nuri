--- variables
$.hpvm16|$.Machine|$.hpvm16|-|final
	[$.hpvm16]
$.hpvm16.running|$.Boolean|true|-|notfinal
	[true,false]
$.hpvm16.nuri_latest|$.Boolean|true|-|notfinal
	[true,false]
$.hpvm16.memory_total|$.Integer|503456|-|notfinal
	[503456]
$.hpvm16.memory_free|$.Integer|50884|-|notfinal
	[50884]
$.hpvm16.os|$.String|linux|-|notfinal
	[linux]
$.hpvm16.platform|$.String|ubuntu|-|notfinal
	[ubuntu]
$.hpvm16.hostname|$.String|hpvm16|-|notfinal
	[hpvm16]
$.hpvm16.domainname|$.String|hpvm16.inf.ed.ac.uk|-|notfinal
	[hpvm16.inf.ed.ac.uk]
$.hpvm16.version|$.String|3.2.0-25-generic|-|notfinal
	[3.2.0-25-generic]
$.hpvm16.arch|$.String|x86_64|-|notfinal
	[x86_64]
$.hpvm16.cpus|$.Integer|1|-|notfinal
	[1]
$.hpvm16.tikiwiki|$.Tikiwiki|$.hpvm16.tikiwiki|-|final
	[$.hpvm16.tikiwiki]
$.hpvm16.tikiwiki.installed|$.Boolean|false|-|notfinal
	[true,false]
$.hpvm16.tikiwiki.version|$.String||-|notfinal
	[linux,ubuntu,hpvm16,hpvm16.inf.ed.ac.uk,3.2.0-25-generic,x86_64,,/var/www,root,5.5.24-0ubuntu0.12.04.1,2.2.22-1ubuntu1,hpvm17,hpvm17.inf.ed.ac.uk]
$.hpvm16.tikiwiki.path|$.String||-|notfinal
	[linux,ubuntu,hpvm16,hpvm16.inf.ed.ac.uk,3.2.0-25-generic,x86_64,,/var/www,root,5.5.24-0ubuntu0.12.04.1,2.2.22-1ubuntu1,hpvm17,hpvm17.inf.ed.ac.uk]
$.hpvm16.tikiwiki.webserver|$.Apache|null|-|notfinal
	[null,$.hpvm16.apache,$.hpvm17.apache]
$.hpvm16.tikiwiki.database|$.Mysql|null|-|notfinal
	[null,$.hpvm16.mysql,$.hpvm17.mysql]
$.hpvm16.apache|$.Apache|$.hpvm16.apache|-|final
	[$.hpvm16.apache]
$.hpvm16.apache.port|$.Integer|0|-|notfinal
	[503456,50884,1,0,3306,58248,80]
$.hpvm16.apache.document_root|$.String|/var/www|-|notfinal
	[linux,ubuntu,hpvm16,hpvm16.inf.ed.ac.uk,3.2.0-25-generic,x86_64,,/var/www,root,5.5.24-0ubuntu0.12.04.1,2.2.22-1ubuntu1,hpvm17,hpvm17.inf.ed.ac.uk]
$.hpvm16.apache.php_module|$.Boolean|false|-|notfinal
	[true,false]
$.hpvm16.apache.php_mysql_module|$.Boolean|false|-|notfinal
	[true,false]
$.hpvm16.apache.installed|$.Boolean|false|false|notfinal
	[true,false]
$.hpvm16.apache.running|$.Boolean|false|-|notfinal
	[true,false]
$.hpvm16.apache.version|$.String||-|notfinal
	[]
$.hpvm16.apache.docment_root|$.String||-|notfinal
	[]
$.hpvm16.mysql|$.Mysql|$.hpvm16.mysql|-|final
	[$.hpvm16.mysql]
$.hpvm16.mysql.port|$.Integer|3306|-|notfinal
	[503456,50884,1,0,3306,58248,80]
$.hpvm16.mysql.root_password|$.String|root|root|notfinal
	[linux,ubuntu,hpvm16,hpvm16.inf.ed.ac.uk,3.2.0-25-generic,x86_64,,/var/www,root,5.5.24-0ubuntu0.12.04.1,2.2.22-1ubuntu1,hpvm17,hpvm17.inf.ed.ac.uk]
$.hpvm16.mysql.installed|$.Boolean|true|-|notfinal
	[true,false]
$.hpvm16.mysql.running|$.Boolean|true|-|notfinal
	[true,false]
$.hpvm16.mysql.version|$.String|5.5.24-0ubuntu0.12.04.1|-|notfinal
	[5.5.24-0ubuntu0.12.04.1]
$.hpvm17|$.Machine|$.hpvm17|-|final
	[$.hpvm17]
$.hpvm17.nuri_latest|$.Boolean|true|-|notfinal
	[true,false]
$.hpvm17.memory_free|$.Integer|58248|-|notfinal
	[58248]
$.hpvm17.mysql|$.Mysql|$.hpvm17.mysql|-|final
	[$.hpvm17.mysql]
$.hpvm17.mysql.root_password|$.String||-|notfinal
	[linux,ubuntu,hpvm16,hpvm16.inf.ed.ac.uk,3.2.0-25-generic,x86_64,,/var/www,root,5.5.24-0ubuntu0.12.04.1,2.2.22-1ubuntu1,hpvm17,hpvm17.inf.ed.ac.uk]
$.hpvm17.mysql.version|$.String||-|notfinal
	[]
$.hpvm17.mysql.installed|$.Boolean|false|false|notfinal
	[true,false]
$.hpvm17.mysql.running|$.Boolean|false|-|notfinal
	[true,false]
$.hpvm17.mysql.port|$.Integer|3306|-|notfinal
	[503456,50884,1,0,3306,58248,80]
$.hpvm17.apache|$.Apache|$.hpvm17.apache|-|final
	[$.hpvm17.apache]
$.hpvm17.apache.php_module|$.Boolean|true|true|notfinal
	[true,false]
$.hpvm17.apache.document_root|$.String|/var/www|/var/www|notfinal
	[linux,ubuntu,hpvm16,hpvm16.inf.ed.ac.uk,3.2.0-25-generic,x86_64,,/var/www,root,5.5.24-0ubuntu0.12.04.1,2.2.22-1ubuntu1,hpvm17,hpvm17.inf.ed.ac.uk]
$.hpvm17.apache.version|$.String|2.2.22-1ubuntu1|-|notfinal
	[2.2.22-1ubuntu1]
$.hpvm17.apache.php_mysql_module|$.Boolean|true|true|notfinal
	[true,false]
$.hpvm17.apache.installed|$.Boolean|true|-|notfinal
	[true,false]
$.hpvm17.apache.running|$.Boolean|false|true|notfinal
	[true,false]
$.hpvm17.apache.port|$.Integer|80|80|notfinal
	[503456,50884,1,0,3306,58248,80]
$.hpvm17.os|$.String|linux|-|notfinal
	[linux]
$.hpvm17.memory_total|$.Integer|503456|-|notfinal
	[503456]
$.hpvm17.version|$.String|3.2.0-25-generic|-|notfinal
	[3.2.0-25-generic]
$.hpvm17.arch|$.String|x86_64|-|notfinal
	[x86_64]
$.hpvm17.cpus|$.Integer|1|-|notfinal
	[1]
$.hpvm17.platform|$.String|ubuntu|-|notfinal
	[ubuntu]
$.hpvm17.hostname|$.String|hpvm17|-|notfinal
	[hpvm17]
$.hpvm17.running|$.Boolean|true|-|notfinal
	[true,false]
$.hpvm17.tikiwiki|$.Tikiwiki|$.hpvm17.tikiwiki|-|final
	[$.hpvm17.tikiwiki]
$.hpvm17.tikiwiki.version|$.String||-|notfinal
	[linux,ubuntu,hpvm16,hpvm16.inf.ed.ac.uk,3.2.0-25-generic,x86_64,,/var/www,root,5.5.24-0ubuntu0.12.04.1,2.2.22-1ubuntu1,hpvm17,hpvm17.inf.ed.ac.uk]
$.hpvm17.tikiwiki.database|$.Mysql|null|$.hpvm16.mysql|notfinal
	[null,$.hpvm16.mysql,$.hpvm17.mysql]
$.hpvm17.tikiwiki.webserver|$.Apache|null|$.hpvm17.apache|notfinal
	[null,$.hpvm16.apache,$.hpvm17.apache]
$.hpvm17.tikiwiki.installed|$.Boolean|false|true|notfinal
	[true,false]
$.hpvm17.tikiwiki.path|$.String||-|notfinal
	[linux,ubuntu,hpvm16,hpvm16.inf.ed.ac.uk,3.2.0-25-generic,x86_64,,/var/www,root,5.5.24-0ubuntu0.12.04.1,2.2.22-1ubuntu1,hpvm17,hpvm17.inf.ed.ac.uk]
$.hpvm17.domainname|$.String|hpvm17.inf.ed.ac.uk|-|notfinal
	[hpvm17.inf.ed.ac.uk]
_global_var|$.Boolean|false|true|notfinal
	[true,false]
begin_version
3
end_version
begin_metric
1
end_metric
66
begin_variable
var_0$.hpvm16
-1
1
$.hpvm16
end_variable
begin_variable
var_1$.hpvm16.apache
-1
1
$.hpvm16.apache
end_variable
begin_variable
var_2$.hpvm16.apache.docment_root
-1
1
""
end_variable
begin_variable
var_3$.hpvm16.apache.document_root
-1
13
"linux"
"ubuntu"
"hpvm16"
"hpvm16.inf.ed.ac.uk"
"3.2.0-25-generic"
"x86_64"
""
"/var/www"
"root"
"5.5.24-0ubuntu0.12.04.1"
"2.2.22-1ubuntu1"
"hpvm17"
"hpvm17.inf.ed.ac.uk"
end_variable
begin_variable
var_4$.hpvm16.apache.installed
-1
2
true
false
end_variable
begin_variable
var_5$.hpvm16.apache.php_module
-1
2
true
false
end_variable
begin_variable
var_6$.hpvm16.apache.php_mysql_module
-1
2
true
false
end_variable
begin_variable
var_7$.hpvm16.apache.port
-1
7
503456
50884
1
0
3306
58248
80
end_variable
begin_variable
var_8$.hpvm16.apache.running
-1
2
true
false
end_variable
begin_variable
var_9$.hpvm16.apache.version
-1
1
""
end_variable
begin_variable
var_10$.hpvm16.arch
-1
1
"x86_64"
end_variable
begin_variable
var_11$.hpvm16.cpus
-1
1
1
end_variable
begin_variable
var_12$.hpvm16.domainname
-1
1
"hpvm16.inf.ed.ac.uk"
end_variable
begin_variable
var_13$.hpvm16.hostname
-1
1
"hpvm16"
end_variable
begin_variable
var_14$.hpvm16.memory_free
-1
1
50884
end_variable
begin_variable
var_15$.hpvm16.memory_total
-1
1
503456
end_variable
begin_variable
var_16$.hpvm16.mysql
-1
1
$.hpvm16.mysql
end_variable
begin_variable
var_17$.hpvm16.mysql.installed
-1
2
true
false
end_variable
begin_variable
var_18$.hpvm16.mysql.port
-1
7
503456
50884
1
0
3306
58248
80
end_variable
begin_variable
var_19$.hpvm16.mysql.root_password
-1
13
"linux"
"ubuntu"
"hpvm16"
"hpvm16.inf.ed.ac.uk"
"3.2.0-25-generic"
"x86_64"
""
"/var/www"
"root"
"5.5.24-0ubuntu0.12.04.1"
"2.2.22-1ubuntu1"
"hpvm17"
"hpvm17.inf.ed.ac.uk"
end_variable
begin_variable
var_20$.hpvm16.mysql.running
-1
2
true
false
end_variable
begin_variable
var_21$.hpvm16.mysql.version
-1
1
"5.5.24-0ubuntu0.12.04.1"
end_variable
begin_variable
var_22$.hpvm16.nuri_latest
-1
2
true
false
end_variable
begin_variable
var_23$.hpvm16.os
-1
1
"linux"
end_variable
begin_variable
var_24$.hpvm16.platform
-1
1
"ubuntu"
end_variable
begin_variable
var_25$.hpvm16.running
-1
2
true
false
end_variable
begin_variable
var_26$.hpvm16.tikiwiki
-1
1
$.hpvm16.tikiwiki
end_variable
begin_variable
var_27$.hpvm16.tikiwiki.database
-1
3
null
$.hpvm16.mysql
$.hpvm17.mysql
end_variable
begin_variable
var_28$.hpvm16.tikiwiki.installed
-1
2
true
false
end_variable
begin_variable
var_29$.hpvm16.tikiwiki.path
-1
13
"linux"
"ubuntu"
"hpvm16"
"hpvm16.inf.ed.ac.uk"
"3.2.0-25-generic"
"x86_64"
""
"/var/www"
"root"
"5.5.24-0ubuntu0.12.04.1"
"2.2.22-1ubuntu1"
"hpvm17"
"hpvm17.inf.ed.ac.uk"
end_variable
begin_variable
var_30$.hpvm16.tikiwiki.version
-1
13
"linux"
"ubuntu"
"hpvm16"
"hpvm16.inf.ed.ac.uk"
"3.2.0-25-generic"
"x86_64"
""
"/var/www"
"root"
"5.5.24-0ubuntu0.12.04.1"
"2.2.22-1ubuntu1"
"hpvm17"
"hpvm17.inf.ed.ac.uk"
end_variable
begin_variable
var_31$.hpvm16.tikiwiki.webserver
-1
3
null
$.hpvm16.apache
$.hpvm17.apache
end_variable
begin_variable
var_32$.hpvm16.version
-1
1
"3.2.0-25-generic"
end_variable
begin_variable
var_33$.hpvm17
-1
1
$.hpvm17
end_variable
begin_variable
var_34$.hpvm17.apache
-1
1
$.hpvm17.apache
end_variable
begin_variable
var_35$.hpvm17.apache.document_root
-1
13
"linux"
"ubuntu"
"hpvm16"
"hpvm16.inf.ed.ac.uk"
"3.2.0-25-generic"
"x86_64"
""
"/var/www"
"root"
"5.5.24-0ubuntu0.12.04.1"
"2.2.22-1ubuntu1"
"hpvm17"
"hpvm17.inf.ed.ac.uk"
end_variable
begin_variable
var_36$.hpvm17.apache.installed
-1
2
true
false
end_variable
begin_variable
var_37$.hpvm17.apache.php_module
-1
2
true
false
end_variable
begin_variable
var_38$.hpvm17.apache.php_mysql_module
-1
2
true
false
end_variable
begin_variable
var_39$.hpvm17.apache.port
-1
7
503456
50884
1
0
3306
58248
80
end_variable
begin_variable
var_40$.hpvm17.apache.running
-1
2
true
false
end_variable
begin_variable
var_41$.hpvm17.apache.version
-1
1
"2.2.22-1ubuntu1"
end_variable
begin_variable
var_42$.hpvm17.arch
-1
1
"x86_64"
end_variable
begin_variable
var_43$.hpvm17.cpus
-1
1
1
end_variable
begin_variable
var_44$.hpvm17.domainname
-1
1
"hpvm17.inf.ed.ac.uk"
end_variable
begin_variable
var_45$.hpvm17.hostname
-1
1
"hpvm17"
end_variable
begin_variable
var_46$.hpvm17.memory_free
-1
1
58248
end_variable
begin_variable
var_47$.hpvm17.memory_total
-1
1
503456
end_variable
begin_variable
var_48$.hpvm17.mysql
-1
1
$.hpvm17.mysql
end_variable
begin_variable
var_49$.hpvm17.mysql.installed
-1
2
true
false
end_variable
begin_variable
var_50$.hpvm17.mysql.port
-1
7
503456
50884
1
0
3306
58248
80
end_variable
begin_variable
var_51$.hpvm17.mysql.root_password
-1
13
"linux"
"ubuntu"
"hpvm16"
"hpvm16.inf.ed.ac.uk"
"3.2.0-25-generic"
"x86_64"
""
"/var/www"
"root"
"5.5.24-0ubuntu0.12.04.1"
"2.2.22-1ubuntu1"
"hpvm17"
"hpvm17.inf.ed.ac.uk"
end_variable
begin_variable
var_52$.hpvm17.mysql.running
-1
2
true
false
end_variable
begin_variable
var_53$.hpvm17.mysql.version
-1
1
""
end_variable
begin_variable
var_54$.hpvm17.nuri_latest
-1
2
true
false
end_variable
begin_variable
var_55$.hpvm17.os
-1
1
"linux"
end_variable
begin_variable
var_56$.hpvm17.platform
-1
1
"ubuntu"
end_variable
begin_variable
var_57$.hpvm17.running
-1
2
true
false
end_variable
begin_variable
var_58$.hpvm17.tikiwiki
-1
1
$.hpvm17.tikiwiki
end_variable
begin_variable
var_59$.hpvm17.tikiwiki.database
-1
3
null
$.hpvm16.mysql
$.hpvm17.mysql
end_variable
begin_variable
var_60$.hpvm17.tikiwiki.installed
-1
2
true
false
end_variable
begin_variable
var_61$.hpvm17.tikiwiki.path
-1
13
"linux"
"ubuntu"
"hpvm16"
"hpvm16.inf.ed.ac.uk"
"3.2.0-25-generic"
"x86_64"
""
"/var/www"
"root"
"5.5.24-0ubuntu0.12.04.1"
"2.2.22-1ubuntu1"
"hpvm17"
"hpvm17.inf.ed.ac.uk"
end_variable
begin_variable
var_62$.hpvm17.tikiwiki.version
-1
13
"linux"
"ubuntu"
"hpvm16"
"hpvm16.inf.ed.ac.uk"
"3.2.0-25-generic"
"x86_64"
""
"/var/www"
"root"
"5.5.24-0ubuntu0.12.04.1"
"2.2.22-1ubuntu1"
"hpvm17"
"hpvm17.inf.ed.ac.uk"
end_variable
begin_variable
var_63$.hpvm17.tikiwiki.webserver
-1
3
null
$.hpvm16.apache
$.hpvm17.apache
end_variable
begin_variable
var_64$.hpvm17.version
-1
1
"3.2.0-25-generic"
end_variable
begin_variable
var_65_global_var
-1
2
true
false
end_variable
0
begin_state
0
0
0
7
1
1
1
3
1
0
0
0
0
0
0
0
0
0
4
8
0
0
0
0
0
0
0
0
1
6
6
0
0
0
0
7
0
0
0
6
1
0
0
0
0
0
0
0
0
1
4
6
1
0
0
0
0
0
0
0
1
6
6
0
0
1
end_state
begin_goal
12
4 1
19 8
35 7
37 0
38 0
39 6
40 0
49 1
59 1
60 0
63 2
65 0
end_goal
163
begin_operator
op_0-globalop-
0
1
0 65 1 0
0
end_operator
begin_operator
op_1$.hpvm16.upgrade_nuri
0
2
0 22 -1 0
0 65 0 1
1
end_operator
begin_operator
op_2$.hpvm16.start
0
2
0 25 -1 0
0 65 0 1
1
end_operator
begin_operator
op_3$.hpvm16.stop
0
2
0 25 -1 1
0 65 0 1
1
end_operator
begin_operator
op_4$.hpvm16.tikiwiki.set_webserver $.target=$.hpvm16.apache
0
2
0 31 -1 1
0 65 0 1
1
end_operator
begin_operator
op_5$.hpvm16.tikiwiki.set_webserver $.target=$.hpvm17.apache
0
2
0 31 -1 2
0 65 0 1
1
end_operator
begin_operator
op_6$.hpvm16.tikiwiki.set_database $.target=$.hpvm16.mysql
0
2
0 27 -1 1
0 65 0 1
1
end_operator
begin_operator
op_7$.hpvm16.tikiwiki.set_database $.target=$.hpvm17.mysql
0
2
0 27 -1 2
0 65 0 1
1
end_operator
begin_operator
op_8$.hpvm16.tikiwiki.install
0
2
0 28 -1 0
0 65 0 1
1
end_operator
begin_operator
op_9$.hpvm16.tikiwiki.uninstall
0
2
0 28 -1 0
0 65 0 1
1
end_operator
begin_operator
op_10$.hpvm16.tikiwiki.change_path $.target=linux
0
2
0 29 -1 0
0 65 0 1
1
end_operator
begin_operator
op_11$.hpvm16.tikiwiki.change_path $.target=ubuntu
0
2
0 29 -1 1
0 65 0 1
1
end_operator
begin_operator
op_12$.hpvm16.tikiwiki.change_path $.target=hpvm16
0
2
0 29 -1 2
0 65 0 1
1
end_operator
begin_operator
op_13$.hpvm16.tikiwiki.change_path $.target=hpvm16.inf.ed.ac.uk
0
2
0 29 -1 3
0 65 0 1
1
end_operator
begin_operator
op_14$.hpvm16.tikiwiki.change_path $.target=3.2.0-25-generic
0
2
0 29 -1 4
0 65 0 1
1
end_operator
begin_operator
op_15$.hpvm16.tikiwiki.change_path $.target=x86_64
0
2
0 29 -1 5
0 65 0 1
1
end_operator
begin_operator
op_16$.hpvm16.tikiwiki.change_path $.target=
0
2
0 29 -1 6
0 65 0 1
1
end_operator
begin_operator
op_17$.hpvm16.tikiwiki.change_path $.target=/var/www
0
2
0 29 -1 7
0 65 0 1
1
end_operator
begin_operator
op_18$.hpvm16.tikiwiki.change_path $.target=root
0
2
0 29 -1 8
0 65 0 1
1
end_operator
begin_operator
op_19$.hpvm16.tikiwiki.change_path $.target=5.5.24-0ubuntu0.12.04.1
0
2
0 29 -1 9
0 65 0 1
1
end_operator
begin_operator
op_20$.hpvm16.tikiwiki.change_path $.target=2.2.22-1ubuntu1
0
2
0 29 -1 10
0 65 0 1
1
end_operator
begin_operator
op_21$.hpvm16.tikiwiki.change_path $.target=hpvm17
0
2
0 29 -1 11
0 65 0 1
1
end_operator
begin_operator
op_22$.hpvm16.tikiwiki.change_path $.target=hpvm17.inf.ed.ac.uk
0
2
0 29 -1 12
0 65 0 1
1
end_operator
begin_operator
op_23$.hpvm16.tikiwiki.upgrade $.target=503456
0
2
30 -1
0 65 0 1
1
end_operator
begin_operator
op_24$.hpvm16.tikiwiki.upgrade $.target=50884
0
2
30 -1
0 65 0 1
1
end_operator
begin_operator
op_25$.hpvm16.tikiwiki.upgrade $.target=1
0
2
30 -1
0 65 0 1
1
end_operator
begin_operator
op_26$.hpvm16.tikiwiki.upgrade $.target=0
0
2
30 -1
0 65 0 1
1
end_operator
begin_operator
op_27$.hpvm16.tikiwiki.upgrade $.target=3306
0
2
30 -1
0 65 0 1
1
end_operator
begin_operator
op_28$.hpvm16.tikiwiki.upgrade $.target=58248
0
2
30 -1
0 65 0 1
1
end_operator
begin_operator
op_29$.hpvm16.tikiwiki.upgrade $.target=80
0
2
30 -1
0 65 0 1
1
end_operator
begin_operator
op_30$.hpvm16.apache.set_document_root $.target=linux
1
8 1
2
0 3 -1 0
0 65 0 1
1
end_operator
begin_operator
op_31$.hpvm16.apache.set_document_root $.target=ubuntu
1
8 1
2
0 3 -1 1
0 65 0 1
1
end_operator
begin_operator
op_32$.hpvm16.apache.set_document_root $.target=hpvm16
1
8 1
2
0 3 -1 2
0 65 0 1
1
end_operator
begin_operator
op_33$.hpvm16.apache.set_document_root $.target=hpvm16.inf.ed.ac.uk
1
8 1
2
0 3 -1 3
0 65 0 1
1
end_operator
begin_operator
op_34$.hpvm16.apache.set_document_root $.target=3.2.0-25-generic
1
8 1
2
0 3 -1 4
0 65 0 1
1
end_operator
begin_operator
op_35$.hpvm16.apache.set_document_root $.target=x86_64
1
8 1
2
0 3 -1 5
0 65 0 1
1
end_operator
begin_operator
op_36$.hpvm16.apache.set_document_root $.target=
1
8 1
2
0 3 -1 6
0 65 0 1
1
end_operator
begin_operator
op_37$.hpvm16.apache.set_document_root $.target=/var/www
1
8 1
2
0 3 -1 7
0 65 0 1
1
end_operator
begin_operator
op_38$.hpvm16.apache.set_document_root $.target=root
1
8 1
2
0 3 -1 8
0 65 0 1
1
end_operator
begin_operator
op_39$.hpvm16.apache.set_document_root $.target=5.5.24-0ubuntu0.12.04.1
1
8 1
2
0 3 -1 9
0 65 0 1
1
end_operator
begin_operator
op_40$.hpvm16.apache.set_document_root $.target=2.2.22-1ubuntu1
1
8 1
2
0 3 -1 10
0 65 0 1
1
end_operator
begin_operator
op_41$.hpvm16.apache.set_document_root $.target=hpvm17
1
8 1
2
0 3 -1 11
0 65 0 1
1
end_operator
begin_operator
op_42$.hpvm16.apache.set_document_root $.target=hpvm17.inf.ed.ac.uk
1
8 1
2
0 3 -1 12
0 65 0 1
1
end_operator
begin_operator
op_43$.hpvm16.apache.uninstall
3
8 1
5 1
6 1
2
0 4 -1 1
0 65 0 1
1
end_operator
begin_operator
op_44$.hpvm16.apache.install_php_module
2
4 0
8 1
2
0 5 -1 0
0 65 0 1
1
end_operator
begin_operator
op_45$.hpvm16.apache.uninstall_php_module
1
8 1
2
0 5 -1 1
0 65 0 1
1
end_operator
begin_operator
op_46$.hpvm16.apache.install_php_mysql_module
2
4 0
8 1
2
0 6 -1 0
0 65 0 1
1
end_operator
begin_operator
op_47$.hpvm16.apache.uninstall_php_mysql_module
1
8 1
2
0 6 -1 1
0 65 0 1
1
end_operator
begin_operator
op_48$.hpvm16.apache.install
0
2
0 4 -1 0
0 65 0 1
1
end_operator
begin_operator
op_49$.hpvm16.apache.start
1
4 0
2
0 8 -1 0
0 65 0 1
1
end_operator
begin_operator
op_50$.hpvm16.apache.stop
0
2
0 8 -1 1
0 65 0 1
1
end_operator
begin_operator
op_51$.hpvm16.apache.set_port $.target=503456
2
4 0
8 1
2
0 7 -1 0
0 65 0 1
1
end_operator
begin_operator
op_52$.hpvm16.apache.set_port $.target=50884
2
4 0
8 1
2
0 7 -1 1
0 65 0 1
1
end_operator
begin_operator
op_53$.hpvm16.apache.set_port $.target=1
2
4 0
8 1
2
0 7 -1 2
0 65 0 1
1
end_operator
begin_operator
op_54$.hpvm16.apache.set_port $.target=0
2
4 0
8 1
2
0 7 -1 3
0 65 0 1
1
end_operator
begin_operator
op_55$.hpvm16.apache.set_port $.target=3306
2
4 0
8 1
2
0 7 -1 4
0 65 0 1
1
end_operator
begin_operator
op_56$.hpvm16.apache.set_port $.target=58248
2
4 0
8 1
2
0 7 -1 5
0 65 0 1
1
end_operator
begin_operator
op_57$.hpvm16.apache.set_port $.target=80
2
4 0
8 1
2
0 7 -1 6
0 65 0 1
1
end_operator
begin_operator
op_58$.hpvm16.mysql.set_root_password $.passwd=linux
1
20 0
2
0 19 -1 0
0 65 0 1
1
end_operator
begin_operator
op_59$.hpvm16.mysql.set_root_password $.passwd=ubuntu
1
20 0
2
0 19 -1 1
0 65 0 1
1
end_operator
begin_operator
op_60$.hpvm16.mysql.set_root_password $.passwd=hpvm16
1
20 0
2
0 19 -1 2
0 65 0 1
1
end_operator
begin_operator
op_61$.hpvm16.mysql.set_root_password $.passwd=hpvm16.inf.ed.ac.uk
1
20 0
2
0 19 -1 3
0 65 0 1
1
end_operator
begin_operator
op_62$.hpvm16.mysql.set_root_password $.passwd=3.2.0-25-generic
1
20 0
2
0 19 -1 4
0 65 0 1
1
end_operator
begin_operator
op_63$.hpvm16.mysql.set_root_password $.passwd=x86_64
1
20 0
2
0 19 -1 5
0 65 0 1
1
end_operator
begin_operator
op_64$.hpvm16.mysql.set_root_password $.passwd=
1
20 0
2
0 19 -1 6
0 65 0 1
1
end_operator
begin_operator
op_65$.hpvm16.mysql.set_root_password $.passwd=/var/www
1
20 0
2
0 19 -1 7
0 65 0 1
1
end_operator
begin_operator
op_66$.hpvm16.mysql.set_root_password $.passwd=root
1
20 0
2
0 19 -1 8
0 65 0 1
1
end_operator
begin_operator
op_67$.hpvm16.mysql.set_root_password $.passwd=5.5.24-0ubuntu0.12.04.1
1
20 0
2
0 19 -1 9
0 65 0 1
1
end_operator
begin_operator
op_68$.hpvm16.mysql.set_root_password $.passwd=2.2.22-1ubuntu1
1
20 0
2
0 19 -1 10
0 65 0 1
1
end_operator
begin_operator
op_69$.hpvm16.mysql.set_root_password $.passwd=hpvm17
1
20 0
2
0 19 -1 11
0 65 0 1
1
end_operator
begin_operator
op_70$.hpvm16.mysql.set_root_password $.passwd=hpvm17.inf.ed.ac.uk
1
20 0
2
0 19 -1 12
0 65 0 1
1
end_operator
begin_operator
op_71$.hpvm16.mysql.install
0
2
0 17 -1 0
0 65 0 1
1
end_operator
begin_operator
op_72$.hpvm16.mysql.uninstall
1
20 1
2
0 17 -1 1
0 65 0 1
1
end_operator
begin_operator
op_73$.hpvm16.mysql.start
1
17 0
2
0 20 -1 0
0 65 0 1
1
end_operator
begin_operator
op_74$.hpvm16.mysql.stop
0
2
0 20 -1 1
0 65 0 1
1
end_operator
begin_operator
op_75$.hpvm16.mysql.set_port $.target=503456
2
17 0
20 1
2
0 18 -1 0
0 65 0 1
1
end_operator
begin_operator
op_76$.hpvm16.mysql.set_port $.target=50884
2
17 0
20 1
2
0 18 -1 1
0 65 0 1
1
end_operator
begin_operator
op_77$.hpvm16.mysql.set_port $.target=1
2
17 0
20 1
2
0 18 -1 2
0 65 0 1
1
end_operator
begin_operator
op_78$.hpvm16.mysql.set_port $.target=0
2
17 0
20 1
2
0 18 -1 3
0 65 0 1
1
end_operator
begin_operator
op_79$.hpvm16.mysql.set_port $.target=3306
2
17 0
20 1
2
0 18 -1 4
0 65 0 1
1
end_operator
begin_operator
op_80$.hpvm16.mysql.set_port $.target=58248
2
17 0
20 1
2
0 18 -1 5
0 65 0 1
1
end_operator
begin_operator
op_81$.hpvm16.mysql.set_port $.target=80
2
17 0
20 1
2
0 18 -1 6
0 65 0 1
1
end_operator
begin_operator
op_82$.hpvm17.upgrade_nuri
0
2
0 54 -1 0
0 65 0 1
1
end_operator
begin_operator
op_83$.hpvm17.start
0
2
0 57 -1 0
0 65 0 1
1
end_operator
begin_operator
op_84$.hpvm17.stop
0
2
0 57 -1 1
0 65 0 1
1
end_operator
begin_operator
op_85$.hpvm17.mysql.install
0
2
0 49 -1 0
0 65 0 1
1
end_operator
begin_operator
op_86$.hpvm17.mysql.set_root_password $.passwd=linux
1
52 0
2
0 51 -1 0
0 65 0 1
1
end_operator
begin_operator
op_87$.hpvm17.mysql.set_root_password $.passwd=ubuntu
1
52 0
2
0 51 -1 1
0 65 0 1
1
end_operator
begin_operator
op_88$.hpvm17.mysql.set_root_password $.passwd=hpvm16
1
52 0
2
0 51 -1 2
0 65 0 1
1
end_operator
begin_operator
op_89$.hpvm17.mysql.set_root_password $.passwd=hpvm16.inf.ed.ac.uk
1
52 0
2
0 51 -1 3
0 65 0 1
1
end_operator
begin_operator
op_90$.hpvm17.mysql.set_root_password $.passwd=3.2.0-25-generic
1
52 0
2
0 51 -1 4
0 65 0 1
1
end_operator
begin_operator
op_91$.hpvm17.mysql.set_root_password $.passwd=x86_64
1
52 0
2
0 51 -1 5
0 65 0 1
1
end_operator
begin_operator
op_92$.hpvm17.mysql.set_root_password $.passwd=
1
52 0
2
0 51 -1 6
0 65 0 1
1
end_operator
begin_operator
op_93$.hpvm17.mysql.set_root_password $.passwd=/var/www
1
52 0
2
0 51 -1 7
0 65 0 1
1
end_operator
begin_operator
op_94$.hpvm17.mysql.set_root_password $.passwd=root
1
52 0
2
0 51 -1 8
0 65 0 1
1
end_operator
begin_operator
op_95$.hpvm17.mysql.set_root_password $.passwd=5.5.24-0ubuntu0.12.04.1
1
52 0
2
0 51 -1 9
0 65 0 1
1
end_operator
begin_operator
op_96$.hpvm17.mysql.set_root_password $.passwd=2.2.22-1ubuntu1
1
52 0
2
0 51 -1 10
0 65 0 1
1
end_operator
begin_operator
op_97$.hpvm17.mysql.set_root_password $.passwd=hpvm17
1
52 0
2
0 51 -1 11
0 65 0 1
1
end_operator
begin_operator
op_98$.hpvm17.mysql.set_root_password $.passwd=hpvm17.inf.ed.ac.uk
1
52 0
2
0 51 -1 12
0 65 0 1
1
end_operator
begin_operator
op_99$.hpvm17.mysql.start
1
49 0
2
0 52 -1 0
0 65 0 1
1
end_operator
begin_operator
op_100$.hpvm17.mysql.stop
0
2
0 52 -1 1
0 65 0 1
1
end_operator
begin_operator
op_101$.hpvm17.mysql.set_port $.target=503456
2
52 1
49 0
2
0 50 -1 0
0 65 0 1
1
end_operator
begin_operator
op_102$.hpvm17.mysql.set_port $.target=50884
2
52 1
49 0
2
0 50 -1 1
0 65 0 1
1
end_operator
begin_operator
op_103$.hpvm17.mysql.set_port $.target=1
2
52 1
49 0
2
0 50 -1 2
0 65 0 1
1
end_operator
begin_operator
op_104$.hpvm17.mysql.set_port $.target=0
2
52 1
49 0
2
0 50 -1 3
0 65 0 1
1
end_operator
begin_operator
op_105$.hpvm17.mysql.set_port $.target=3306
2
52 1
49 0
2
0 50 -1 4
0 65 0 1
1
end_operator
begin_operator
op_106$.hpvm17.mysql.set_port $.target=58248
2
52 1
49 0
2
0 50 -1 5
0 65 0 1
1
end_operator
begin_operator
op_107$.hpvm17.mysql.set_port $.target=80
2
52 1
49 0
2
0 50 -1 6
0 65 0 1
1
end_operator
begin_operator
op_108$.hpvm17.mysql.uninstall
1
52 1
2
0 49 -1 1
0 65 0 1
1
end_operator
begin_operator
op_109$.hpvm17.apache.install
0
2
0 36 -1 0
0 65 0 1
1
end_operator
begin_operator
op_110$.hpvm17.apache.install_php_module
2
40 1
36 0
2
0 37 -1 0
0 65 0 1
1
end_operator
begin_operator
op_111$.hpvm17.apache.set_document_root $.target=linux
1
40 1
2
0 35 -1 0
0 65 0 1
1
end_operator
begin_operator
op_112$.hpvm17.apache.set_document_root $.target=ubuntu
1
40 1
2
0 35 -1 1
0 65 0 1
1
end_operator
begin_operator
op_113$.hpvm17.apache.set_document_root $.target=hpvm16
1
40 1
2
0 35 -1 2
0 65 0 1
1
end_operator
begin_operator
op_114$.hpvm17.apache.set_document_root $.target=hpvm16.inf.ed.ac.uk
1
40 1
2
0 35 -1 3
0 65 0 1
1
end_operator
begin_operator
op_115$.hpvm17.apache.set_document_root $.target=3.2.0-25-generic
1
40 1
2
0 35 -1 4
0 65 0 1
1
end_operator
begin_operator
op_116$.hpvm17.apache.set_document_root $.target=x86_64
1
40 1
2
0 35 -1 5
0 65 0 1
1
end_operator
begin_operator
op_117$.hpvm17.apache.set_document_root $.target=
1
40 1
2
0 35 -1 6
0 65 0 1
1
end_operator
begin_operator
op_118$.hpvm17.apache.set_document_root $.target=/var/www
1
40 1
2
0 35 -1 7
0 65 0 1
1
end_operator
begin_operator
op_119$.hpvm17.apache.set_document_root $.target=root
1
40 1
2
0 35 -1 8
0 65 0 1
1
end_operator
begin_operator
op_120$.hpvm17.apache.set_document_root $.target=5.5.24-0ubuntu0.12.04.1
1
40 1
2
0 35 -1 9
0 65 0 1
1
end_operator
begin_operator
op_121$.hpvm17.apache.set_document_root $.target=2.2.22-1ubuntu1
1
40 1
2
0 35 -1 10
0 65 0 1
1
end_operator
begin_operator
op_122$.hpvm17.apache.set_document_root $.target=hpvm17
1
40 1
2
0 35 -1 11
0 65 0 1
1
end_operator
begin_operator
op_123$.hpvm17.apache.set_document_root $.target=hpvm17.inf.ed.ac.uk
1
40 1
2
0 35 -1 12
0 65 0 1
1
end_operator
begin_operator
op_124$.hpvm17.apache.uninstall_php_module
1
40 1
2
0 37 -1 1
0 65 0 1
1
end_operator
begin_operator
op_125$.hpvm17.apache.start
1
36 0
2
0 40 -1 0
0 65 0 1
1
end_operator
begin_operator
op_126$.hpvm17.apache.stop
0
2
0 40 -1 1
0 65 0 1
1
end_operator
begin_operator
op_127$.hpvm17.apache.set_port $.target=503456
2
40 1
36 0
2
0 39 -1 0
0 65 0 1
1
end_operator
begin_operator
op_128$.hpvm17.apache.set_port $.target=50884
2
40 1
36 0
2
0 39 -1 1
0 65 0 1
1
end_operator
begin_operator
op_129$.hpvm17.apache.set_port $.target=1
2
40 1
36 0
2
0 39 -1 2
0 65 0 1
1
end_operator
begin_operator
op_130$.hpvm17.apache.set_port $.target=0
2
40 1
36 0
2
0 39 -1 3
0 65 0 1
1
end_operator
begin_operator
op_131$.hpvm17.apache.set_port $.target=3306
2
40 1
36 0
2
0 39 -1 4
0 65 0 1
1
end_operator
begin_operator
op_132$.hpvm17.apache.set_port $.target=58248
2
40 1
36 0
2
0 39 -1 5
0 65 0 1
1
end_operator
begin_operator
op_133$.hpvm17.apache.set_port $.target=80
2
40 1
36 0
2
0 39 -1 6
0 65 0 1
1
end_operator
begin_operator
op_134$.hpvm17.apache.install_php_mysql_module
2
40 1
36 0
2
0 38 -1 0
0 65 0 1
1
end_operator
begin_operator
op_135$.hpvm17.apache.uninstall_php_mysql_module
1
40 1
2
0 38 -1 1
0 65 0 1
1
end_operator
begin_operator
op_136$.hpvm17.apache.uninstall
3
40 1
38 1
37 1
2
0 36 -1 1
0 65 0 1
1
end_operator
begin_operator
op_137$.hpvm17.tikiwiki.install
0
2
0 60 -1 0
0 65 0 1
1
end_operator
begin_operator
op_138$.hpvm17.tikiwiki.change_path $.target=linux
0
2
0 61 -1 0
0 65 0 1
1
end_operator
begin_operator
op_139$.hpvm17.tikiwiki.change_path $.target=ubuntu
0
2
0 61 -1 1
0 65 0 1
1
end_operator
begin_operator
op_140$.hpvm17.tikiwiki.change_path $.target=hpvm16
0
2
0 61 -1 2
0 65 0 1
1
end_operator
begin_operator
op_141$.hpvm17.tikiwiki.change_path $.target=hpvm16.inf.ed.ac.uk
0
2
0 61 -1 3
0 65 0 1
1
end_operator
begin_operator
op_142$.hpvm17.tikiwiki.change_path $.target=3.2.0-25-generic
0
2
0 61 -1 4
0 65 0 1
1
end_operator
begin_operator
op_143$.hpvm17.tikiwiki.change_path $.target=x86_64
0
2
0 61 -1 5
0 65 0 1
1
end_operator
begin_operator
op_144$.hpvm17.tikiwiki.change_path $.target=
0
2
0 61 -1 6
0 65 0 1
1
end_operator
begin_operator
op_145$.hpvm17.tikiwiki.change_path $.target=/var/www
0
2
0 61 -1 7
0 65 0 1
1
end_operator
begin_operator
op_146$.hpvm17.tikiwiki.change_path $.target=root
0
2
0 61 -1 8
0 65 0 1
1
end_operator
begin_operator
op_147$.hpvm17.tikiwiki.change_path $.target=5.5.24-0ubuntu0.12.04.1
0
2
0 61 -1 9
0 65 0 1
1
end_operator
begin_operator
op_148$.hpvm17.tikiwiki.change_path $.target=2.2.22-1ubuntu1
0
2
0 61 -1 10
0 65 0 1
1
end_operator
begin_operator
op_149$.hpvm17.tikiwiki.change_path $.target=hpvm17
0
2
0 61 -1 11
0 65 0 1
1
end_operator
begin_operator
op_150$.hpvm17.tikiwiki.change_path $.target=hpvm17.inf.ed.ac.uk
0
2
0 61 -1 12
0 65 0 1
1
end_operator
begin_operator
op_151$.hpvm17.tikiwiki.set_database $.target=$.hpvm16.mysql
0
2
0 59 -1 1
0 65 0 1
1
end_operator
begin_operator
op_152$.hpvm17.tikiwiki.set_database $.target=$.hpvm17.mysql
0
2
0 59 -1 2
0 65 0 1
1
end_operator
begin_operator
op_153$.hpvm17.tikiwiki.upgrade $.target=503456
0
2
62 -1
0 65 0 1
1
end_operator
begin_operator
op_154$.hpvm17.tikiwiki.upgrade $.target=50884
0
2
62 -1
0 65 0 1
1
end_operator
begin_operator
op_155$.hpvm17.tikiwiki.upgrade $.target=1
0
2
62 -1
0 65 0 1
1
end_operator
begin_operator
op_156$.hpvm17.tikiwiki.upgrade $.target=0
0
2
62 -1
0 65 0 1
1
end_operator
begin_operator
op_157$.hpvm17.tikiwiki.upgrade $.target=3306
0
2
62 -1
0 65 0 1
1
end_operator
begin_operator
op_158$.hpvm17.tikiwiki.upgrade $.target=58248
0
2
62 -1
0 65 0 1
1
end_operator
begin_operator
op_159$.hpvm17.tikiwiki.upgrade $.target=80
0
2
62 -1
0 65 0 1
1
end_operator
begin_operator
op_160$.hpvm17.tikiwiki.uninstall
0
2
0 60 -1 0
0 65 0 1
1
end_operator
begin_operator
op_161$.hpvm17.tikiwiki.set_webserver $.target=$.hpvm16.apache
0
2
0 63 -1 1
0 65 0 1
1
end_operator
begin_operator
op_162$.hpvm17.tikiwiki.set_webserver $.target=$.hpvm17.apache
0
2
0 63 -1 2
0 65 0 1
1
end_operator
0