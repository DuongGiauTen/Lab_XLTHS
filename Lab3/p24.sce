// LAB 3 - PROBLEM 2.4
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
    f.axes_size=[1050,max([330,280*rows])];
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

// Tra cuu mau, bang 0 ngoai vecto da cho.
function y=sample_at(x,o,n)
    x=matrix(x,1,-1); y=zeros(1,length(n)); j=n+o;
    valid=find(j>=1 & j<=length(x) & j==floor(j));
    y(valid)=x(j(valid));
endfunction

n24 = -4:4; base24 = [2 3 4 5 6]; o24 = 3;
x24 = sample_at(base24, o24, n24);
xr24 = sample_at(base24, o24, -n24);
xe24 = (x24+xr24)/2; xo24 = (x24-xr24)/2;
show_signals(list(n24,n24,n24,n24), list(x24,xr24,xe24,xo24), ..
    ["x(n)", "x(-n)", "Even part xe(n)", "Odd part xo(n)"], "P2.4");
mprintf("Rows: n, x, x(-n), xe, xo\n");
disp([n24;x24;xr24;xe24;xo24]);
mprintf("Reconstruction error = %.3e\n", max(abs(xe24+xo24-x24)));
mprintf("Even symmetry error = %.3e\n", max(abs(xe24-xe24($:-1:1))));
mprintf("Odd symmetry error = %.3e\n", max(abs(xo24+xo24($:-1:1))));
