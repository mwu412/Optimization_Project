function [c,ceq] = mycon_uncertainty(t)

[o, x, y] = coordinate(t);

%% the cog should be inside the triangle
v1 = [x(1), y(1)] - [x(3), y(3)];
v2 = [x(2), y(2)] - [x(3), y(3)];
v0 = [x(3), y(3)];

tic

samples = 1000000;
standard_deviation = 0.1;

g1_fail = 0;
g2_fail = 0;
g3_fail = 0;

for i = 1:samples
    rndo1 = normrnd(o(1),standard_deviation);
    rndo2 = normrnd(o(2),standard_deviation);
    v = [rndo1, rndo2];  % x is a 1x2 array
    
    a = (det([v;v2]) - det([v0;v2])) / det([v1;v2]);
    b = -(det([v;v1]) - det([v0;v1])) / det([v1;v2]);
    
    if (-a + 0.001)>0
        g1_fail = g1_fail +1;
    end
    if (-b + 0.001)>0
        g2_fail = g2_fail +1;
    end
    if (a + b - 1 + 0.001)>0
        g3_fail = g3_fail +1;
    end
end

toc

%% The constrain
c1 = g1_fail - 0.0013 * samples;
c2 = g2_fail - 0.0013 * samples;
c3 = g3_fail - 0.0013 * samples;

%% the force should be positive
fc = force(o,x,y);

c4 = -fc(1);
c5 = -fc(2);
c6 = -fc(3);

%% constrains
c = [c1, c2, c3, c4, c5, c6];
ceq = [];
