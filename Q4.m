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

H = [u(2:end-1) -u(2:end-2) Y(2:end-1) -Y(2:end-2)];