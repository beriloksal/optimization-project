clear all
close all
clc

X1=0:0.01:0.42;
X2=0:0.01:0.42;
X3=0:0.01:0.42;
X4=0:0.01:0.42;
i = 0:10;


[x1,x2] = meshgrid(X1,X2);
[x3,x4] = meshgrid(X3,X4);

    a = [0.1957, 0.1947, 0.1735, 0.1600, 0.0844, 0.0627, 0.0456, 0.0342, 0.0323, 0.0235, 0.0246];
    b = [0.25, 0.50, 1.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0];

    toplams = 0;
    
for i = 1:length(a)
    pay = (x1 * (1 + x2 * b(i)));
    payda = (1 + (x3 * b(i)) + (x4 * (b(i)^2)));
    toplams = toplams + (a(i) - (pay ./ payda)).^2; % Ensure element-wise operations with .^
end

    F = toplams;

realFMin = min(min(F))
mesh(X1,X2,F)
xlabel('X1')
ylabel('X2')
zlabel('F')
title('Kowalik Problem')

figure
contourf(x1,x2,F)
hold on

% %% Newton-Raphson
% fprintf('Newton-Raphson Algorithm\n');
% x0 = 0.42 * rand(4,1);
% x = x0
% % x=[-1;1];
% 
% 
% epsilon=10^(-4);
% 
% tic
% fprintf('k=1, x1=%f, x2=%f, x3=%f, x4=%f, f(x)=%f\n',x(1),x(2),x(3),x(4),func(x))
% plot(x(1),x(2),x(3),x(4),'r.')
% x_next = x-inv(hessianfunc(x))*gradfunc(x);
% x_next = max(min(x_next, 0.42), 0);
% fprintf('k=2, x1=%f, x2=%f, x3=%f, x4=%f, f(x)=%f, abs. error=%f\n',x_next(1),x_next(2),x_next(3),x_next(4),func(x_next),abs(func(x_next)-func(x)))
% plot(x_next(1),x_next(2),x_next(3),x_next(4),'r*')
% k=3;
% %while(abs(func(x_next)-func(x))>epsilon)
% while(norm(gradfunc(x_next))>epsilon)
%     x=x_next;
%     x_next=x-inv(hessianfunc(x))*gradfunc(x);
%     x_next = max(min(x_next, 0.42), 0);
%     fprintf('k=%d,x1=%f,x2=%f,x3=%f,x4=%f,f(x)=%f,abs.error=%f\n',k,x_next(1),x_next(2),x_next(3),x_next(4),func(x_next),abs(func(x_next)-func(x)))
%     plot(x_next(1),x_next(2),'r*')
%     k=k+1;
% end
% toc
% title('Newton-Raphson Algorithm')
% set(gca,'fontsize',15)
% set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);

% %% Hestenes-Stiefel Algorithm
% figure
% contourf(x1,x2,F)
% hold on
% 
% fprintf('Hestenes-Stiefel Algorithm\n');
%  x0 = 0.42 * rand(4,1);
%  x = x0
% % x=[-1;1];
% % x=[0.3383,0.2422,0.0768,0.1008]  %newtonda 7 iterasyon verdi bunda çalışmadı
% 
% 
% epsilon=10^(-4);
% 
% tic
% fprintf('k=1, x1=%f, x2=%f, x3=%f, x4=%f, f(x)=%f\n',x(1),x(2),x(3),x(4),func(x))
% plot(x(1),x(2),x(3),x(4),'r.')
% 
% g=gradfunc(x);
% d=-g;
% 
% fprintf('d=%f\n',d);
% 
% % alpha argmin procedure
% alpha=0:0.01:1;  
% funcalpha=zeros(length(alpha),1);
% 
% for i=1:length(alpha)
%     x_new = x + alpha(i) * d;
%     x_new = max(min(x_new, 0.42), 0); % Ensure x_new is within bounds
%     funcalpha(i) = func(x_new);
% end
% [val,ind]=min(funcalpha);
% alpha=alpha(ind);
% 
% x_next=x+alpha*d;
% x_next=max(min(x_next, 0.42), 0);
% 
% g_next=gradfunc(x_next);
% beta=(g_next'*(g_next-g))/(d'*(g_next-g));
% d_next=-g_next+beta*d;
% 
% fprintf('k=2, x1=%f, x2=%f, x3=%f, x4=%f, f(x)=%f, abs. error=%f\n',x_next(1),x_next(2),x_next(3),x_next(4),func(x_next),abs(func(x_next)-func(x)))
% plot(x_next(1),x_next(2),x_next(3),x_next(4),'r*')
% k=3;
% 
% while(norm(gradfunc(x_next))>epsilon)
%     x=x_next;
%     g=g_next;
%     d=d_next;
% 
%     %alpha argmin procedure
%     alpha=0:0.01:1;
%     funcalpha=zeros(length(alpha),1);
%     for i=1:length(alpha)
%         x_new = x + alpha(i) * d;
%         x_new = max(min(x_new, 0.42), 0); % Ensure x_new is within bounds
%         funcalpha(i) = func(x_new);
%     end
%     [val,ind]=min(funcalpha);
%     alpha=alpha(ind);
% 
%     x_next=x+alpha*d;
%     x_next = max(min(x_next, 0.42), 0);
%     g_next=gradfunc(x_next);
%     beta=(g_next'*(g_next-g))/(d'*(g_next-g));
%     d_next=-g_next+beta*d;
% 
%     fprintf('k=%d,x1=%f,x2=%f,x3=%f, x4=%f, f(x)=%f, abs.error=%f\n',k,x_next(1),x_next(2),x_next(3),x_next(4),func(x_next),abs(func(x_next)-func(x)))
%     plot(x_next(1),x_next(2),'r*')
%     k=k+1;
% end
% toc
% title('Hestenes-Stiefel Algorithm')
% set(gca,'fontsize',15)
% set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);

% %% Polak-Ribiére Algorithm
% figure
% contourf(x1,x2,F)
% hold on
% 
% fprintf('Polak-Ribiére  Algorithm\n');
% x0= 0.42 * rand(4,1);
% x=x0;
% %x=[-1;1];
% %x=[    0.2076,    0.3272,    0.3003,    0.3796];
% 
% epsilon=10^(-4);
% 
% tic
% fprintf('k=1, x1=%f, x2=%f, x3=%f, x4=%f, f(x)=%f\n',x(1),x(2),x(3),x(4),func(x))
% plot(x(1),x(2),x(3),x(4),'r.')
% g=gradfunc(x);
% d=-g;
% 
% % alpha argmin procedure
% alpha=0:0.01:1;  
% funcalpha=zeros(length(alpha),1);
% 
% for i=1:length(alpha)
%      x_new = x + alpha(i) * d;
%      x_new = max(min(x_new, 0.42), 0); % Ensure x_new is within bounds
%      funcalpha(i) = func(x_new);
% end
% [val,ind]=min(funcalpha);
% alpha=alpha(ind);
% 
% x_next=x+alpha*d;
% x_next = max(min(x_next, 0.42), 0);
% g_next=gradfunc(x_next);
% beta=(g_next'*(g_next-g))/(g'*g);
% d_next=-g_next+beta*d;
% 
% fprintf('k=2, x1=%f, x2=%f, x3=%f, x4=%f, f(x)=%f, abs. error=%f\n',x_next(1),x_next(2),x_next(3),x_next(4),func(x_next),abs(func(x_next)-func(x)))
% plot(x_next(1),x_next(2),x_next(3),x_next(4),'r*')
% k=3;
% 
% %while(abs(funcackley(x_next)-funcackley(x))>epsilon)
% while(norm(gradfunc(x_next))>epsilon)
%     x=x_next;
%     g=g_next;
%     d=d_next;
% 
%     %alpha argmin procedure
%     alpha=0:0.01:1;
%     funcalpha=zeros(length(alpha),1);
%     for i=1:length(alpha)
%      x_new = x + alpha(i) * d;
%      x_new = max(min(x_new, 0.42), 0); % Ensure x_new is within bounds
%      funcalpha(i) = func(x_new);
%     end
%     [val,ind]=min(funcalpha);
%     alpha=alpha(ind);
% 
%     x_next=x+alpha*d;
%     x_next = max(min(x_next, 0.42), 0);
%     g_next=gradfunc(x_next);
%     beta=(g_next'*(g_next-g))/(g'*g);
%     d_next=-g_next+beta*d;
% 
%     fprintf('k=%d,x1=%f,x2=%f,x3=%f,x4=%f,f(x)=%f, abs.error=%f\n',k,x_next(1),x_next(2),x_next(3),x_next(4),func(x_next),abs(func(x_next)-func(x)))
%     plot(x_next(1),x_next(2),x_next(3),x_next(4),'r*')
%     k=k+1;
% end
% toc
% title('Polak-Ribiére  Algorithm')
% set(gca,'fontsize',15)
% set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);

%% Fletcher-Reeves Algorithm
figure
contourf(x1,x2,F)
hold on

fprintf('Fletcher-Reeves Algorithm\n');
x0=0.42*rand(4,1);
x=x0;
% x=[    0.2076,    0.3272,    0.3003,    0.3796];
% x=[-1;1];
epsilon=10^(-4);

tic
fprintf('k=1, x1=%f, x2=%f, x3=%f, x4=%f, f(x)=%f\n',x(1),x(2),x(3),x(4),func(x))
plot(x(1),x(2),x(3),x(4),'r.')

g=gradfunc(x);
d=-g;

% alpha argmin procedure
alpha=0:0.01:1;  
funcalpha=zeros(length(alpha),1);

for i=1:length(alpha)
      x_new = x + alpha(i) * d;
       x_new = max(min(x_new, 0.42), 0); % Ensure x_new is within bounds
      funcalpha(i) = func(x_new);
end
[val,ind]=min(funcalpha);
alpha=alpha(ind);

x_next=x+alpha*d;
x_next = max(min(x_next, 0.42), 0);
g_next=gradfunc(x_next);
beta=(g_next'*(g_next))/(g'*g);
d_next=-g_next+beta*d;

fprintf('k=2, x1=%f, x2=%f, x3=%f, x4=%f, f(x)=%f, abs. error=%f\n',x_next(1),x_next(2),x_next(3),x_next(4),func(x_next),abs(func(x_next)-func(x)))
plot(x_next(1),x_next(2),x_next(3),x_next(4),'r*')

k=3;
%while(abs(func(x_next)-func(x))>epsilon)
while(norm(gradfunc(x_next))>epsilon)
    x=x_next;
    g=g_next;
    d=d_next;

    %alpha argmin procedure
    alpha=0:0.01:1;
    funcalpha=zeros(length(alpha),1);
    for i=1:length(alpha)
      x_new = x + alpha(i) * d;
      x_new = max(min(x_new, 0.42), 0); % Ensure x_new is within bounds
      funcalpha(i) = func(x_new);
    end
    [val,ind]=min(funcalpha);
    alpha=alpha(ind);

    x_next=x+alpha*d;
    x_next = max(min(x_next, 0.42), 0);
    g_next=gradfunc(x_next);
    beta=(g_next'*(g_next))/(g'*g);
    d_next=-g_next+beta*d;

    fprintf('k=%d,x1=%f,x2=%f,x3=%f,x4=%f,f(x)=%f, abs.error=%f\n',k,x_next(1),x_next(2),x_next(3),x_next(4),func(x_next),abs(func(x_next)-func(x)))
    plot(x_next(1),x_next(2),x_next(3),x_next(4),'r*')

    k=k+1;
end
toc
title('Fletcher-Reeves Algorithm')
set(gca,'fontsize',15)
set(findobj(gca, 'Type', 'Line', 'Linestyle', '--'), 'LineWidth', 2);
