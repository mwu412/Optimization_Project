function force_arr = force(o,x,y)

%% Fi
syms f1 f2 f3
eqn1 = (x(1)-o(1))*f1 + (x(2)-o(1))*f2 + (x(3)-o(1))*f3 == 0;
eqn2 = (y(1)-o(2))*f1 + (y(2)-o(2))*f2 + (y(3)-o(2))*f3 == 0;
eqn3 = f1 + f2 + f3 == 100;

sol = solve([eqn1, eqn2, eqn3], [f1, f2, f3]);

sol_f1 = double(sol.f1);
sol_f2 = double(sol.f2);
sol_f3 = double(sol.f3);

force_arr = [sol_f1, sol_f2, sol_f3];
