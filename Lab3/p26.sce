// LAB 3 - PROBLEM 2.6
mode(-1); funcprot(0);

// Ve cac tin hieu tren cung mien thoi gian.
function show_signals(ns, xs, labels, window_title)
    if getscilabmode() == "NWNI" then return; end
    m=length(xs); cols=1;
    if m==2 then cols=2; end
    if m>3 then cols=3; end
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
        if cols==3 then
            a.x_ticks=tlist(["ticks","locations","labels"], ..
                (-4:2:8)',string((-4:2:8)'));
        elseif nhi-nlo<=24 then
            a.x_ticks=tlist(["ticks","locations","labels"], ..
                (nlo:nhi)',string((nlo:nhi)'));
        end
    end
    drawnow();
endfunction

function z = pulse26(q)
    z = bool2s(q >= 0 & q <= 3);
endfunction
// (a) Phan vi du x(n)=delta(n), k=1.
na26 = -3:3;
ya_out26 = bool2s((na26-1).^2==0);
ya_in26 = bool2s(na26.^2-1==0);
show_signals(list(na26,na26),list(ya_out26,ya_in26), ..
    ["Output then delay: delta((n-1)^2)", ..
     "Delay then system: delta(n^2-1)"], "P2.6(a)");

// (b), (c), (d): cung xung chu nhat va do tre k=2.
n26 = -4:7; k26 = 2;
x26 = pulse26(n26); xshift26 = pulse26(n26-k26);
ysq26 = pulse26(n26.^2);
y1sq26 = pulse26((n26-k26).^2);
y2sq26 = pulse26(n26.^2-k26);
yd26 = pulse26(n26)-pulse26(n26-1);
y1d26 = pulse26(n26-k26)-pulse26(n26-k26-1);
y2d26 = pulse26(n26-k26)-pulse26(n26-1-k26);
ym26 = n26.*pulse26(n26);
y1m26 = (n26-k26).*pulse26(n26-k26);
y2m26 = n26.*pulse26(n26-k26);
labels26 = ["x(n)", "y(n)", "y1(n) = y(n-2)", ..
            "x2(n) = x(n-2)", "y2(n) = T[x2](n)"];
ns26 = list(n26,n26,n26,n26,n26);
show_signals(ns26, list(x26,ysq26,y1sq26,xshift26,y2sq26), ..
             labels26, "P2.6(b) - T[x](n)=x(n^2)");
show_signals(ns26, list(x26,yd26,y1d26,xshift26,y2d26), ..
             labels26, "P2.6(c) - T[x](n)=x(n)-x(n-1)");
show_signals(ns26, list(x26,ym26,y1m26,xshift26,y2m26), ..
             labels26, "P2.6(d) - T[x](n)=n*x(n)");
mprintf("Rows: n, x, x2\n"); disp([n26;x26;xshift26]);
mprintf("Square: rows y, y1, y2\n"); disp([ysq26;y1sq26;y2sq26]);
mprintf("Difference: rows y, y1, y2\n"); disp([yd26;y1d26;y2d26]);
mprintf("Multiplier: rows y, y1, y2\n"); disp([ym26;y1m26;y2m26]);
mprintf("max|y2-y1|: square=%g, diff=%g, multiplier=%g\n", ..
    max(abs(y2sq26-y1sq26)), max(abs(y2d26-y1d26)), ..
    max(abs(y2m26-y1m26)));
