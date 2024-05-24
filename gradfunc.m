function ypr = gradfunc(x)
    syms x1 x2 x3 x4;
    
    a = [0.1957, 0.1947, 0.1735, 0.1600, 0.0844, 0.0627, 0.0456, 0.0342, 0.0323, 0.0235, 0.0246];
    b = [0.25, 0.50, 1.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0];

    toplams = 0;
    
for i = 1:length(a)
    pay = (x1 * (1 + x2 * b(i)));
    payda = (1 + (x3 * b(i)) + (x4 * (b(i)^2)));
    toplams = toplams + (a(i) - (pay ./ payda)).^2; % Ensure element-wise operations with .^
end

    F = toplams;

   g=gradient(F);
   ypr=double(subs(g,[x1,x2,x3,x4],[x(1),x(2),x(3),x(4)]));

end