%% Formatting
clc
clear
close all
format shortg
%% Begin Question 4

% Running Discrete system
numd = 0.25 * [1 -0.8];
dend = [1 -1.9 0.95];
u = randn(1000, 1);
y = dlsim(numd, dend, u);
sigma = 0.01;
Y = y + sigma * randn(1000, 1);

H = [u(2:end-1) -u(1:end-2) Y(2:end-1) -Y(1:end-2)];
est = (H' * H)^-1 * H' * Y(3:end)

numesti = [est(1) -est(2)];
denesti = [1 -est(3) est(4)];
figure
hold on
bode(tf(numd,dend,1))
bode(tf(numesti,denesti,1))