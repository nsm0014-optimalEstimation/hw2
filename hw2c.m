%% Formatting
clc
clear
close all
format shortg
%% Begin question 3
a = 5;
b = .5;
omega = pi/0.25;
meanq3 = 0;
sigma = 0.3;
t = linspace(0,100,1001);
samples = 1000;
r = 100*sin(omega*t);
R = sigma^2*eye(samples);
for k = 1:1000
    [gaussianDistVector] = gaussianDistFCN([1 length(t)],sigma,meanq3);

    for i = 1:samples
        g(i,:) = a.*r(i) + b + gaussianDistVector(i);
    end

    H = [r(1:samples)' ones(samples,1)];
    LSQ_esti(:,k) = (H'*H)^-1*H'*g;
    P = (H'*R^-1*H)^-1;
end
fig1 = figure('Position',[500 500 800 400]);
xlabel('time [s]','FontSize',16)
ylabel('value','FontSize',16)
hold on
plot(t,r,LineWidth=2);
xlim([0 10])
saveas(fig1,'Q3a_r.png')

fig2 = figure('Position',[500 500 800 400]);
xlabel('samples','FontSize',16)
ylabel('noise','FontSize',16)
hold on
plot(t,gaussianDistVector,LineWidth=1);
xlim([0 10])
saveas(fig2,'Q3c_n.png')

fig3 = figure('Position',[500 500 800 400]);
xlabel('samples','FontSize',16)
ylabel('value','FontSize',16)
hold on
plot(1:samples,g,LineWidth=1);
saveas(fig3,'Q3c_g.png')

fig3 = figure('Position',[500 500 800 400]);
xlabel('samples','FontSize',16)
ylabel('value','FontSize',16)
hold on
plot(1:samples,g,LineWidth=1);
saveas(fig3,'Q3c_g.png')

fig4 = figure('Position',[500 500 800 400]);
tiledlayout(2,1)
nexttile
xlabel('Simulations','FontSize',16)
ylabel('a','FontSize',16)
hold on
scatter(1:1000,LSQ_esti(1,:));
yline(a,LineWidth=2,Color=[0 0 0])
yline(std(LSQ_esti(1,:)) + a,LineWidth=2,Color=[1 0 0])
yline(-std(LSQ_esti(1,:)) + a,LineWidth=2,Color=[1 0 0])
ylim([4.9995 5.0005])


nexttile
xlabel('Simulations','FontSize',16)
ylabel('b','FontSize',16)
hold on
scatter(1:1000,LSQ_esti(2,:));
yline(b,LineWidth=2,Color=[0 0 0])
yline(std(LSQ_esti(2,:)) + b,LineWidth=2,Color=[1 0 0])
yline(-std(LSQ_esti(2,:)) + b,LineWidth=2,Color=[1 0 0])
ylim([.45 .55])
saveas(fig4,'Q3c_10000.png')

mean(LSQ_esti(1,:))
mean(LSQ_esti(2,:))

std(LSQ_esti(1,:))
std(LSQ_esti(2,:))

