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
sigma = 0.75;
Y = y + sigma * randn(1000, 1);

H = [u(2:end-1) -u(1:end-2) Y(2:end-1) -Y(1:end-2)];
est = (H' * H)^-1 * H' * Y(3:end);

numesti = [est(1) -est(2)];
denesti = [1 -est(3) est(4)];

% Plotting bode diagram for part b ii
fig1 = figure('position',[800 600 900 600]);
hold on
bode(tf(numd,dend,1))
bode(tf(numesti,denesti,1))
legend('True','Estimate','Location','best')
saveas(fig1, 'bode_4d.png')

% Signal to noise ratio for part b iii
sig2noise = std(Y)/sigma;

% observer vs true outputs plot part b iv
fig2 = figure('position',[800 600 900 600]);
hold on
plot(1:1000,Y)
plot(1:1000,y,LineStyle="-.",LineWidth=2)
legend('True','Estimate','Location','best')
saveas(fig2, 'output_4d.png')


% Part C
numSims = 10;
est = zeros(4,numSims);

for i = 1:numSims

    u = randn(1000,1);
    numSamps = length(u);

    y = dlsim(numd, dend, u);

    sigma = 0.5;
    noise = sigma * randn(1000,1);
    Y = y + noise;

    H = [u(2:end-1) -u(1:end-2) Y(2:end-1) -Y(1:end-2)];

    est(:,i) = (H' * H)^-1 * H' * Y(3:end);

end

P = sigma * (H' * H)^-1;

mean_est = mean(est,2);
std_est = std(est,0,2);

perError1 = (abs(mean_est(1) - 0.25)/0.25)*100
perError2 = (abs(mean_est(2) - 0.2)/0.2)*100
perError3 = (abs(mean_est(3) - 1.9)/1.9)*100
perError4 = (abs(mean_est(4) - 0.95)/0.95)*100
perError5 = (abs(std_est(1) - 9e-6)/9e-6)*100
perError6 = (abs(std_est(2) - 2e-5)/2e-5)*100
perError7 = (abs(std_est(3) - 3e-4)/3e-4)*100
perError8 = (abs(std_est(4) - 3e-4)/3e-4)*100