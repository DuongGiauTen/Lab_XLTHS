// LAB 3 - EXERCISE 3: FOLD
mode(-1); funcprot(0);

// Ve cac tin hieu tren cung mien thoi gian.
function show_signals(ns, xs, labels, window_title)
    if getscilabmode() == "NWNI" then return; end
    m=length(xs); cols=1;
    if m>3 then cols=2; end
    rows=ceil(m/cols); nn=0; vv=0;
    for i=1:m
        nn=[nn,ns(i)]; vv=[vv,xs(i)];
    end
    nlo=min(nn)-1; nhi=max(nn)+1;
    pad=max([0.25,0.15*(max(vv)-min(vv))]);
    f=scf(); clf(); f.figure_name=window_title;
    f.axes_size=[1200,max([680,280*rows])];
    drawlater();
    for i=1:m
        subplot(rows,cols,i);
        plot2d3(ns(i),xs(i),style=2);
        plot2d(ns(i),xs(i),style=-9);
        xtitle(labels(i),"n","Amplitude"); xgrid();
        a=gca(); a.auto_scale="off";
        a.font_size=4; a.title.font_size=4;
        a.x_label.font_size=4; a.y_label.font_size=4;
        a.margins=[0.13,0.06,0.17,0.24];
        a.data_bounds=[nlo,min(vv)-pad;nhi,max(vv)+pad];
        a.tight_limits="on";
        if nhi-nlo<=24 then
            a.x_ticks=tlist(["ticks","locations","labels"], ..
                (nlo:nhi)',string((nlo:nhi)'));
        end
    end
    drawnow();
endfunction

function [yn, yorigin] = fold(xn, xorigin)
    xn = matrix(xn, 1, -1);
    yn = xn($:-1:1); yorigin = length(xn)-xorigin+1;
    nx = (1:length(xn))-xorigin;
    ny = (1:length(yn))-yorigin;
    show_signals(list(nx, ny), list(xn, yn), ..
        ["x(n)", "y(n) = x(-n)"], "Fold");
endfunction

// Vi du va ket qua.
[yn, yorigin] = fold([1 -2 3 6], 3);
disp("yn ="); disp(yn);
disp("yorigin ="); disp(yorigin);
disp("n ="); disp((1:length(yn))-yorigin);
