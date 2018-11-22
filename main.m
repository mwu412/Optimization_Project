%% fmincon

% initial angles: t0 (theta) in radius
tic
v = 0.2; % variance
sigma = sqrt(v); % standard deviation
mu = [0, 2/3*pi, 4/3*pi]; % mean
%t0 = sigma .* randn(1, 3) + mu;
t0 = normrnd(mu,sigma);

lb = [-2*pi, -2*pi, -2*pi];
ub = [2*pi, 2*pi, 2*pi];

%lb = [];
%ub = [];

options = optimoptions('fmincon',...
    'Display','iter','Algorithm','interior-point',...
    'MaxIterations',1500,'MaxFunctionEvaluations',1500);
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
[t_optm,fval,exitflag] = fmincon('obj',t0,[],[],[],[],lb,ub,'mycon',options)

toc
% plot
f_main = figure;
figure(f_main);
[o, x_optm, y_optm] = coordinate(t_optm);
x_plot = [x_optm,x_optm(1)];
y_plot = [y_optm,y_optm(1)];
plot(x_plot, y_plot)

hold on

theta = 0:0.01:2*pi;

[o, x_r, y_r] = coordinate(theta);

plot(x_r, y_r) 

hold on

plot(o(1), o(2), 'r*')

axis equal

hold off