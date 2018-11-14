function [c,ceq] = mycon(t)

[epsilon, alfa, beta, x, y] = coordinate( t );

v1 = [x(0), y(0)] - [x(2), y(2)];
v2 = [x(1), y(1)] - [x(2), y(2)];
v0 = [x(2), y(2)];
v = [0,0];

a = (det([v;v2]) - det([v0;v2])) / det([v1;v2]);
b = -(det([v;v1]) - det([v0;v1])) / det([v1;v2]);

c1 =  -a + 0.001;
c2 =  -b + 0.001;
c3 = a + b - 1 + 0.001;

c = [c1, c2, c3];


ceq = [];
