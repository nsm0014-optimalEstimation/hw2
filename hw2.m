%% Formatting
clc
clear
close all
format shortg
%% Begin question 3
a = 5;
b = .5;
omega = pi/0.25;
mean = 0;
sigma = 0.3;
t = linspace(0,100,1001);
samples = 10;
r = 100*sin(omega*t);
for k = 1:1000
    [gaussianDistVector] = gaussianDistFCN([1 length(t)],sigma,mean);

    for i = 1:samples
        g(i,:) = a.*r(i) + b + gaussianDistVector(i);
    end

    H = [r(1:samples)' ones(samples,1)];
    LSQ_esti(:,k) = (H'*H)^-1*H'*g;
end
fig1 = figure('Position',[500 500 800 400]);
xlabel('time [s]','FontSize',16)
ylabel('value','FontSize',16)
hold on
plot(t,r,LineWidth=2);
xlim([0 10])
saveas(fig1,'Q3a_r.png')

fig2 = figure('Position',[500 500 800 400]);
xlabel('time [s]','FontSize',16)
ylabel('noise','FontSize',16)
hold on
plot(t,gaussianDistVector,LineWidth=1);
xlim([0 10])
saveas(fig2,'Q3a_n.png')

fig3 = figure('Position',[500 500 800 400]);
xlabel('time [s]','FontSize',16)
ylabel('value','FontSize',16)
hold on
plot(1:samples,g,LineWidth=1);
saveas(fig3,'Q3a_g.png')

fig3 = figure('Position',[500 500 800 400]);
xlabel('time [s]','FontSize',16)
ylabel('value','FontSize',16)
hold on
plot(1:samples,g,LineWidth=1);
saveas(fig3,'Q3a_g.png')



