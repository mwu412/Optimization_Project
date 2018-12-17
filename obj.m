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
        d = min(dd); 
    end


fc = force(o,x,y);

global load
global d_min
global count

d_min(:,count) = d;

for i = 1:3
   load(i,count) = fc(i)/100; 
end

count = count + 1;

%% obj 
alfa = 1;
beta = 100;
f = alfa * 1 / d^2 + beta *((fc(1)/100-1/3)^2 + (fc(2)/100-1/3)^2 + (fc(3)/100-1/3)^2);

end

