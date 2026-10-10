// LAB 3 - EXERCISE 4: ADD
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

function [a,b,ny,yo]=align_signals(x1,o1,x2,o2)
    nlo=min([1-o1,1-o2]);
    nhi=max([length(x1)-o1,length(x2)-o2]);
    ny=nlo:nhi; yo=1-nlo;
    a=zeros(1,length(ny)); b=a;
    a((1:length(x1))-o1-nlo+1)=matrix(x1,1,-1);
    b((1:length(x2))-o2-nlo+1)=matrix(x2,1,-1);
endfunction

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    [a, b, ny, yorigin] = ..
        align_signals(x1n, x1origin, x2n, x2origin);
    yn = a+b;
    show_signals(list(ny, ny, ny), list(a, b, yn), ..
        ["x1(n)", "x2(n)", "y(n) = x1(n)+x2(n)"], "Addition");
endfunction

// Vi du va ket qua.
[yn, yorigin] = add([0 1 3 -2], 1, [1 1 2 3], 2);
disp("yn ="); disp(yn);
disp("yorigin ="); disp(yorigin);
disp("n ="); disp((1:length(yn))-yorigin);
