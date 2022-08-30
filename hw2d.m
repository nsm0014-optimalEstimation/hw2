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
t = linspace(0,100,1000);
samples = 10;
r = 100*sin(omega*t);
R = sigma^2*eye(samples);
P = eye(2);
LSQ_esti = [a;b];
for k = 1:1000
    [gaussianDistVector] = gaussianDistFCN([1 length(t)],sigma,meanq3);
    g = a.*r + b + gaussianDistVector;

    for i = 1:samples
        H = [r(1:samples)' ones(samples,1)];

        K = P*H'*(H*P*H' + R)^-1;
        
        LSQ_esti = LSQ_esti + K*(g(i) - H*LSQ_esti);

        P = (P^-1 + H'*R^-1*H)^-1;

        a_esti(i,k) = LSQ_esti(1,:);
        b_esti(i,k) = LSQ_esti(2,:);

        astd(i,k) = sqrt(P(1,1));
        bstd(i,k) = sqrt(P(2,2));


    end


        aavg(k) = mean(a_esti(:,k),1);
        bavg(k) = mean(b_esti(:,k),1);

        astd(k) = std(a_esti(:,k),0,1);
        bstd(k) = std(b_esti(:,k),0,1);

end
fig1 = figure('Position',[500 500 800 400]);
xlabel('time [s]','FontSize',16)
ylabel('coefficient values','FontSize',16)
hold on
yline(a,LineWidth=2,Color=[0.15 0.15 0.15]);
yline(b,LineWidth=2,Color=[1 0.15 0.15]);
ylim([0 6])
saveas(fig1,'Q3d.png')
