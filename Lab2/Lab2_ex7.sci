clear;
clc;
clf();

// Can hai tin hieu theo cung chi so n
n = -2:4;
x1 = [0 0 0 1 3 -2 0];
x2 = [0 0 1 2 3  0 0];

// Nhan tung phan tu
y = x1 .* x2;

subplot(3,1,1);
plot2d3(n, x1);
title("Signal x1(n)");
xlabel("n");
ylabel("x1(n)");

subplot(3,1,2);
plot2d3(n, x2);
title("Signal x2(n)");
xlabel("n");
ylabel("x2(n)");

subplot(3,1,3);
plot2d3(n, y);
title("Product y(n) = x1(n) .* x2(n)");
xlabel("n");
ylabel("y(n)");
