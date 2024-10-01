clc; clear all;

T0 = eye(4);
%t = -pi:pi;
T1 = get_DH_mat(-90,0,0,3)
T2 = get_DH_mat(-90,0,2,0)
T3 = get_DH_mat(-90,0,1,0)
x0 = [0;0;0;1];

p1 = T0*x0;
p2 = T0*T1*x0;
p3 = T0*T1*T2*x0;
p4 = T0*T1*T2*T3*x0;
x = [p1(1) p2(1) p3(1) p4(1)]
y = [p1(2) p2(2) p3(2) p4(2)]
z = [p1(3) p2(3) p3(3) p4(3)]

plot3(x,y,z,x(1),y(1),z(1),"r*",x(2),y(2),z(2),"g*",x(3),y(3),z(3),"b*",x(4),y(4),z(4),"black*")
grid on;

function [T] = get_DH_mat(tetta,alp,a,d)
%alpha - angle between zi-1 and zi (xi)
%a - distance between zi-1 and zi (xi)
%tetta - angle between xi-1 and xi (zi-1)
%di - distance between xi-1 and x (zi-1)
tetta = deg2rad(tetta)
alp = deg2rad(alp)
T = [cos(tetta) -sin(tetta)*cos(alp)  sin(tetta)*sin(alp)   a*cos(tetta);
    sin(tetta)  cos(tetta)*cos(alp)   -cos(tetta)*sin(alp)  a*sin(tetta);
    0           sin(alp)              cos(alp)              d;
    0           0                       0                       1];
end