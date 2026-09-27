clear; clc; clf();
Fs = 300; Ts = 1/Fs;
F0 = 120; Tp = 1/F0;
k = 2; N = 5; // Ts/Tp = 2/5, da toi gian
n = 0:20;
x = cos(2*%pi*F0*n/Fs);
Td = N*Ts;
period_error = max(abs(x(1:16) - x(6:21)));
disp("Ts/Tp, N, Td, k*Tp, period error:");
disp([Ts/Tp N Td k*Tp period_error]);
plot2d3(n,x);
title("Ts/Tp = 2/5: 5 samples span 2 analog periods");
xlabel("n"); ylabel("x(n)");
