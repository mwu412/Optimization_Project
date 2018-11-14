function f = obj( t )  % theta

[epsilon, alfa, beta, x, y] = coordinate( t );


    dd = zeros(1,3);
    for i = 0:2
        if i==2
            j = 0;
        else 
            j = i+1;
        end
        m = (y(j)-y(i)) / (x(j)-x(i));
        xx = (m * x(i) - y(i)) / (x(i) + 1/m);
        yy = m * (y(i) - m * x(i)) / (x(i) + 1/m);
        dd(i) = xx^2 + yy^2;
    end
    min_d = min(dd);



f = alfa / min_d;

end

