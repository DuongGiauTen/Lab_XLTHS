n =-5:5;
ur = n .* bool2s(n >= 0);
plot2d3(n, ur);
plot(n, ur, "ro");
title("Unit Ramp Signal");
xlabel("n");
ylabel("ur(n)");
