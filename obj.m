function f = obj( t_arr )  % theta

[o, x, y] = coordinate(t_arr);

%% d
    dd = zeros(1,3);
    for i = 1:3
        if i==3
            j = 1;
        else 
            j = i+1;
        end
        m = (y(j)-y(i)) / (x(j)-x(i));
        xx = (m * x(i) - y(i) + o(2) + o(1)/m) / (m + 1/m);
        yy = (o(1) - xx)/m + o(2);
        dd(i) = (xx-o(1))^2 + (yy-o(2))^2;
    end
    
    if min(dd)==0
        d = 0.1;
    else
        d = min(dd) * 0.001;
    end

%% Fi
syms f1 f2 f3
eqn1 = (x(1)-o(1))*f1 + (x(2)-o(1))*f2 + (x(3)-o(1))*f3 == 0;
eqn2 = (y(1)-o(2))*f1 + (y(2)-o(2))*f2 + (y(3)-o(2))*f3 == 0;
eqn3 = f1 + f2 + f3 == 100;

sol = solve([eqn1, eqn2, eqn3], [f1, f2, f3]);

sol_f1 = double(sol.f1);
sol_f2 = double(sol.f2);
sol_f3 = double(sol.f3);


%% obj 
alfa = 1;
beta = 1;
f = alfa * 1 / d + beta *((sol_f1/100-1/3)^2 + (sol_f2/100-1/3)^2 + (sol_f3/100-1/3)^2);

end

