% Fourier series
clear
clc

% creating the input signal
T=8;
dt=0.002;
t=dt:dt:T;
ft=mod(t,2)-1;

% plotting signal
figure(1);
plot(t, ft, 'blue', 'LineWidth', 1);
hold on
grid on
title('Original signal');

% converting to Fourier series representation
w0=2*pi./T;
a0=(1/T)*dt*sum(ft);
N=1000;
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
for k=1:4
    % output for N=10^k
    Ft=a0;
    Ft=Ft+A(1)*cos(w0*t);
    Ft=Ft+B(1)*sin(w0*t);
    
    % constructing output for N=1->10^k
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