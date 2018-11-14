function [epsilon, alfa, beta, x, y] = coordinate( t )  % theta

% user defined parameters
a = 10;
b = 8;
alfa = 10;
beta = 1;
epsilon = 0.1;

% parameters
e = sqrt(1-b^2/a^2);

function f_r = r(input) 
    f_r = a * (1 - e^2) / (1 - e * cos(input));
end

x = zeros(1,3);
y = zeros(1,3);

for i = 0:2
    x(i) = r(t(i)) * cos(t(i)); 
end

for i = 0:2
    y(i) = r(t(i)) * sin(t(i)); 
end

end