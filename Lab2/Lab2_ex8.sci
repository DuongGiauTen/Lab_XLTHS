clear;
clc;
clf();

// Dinh nghia tin hieu goc bang deff
deff("v = sig(k)", ...
     "v = bool2s(k==-2) - 2*bool2s(k==-1) + 3*bool2s(k==0) + 6*bool2s(k==1)");

// Lay rong khoang ve de cac mau khac 0 khong nam sat mep
n = -6:3;

x = sig(n);
y1 = sig(-n);
y2 = sig(n + 3);
y3 = 2*sig(-n - 2);

Y = [y1; y2; y3];
names = ["y1(n) = x(-n)";
         "y2(n) = x(n+3)";
         "y3(n) = 2*x(-n-2)"];

for i = 1:3
    // Cot trai: tin hieu goc
    subplot(3, 2, 2*i - 1);
    plot2d3(n, x);
    title("Original signal x(n)");
    xlabel("n");
    ylabel("x(n)");

    // Cot phai: tin hieu sau bien doi
    subplot(3, 2, 2*i);
    plot2d3(n, Y(i,:));
    title(names(i));
    xlabel("n");
    ylabel("y(n)");
end
