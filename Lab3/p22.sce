// LAB 3 - PROBLEM 2.2
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
base22 = [1 1 1 1 0.5 0.5]; o22 = 2;
n22 = -6:7;
x22 = sample_at(base22,o22,n22);
xr22 = sample_at(base22,o22,-n22);

// (a) Tre 2 mau.
a22 = sample_at(base22,o22,n22-2);
show_signals(list(n22,n22), list(x22,a22), ..
    ["x(n)", "(a) x(n-2)"], "P2.2(a)");

// (b) Dao roi tre 4 mau.
b22 = sample_at(base22,o22,4-n22);
show_signals(list(n22,n22,n22), list(x22,xr22,b22), ..
    ["x(n)", "x(-n)", "(b) x(4-n)"], "P2.2(b)");

// (c) Tien 2 mau.
c22 = sample_at(base22,o22,n22+2);
show_signals(list(n22,n22), list(x22,c22), ..
    ["x(n)", "(c) x(n+2)"], "P2.2(c)");

// (d) Nhan voi buoc u(2-n).
u22 = bool2s(n22<=2); d22 = x22.*u22;
show_signals(list(n22,n22,n22), list(x22,u22,d22), ..
    ["x(n)", "u(2-n)", "(d) x(n)u(2-n)"], "P2.2(d)");

// (e) Nhan x(n-1) voi xung delta(n-3).
v22 = sample_at(base22,o22,n22-1);
delta22 = bool2s(n22==3); e22 = v22.*delta22;
show_signals(list(n22,n22,n22), list(v22,delta22,e22), ..
    ["x(n-1)", "delta(n-3)", "(e) x(n-1)delta(n-3)"], "P2.2(e)");

// (f) Thay chi so n bang n^2.
f22 = sample_at(base22,o22,n22.^2);
show_signals(list(n22,n22), list(x22,f22), ..
    ["x(n)", "(f) x(n^2)"], "P2.2(f)");

// (g) Thanh phan chan.
xe22 = (x22+xr22)/2;
show_signals(list(n22,n22,n22), list(x22,xr22,xe22), ..
    ["x(n)", "x(-n)", "(g) Even part xe(n)"], "P2.2(g)");

// (h) Thanh phan le.
xo22 = (x22-xr22)/2;
show_signals(list(n22,n22,n22), list(x22,xr22,xo22), ..
    ["x(n)", "x(-n)", "(h) Odd part xo(n)"], "P2.2(h)");
mprintf("Rows: n, x, a, b, c, d, e, f, even, odd\n");
disp([n22;x22;a22;b22;c22;d22;e22;f22;xe22;xo22]);
mprintf("Reconstruction error = %.3e\n", max(abs(xe22+xo22-x22)));
