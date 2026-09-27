
clf;

// 1. Ve tin hieu tuong tu xa(t) trong 5 chu ky

t = linspace(0, 0.1, 1000);
xa = 3 * sin(100 * %pi * t);

subplot(3, 1, 1);
plot(t, xa);
title("Analog signal xa(t) in 5 periods");
xlabel("t (s)");
ylabel("xa(t)");

// 2. Ve tin hieu roi rac x(n) trong 5 chu ky

n = 0:30;
x = 3 * sin((%pi / 3) * n);

subplot(3, 1, 2);
plot2d3(n, x);
title("Discrete-time signal x(n) with Fs = 300");
xlabel("n (samples)");
ylabel("x(n)");

// 3. Ve tin hieu luong tu hoa xq(n) 

delta = 0.1;
xq = delta * floor(x / delta);

subplot(3, 1, 3);
plot2d3(n, xq);
title("Quantized signal xq(n) (Truncated method)");
xlabel("n (samples)");
ylabel("xq(n)");
