% convert polar to cartesian coordinate
function [o, x_arr, y_arr] = coordinate(t_arr)  % theta

[o, r_arr] = shape(t_arr);

x_arr = r_arr .* cos(t_arr);
y_arr = r_arr .* sin(t_arr);