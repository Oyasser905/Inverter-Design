clc
clear
%Inputs
Vdc = 100;
V1rms = 50;
f = 50;
R = 33;
L = 33e-3;
%Quasi control code
alpha = acosd((V1rms*sqrt(2)*pi)/(4*Vdc)); 
delay = (1/(2*f))+(alpha/(2*f*pi));
%Optimized PWM control code
alphas1 = solve_harmonics_optimized();
%Sort the control angles
alphas1_sorted = sort(alphas1);
alpha_op_1 = alphas1_sorted(1);
alpha_op_2 = alphas1_sorted(2);
alpha_op_3 = alphas1_sorted(3);
%Change from angle to time
t_op_1 = alpha_op_1 * (0.02/360);
t_op_2 = alpha_op_2 * (0.02/360);
t_op_3 = alpha_op_3 * (0.02/360);
%Multi-level control code
alphas2 = solve_harmonics_multilevel();
% Sort the control angles
alphas2_sorted = sort(alphas2);
alpha_mul_1 = alphas2_sorted(1);
alpha_mul_2 = alphas2_sorted(2);
alpha_mul_3 = alphas2_sorted(3);
%Change from angle to time
t_mul_1 = alpha_mul_1 * (0.02/360);
t_mul_2 = alpha_mul_2 * (0.02/360);
t_mul_3 = alpha_mul_3 * (0.02/360);
%Display alphas in degrees
fprintf('Quasi\n======================================\n')
fprintf('alpha = %5.2f\n' ,alpha);
fprintf('======================================\nOptimized PWM\n======================================\n')
fprintf('alpha1 = %5.2f\t|t1 = %5.2e seconds\nalpha2 = %5.2f\t|t2 = %5.2e seconds\nalpha3 = %5.2f\t|t3 = %5.2e seconds\n' ,alpha_op_1,t_op_1,alpha_op_2,t_op_2,alpha_op_3,t_op_3);
fprintf('======================================\nMulti-level\n======================================\n')
fprintf('alpha1 = %5.2f\t|t1 = %5.2e seconds\nalpha2 = %5.2f\t|t2 = %5.2e seconds\nalpha3 = %5.2f\t|t3 = %5.2e seconds\n' ,alpha_mul_1,t_mul_1,alpha_mul_2,t_mul_2,alpha_mul_3,t_mul_3);