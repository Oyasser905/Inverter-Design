function alphas = solve_harmonics_multilevel()
    clc
    clear
    syms x1 x2 x3

    F1 = ((4*100)/(3*pi)) * (cos(x1) + cos(x2) + cos(x3)) == 50 * sqrt(2);
    F2 = ((4*100)/(3*3*pi)) * (cos(3*x1) + cos(3*x2) + cos(3*x3)) == 0;
    F3 = ((4*100)/(3*5*pi)) * (cos(5*x1) + cos(5*x2) + cos(5*x3)) == 0;

    [x1, x2, x3] = solve (F1, F2, F3);
    
    alpha1 = abs((double(vpa(x1(end), 30))*(180/pi)));
    alpha2 = abs(double(vpa(x2(end), 30))*(180/pi));
    alpha3 = abs(double(vpa(x3(end), 30))*(180/pi));
    alphas = [alpha1,alpha2,alpha3];
end