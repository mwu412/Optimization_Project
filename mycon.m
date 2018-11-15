function [c,ceq] = mycon(t)

[o, x, y] = coordinate(t);

%% the cog should be inside the triangle
v1 = [x(1), y(1)] - [x(3), y(3)];
v2 = [x(2), y(2)] - [x(3), y(3)];
v0 = [x(3), y(3)];
v = [o(1),o(2)];

a = (det([v;v2]) - det([v0;v2])) / det([v1;v2]);
b = -(det([v;v1]) - det([v0;v1])) / det([v1;v2]);

c1 =  -a + 0.001;
c2 =  -b + 0.001;
c3 = a + b - 1 + 0.001;

%% constrains
c = [c1, c2, c3];
ceq = [];
