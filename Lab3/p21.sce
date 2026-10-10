// LAB 3 - PROBLEM 2.1
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

function z = signal21(n)
    z = zeros(1, length(n));
    j = find(n >= -3 & n <= -1); z(j) = 1+n(j)/3;
    j = find(n >= 0 & n <= 3); z(j) = 1;
endfunction
n = -8:8;

// (a) Tin hieu ban dau.
x = signal21(n);
show_signals(list(n), list(x), "(a) x(n)", "P2.1(a)");

// (b1) Dao truoc, tre 4 mau sau.
xf = signal21(-n); b1 = signal21(4-n);
show_signals(list(n,n,n), list(x,xf,b1), ..
    ["x(n)", "v(n) = x(-n)", "(b1) v(n-4) = x(4-n)"], "P2.1(b1)");

// (b2) Tre 4 mau truoc, dao sau.
xd = signal21(n-4); b2 = signal21(-n-4);
show_signals(list(n,n,n), list(x,xd,b2), ..
    ["x(n)", "w(n) = x(n-4)", "(b2) w(-n) = x(-n-4)"], "P2.1(b2)");

// (c) Thay truc tiep chi so -n+4.
c = signal21(-n+4);
show_signals(list(n), list(c), "(c) x(-n+4)", "P2.1(c)");

// (d) So sanh thu tu thuc hien.
show_signals(list(n,n,n), list(b1,b2,c), ..
    ["Fold then delay: x(4-n)", "Delay then fold: x(-n-4)", ..
     "Direct substitution: x(-n+4)"], "P2.1(d)");

// (e) Bieu dien bang xung va buoc don vi.
xdelt = bool2s(n == -2)/3+2*bool2s(n == -1)/3 ..
      +bool2s(n == 0)+bool2s(n == 1) ..
      +bool2s(n == 2)+bool2s(n == 3);
xstep = (bool2s(n >= -2)+bool2s(n >= -1) ..
       +bool2s(n >= 0))/3-bool2s(n >= 4);
show_signals(list(n,n,n), list(x,xdelt,xstep), ..
    ["Definition x(n)", "Impulse representation", ..
     "Step representation"], "P2.1(e)");
mprintf("Rows: n, x, b1, b2, c\n"); disp([n; x; b1; b2; c]);
mprintf("b1 vs c error = %.3e\n", max(abs(b1-c)));
mprintf("Impulse form error = %.3e\n", max(abs(x-xdelt)));
mprintf("Step form error = %.3e\n", max(abs(x-xstep)));
