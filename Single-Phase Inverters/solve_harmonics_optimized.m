function alphas = solve_harmonics_optimized()
    function F = fun(x)
        F(1) = double((400/pi)*(vpa(cosd(x(1))) - vpa(cosd(x(2))) + vpa(cosd(x(3)))) - 50*sqrt(2));
        F(2) = double((400/3*pi)*(vpa(cosd(3 * x(1))) - vpa(cosd(3 * x(2))) + vpa(cosd(3 * x(3))))); 
        F(3) = double((400/5*pi)*(vpa(cosd(5 * x(1))) - vpa(cosd(5 * x(2))) + vpa(cosd(5 * x(3))))); 
    end

    alpha_op_1 = 0;
    alpha_op_2 = 0;
    alpha_op_3 = 0;
    initial_op = [alpha_op_1,alpha_op_2,alpha_op_3]; %Initial condition

    while ((alpha_op_1 > (90) || alpha_op_1 <= 0) || (alpha_op_2 > (90) || alpha_op_2 <= 0) || (alpha_op_3 > (90) || alpha_op_3 <= 0))
        [alphas] = fsolve(@fun,initial_op);
        alpha_op_1 = alphas(1);
        alpha_op_2 = alphas(2);
        alpha_op_3 = alphas(3);
        initial_op = initial_op + 1;
    end
    clc
end