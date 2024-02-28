% -- Fourier series example --
clear
clc

% creating the input signal
T=8;
dt=0.002;
t=dt:dt:T;
ft=mod(t,2)-1+0.3*sin(t)-0.8;

% plotting signal
figure(1);
plot(t, ft, 'blue', 'LineWidth', 1);
hold on
grid on
title('Original signal');

% converting to Fourier series representation
w0=2*pi./T;
a0=(1/T)*dt*sum(ft);
K=4;
N=10^(K-1);
A=zeros(1,N);
B=zeros(1,N);

% finding fourier coefficients
for n=1:N
    an=(2/T)*dt*sum(ft .* cos(n*w0*t));
    bn=(2/T)*dt*sum(ft .* sin(n*w0*t));
    A(n)=an;
    B(n)=bn;
end

% constructing output for increasing amt of terms
for k=1:K
    % output for N=10^(k-1)
    Ft=a0;
    for n=1:10^(k-1)
        Ft=Ft+A(n)*cos(n*w0*t);
        Ft=Ft+B(n)*sin(n*w0*t);
    end
    
    % plotting output
    figure(k+1);
    plot(t,Ft, 'LineWidth', 1);
    hold on
    grid on
    title(join(['Fourier series (N=', int2str(10^(k-1)), ")"], ''));
end