begin_version
3
end_version
begin_metric
1
end_metric
25
begin_variable
var_0$.pc1
-1
1
$.pc1
end_variable
begin_variable
var_1$.pc1.refer
-1
3
null
$.web1
$.web2
end_variable
begin_variable
var_2$.pc2
-1
1
$.pc2
end_variable
begin_variable
var_3$.pc2.refer
-1
3
null
$.web1
$.web2
end_variable
begin_variable
var_4$.private_cloud
-1
1
$.private_cloud
end_variable
begin_variable
var_5$.private_cloud.is_private
-1
1
true
end_variable
begin_variable
var_6$.public_cloud
-1
1
$.public_cloud
end_variable
begin_variable
var_7$.public_cloud.is_private
-1
1
true
end_variable
begin_variable
var_8$.vm1
-1
1
$.vm1
end_variable
begin_variable
var_9$.vm1.has_service
-1
1
$.web1
end_variable
begin_variable
var_10$.vm1.on_cloud
-1
3
null
$.private_cloud
$.public_cloud
end_variable
begin_variable
var_11$.vm1.running
-1
2
true
false
end_variable
begin_variable
var_12$.vm2
-1
1
$.vm2
end_variable
begin_variable
var_13$.vm2.has_service
-1
1
$.web2
end_variable
begin_variable
var_14$.vm2.on_cloud
-1
3
null
$.private_cloud
$.public_cloud
end_variable
begin_variable
var_15$.vm2.running
-1
2
true
false
end_variable
begin_variable
var_16$.web1
-1
1
$.web1
end_variable
begin_variable
var_17$.web1.firewall_port
-1
1
null
end_variable
begin_variable
var_18$.web1.running
-1
2
true
false
end_variable
begin_variable
var_19$.web1.vm
-1
1
$.vm1
end_variable
begin_variable
var_20$.web2
-1
1
$.web2
end_variable
begin_variable
var_21$.web2.firewall_port
-1
1
null
end_variable
begin_variable
var_22$.web2.running
-1
2
true
false
end_variable
begin_variable
var_23$.web2.vm
-1
1
$.vm2
end_variable
begin_variable
var_24_global_var
-1
2
true
false
end_variable
0
begin_state
0
1
0
1
0
0
0
0
0
0
1
0
0
0
1
1
0
0
0
0
0
0
1
0
1
end_state
begin_goal
5
1 1
3 1
10 2
15 1
24 0
end_goal
20
begin_operator
op_0-globalop-0
3
1 1
18 0
3 1
1
0 24 1 0
0
end_operator
begin_operator
op_1-globalop-0
4
1 1
18 0
3 2
22 0
1
0 24 1 0
0
end_operator
begin_operator
op_2-globalop-0
4
1 2
22 0
3 1
18 0
1
0 24 1 0
0
end_operator
begin_operator
op_3-globalop-0
3
1 2
22 0
3 2
1
0 24 1 0
0
end_operator
begin_operator
op_4$.vm1.start
0
2
0 11 -1 0
0 24 0 1
5
end_operator
begin_operator
op_5$.vm1.stop
2
9 0
18 1
2
0 11 -1 1
0 24 0 1
10
end_operator
begin_operator
op_6$.vm1.migrate $.c=$.private_cloud
1
11 1
2
0 10 -1 1
0 24 0 1
100
end_operator
begin_operator
op_7$.vm1.migrate $.c=$.public_cloud
1
11 1
2
0 10 -1 2
0 24 0 1
100
end_operator
begin_operator
op_8$.vm2.start
0
2
0 15 -1 0
0 24 0 1
5
end_operator
begin_operator
op_9$.vm2.stop
2
13 0
22 1
2
0 15 -1 1
0 24 0 1
10
end_operator
begin_operator
op_10$.vm2.migrate $.c=$.private_cloud
1
15 1
2
0 14 -1 1
0 24 0 1
100
end_operator
begin_operator
op_11$.vm2.migrate $.c=$.public_cloud
1
15 1
2
0 14 -1 2
0 24 0 1
100
end_operator
begin_operator
op_12$.web1.start
2
19 0
11 0
2
0 18 -1 0
0 24 0 1
5
end_operator
begin_operator
op_13$.web1.stop
0
2
0 18 -1 1
0 24 0 1
10
end_operator
begin_operator
op_14$.web2.start
2
23 0
15 0
2
0 22 -1 0
0 24 0 1
5
end_operator
begin_operator
op_15$.web2.stop
0
2
0 22 -1 1
0 24 0 1
10
end_operator
begin_operator
op_16$.pc1.change $.s=$.web1
1
18 0
2
0 1 -1 1
0 24 0 1
1
end_operator
begin_operator
op_17$.pc1.change $.s=$.web2
1
22 0
2
0 1 -1 2
0 24 0 1
1
end_operator
begin_operator
op_18$.pc2.change $.s=$.web1
1
18 0
2
0 3 -1 1
0 24 0 1
1
end_operator
begin_operator
op_19$.pc2.change $.s=$.web2
1
22 0
2
0 3 -1 2
0 24 0 1
1
end_operator
0
