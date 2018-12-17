clear 
close all
clc

%% saving loads and min_d from each iter in "obj.m" to plot later 

global load
global d_min
global count
load = zeros(3,600);
d_min = zeros(1,600);
count = 1;

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
    'Display','iter','Algorithm','sqp',...
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

%% plot load
figure
subplot(2,1,1)
plot(load(1,1:count))
hold on
plot(load(2,1:count))
hold on
plot(load(3,1:count))

legend('robot_1','robot_2','robot_3','Location','southeast')

title('Load on each robot')
xlabel('obj function call')
ylabel('proportion of load')

ylim([-1,1])

text(count-10,0.4,'\downarrow 0.33')
hold off

%% plot d_min
subplot(2,1,2)
plot(d_min(1,1:count))
title('Distance between the COG and the closest edge')
xlabel('obj function call')
ylabel('d')

ylim([0,8])