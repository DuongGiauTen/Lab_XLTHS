
clear;
clc;

n = -1:3;

// Hai vector da duoc can theo cung chi so n
x1 = [0 0 1 3 -2];
x2 = [0 1 2 3 0];

y = x1 + x2;

scf(6);
clf();

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
title("Sum: y(n) = x1(n) + x2(n)");
xlabel("n");
ylabel("y(n)");

disp("Tong hai tin hieu:");
disp(y);
