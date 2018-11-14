%% fmincon

% t (theta) in radius

t0 = [0, 2/3*pi, 4/3*pi];
lb = [0, 0, 0];
ub = [2*pi, 2*pi, 2*pi]-0.001;

options = optimoptions('fmincon',...
    'Display','iter','Algorithm','sqp');
% x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
[x,fval,exitflag] = fmincon('obj',t0,[],[],[],[],lb,ub,'mycon',options)


