% define the shape of the object
function [o, r] = shape(theta)

%% position of the cog [x,y]
o = [5,1];

%% shape: ellipse
% user defined parameters
a = 10;
b = 4;

% parameters
e = sqrt(1-b^2/a^2);

% r array
r = zeros(1,length(theta));
for i = 1:length(theta)
    r(i) = a * (1 - e^2) / (1 - e * cos(theta(i)));
end

%% shape: can also declare polar coordinate functions other than ellipses