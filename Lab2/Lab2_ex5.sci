clear;
clc;

// Dinh dang de cac mau o hai dau khong bi che boi khung.
function format_discrete_plot(n, values)
    drawing = gce();
    stems = drawing.children(1);
    stems.thickness = 2;
    stems.foreground = color("blue");

    // Ve dau cham chi tai gia tri mau, khong danh dau chan cot.
    plot2d(n, values, style=-9);
    dots = gce().children(1);
    dots.mark_size_unit = "point";
    dots.mark_size = 7;
    dots.mark_foreground = color("blue");
    dots.mark_background = color("blue");

    ax = gca();
    ax.data_bounds = [-1.5 -3; 1.5 4];
    ax.tight_limits = "on";
    ax.x_ticks = tlist(["ticks", "locations", "labels"], ..
        [-1; 0; 1], ["-1"; "0"; "1"]);
    ax.y_ticks = tlist(["ticks", "locations", "labels"], ..
        [-2; -1; 0; 1; 2; 3], ["-2"; "-1"; "0"; "1"; "2"; "3"]);
    ax.font_size = 3;
    xgrid(color("lightgrey"));
endfunction

n = -1:1;
x = [1 3 -2];

// Tin hieu dao thoi gian x(-n)
xr = x($:-1:1);

// Thanh phan le va thanh phan chan
xo = (x - xr)/2;
xe = (x + xr)/2;

scf(5);
clf();
fig = gcf();
fig.axes_size = [1000 1050];
fig.figure_name = "Lab 2 - Exercise 5";

subplot(3,1,1);
plot2d3(n, x);
format_discrete_plot(n, x);
title("Original signal x(n)");
xlabel("n");
ylabel("x(n)");

subplot(3,1,2);
plot2d3(n, xo);
format_discrete_plot(n, xo);
title("Odd component");
xlabel("n");
ylabel("xo(n)");

subplot(3,1,3);
plot2d3(n, xe);
format_discrete_plot(n, xe);
title("Even component");
xlabel("n");
ylabel("xe(n)");

disp("Thanh phan le:");
disp(xo);
disp("Thanh phan chan:");
disp(xe);
