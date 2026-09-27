clear;
clc;
clf();

// EXERCISE 1

n = -5:5;
x = n.^2;

xmin = min(x) ;
xmax = max(x) ;

disp(xmin, "Gia tri nho nhat:");
disp(xmax, "Gia tri lon nhat:");

 // 2. subplot(), plot2d3(), title(), xlabel(), ylabel()
 subplot(2, 1, 1);
 plot2d3(n, x);
 title("Tin hieu x(n) = n^2");
 xlabel("n");
 ylabel("x(n)");
 
 // bool2s()
 u = bool2s(n >= 0);
 
 subplot(2,1,2);
 plot2d3(n, u);
 title("Tin hieu bac don vi u(n)");
 xlabel("n");
 ylabel("u(n)");
 
 // deff() 
 deff("y = mySignal(k)", "y = 2*k + 1");

 y = mySignal(n);
 disp("Ket qua ham mySignal(n):");  
 disp(y);
 
 //EXERCISE 2
n =-5:5;
msignal = bool2s(n >= 0);
plot2d3(n, msignal);
 
 
 
