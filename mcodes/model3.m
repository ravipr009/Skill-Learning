clear all
clc
close all

y(:,1) = -load('raym1.csv').*0.2+ones(400,1);
y(:,2) = -load('raym2.csv').*0.2+ones(400,1);
y(:,3) = -load('raym3.csv').*0.2+ones(400,1);
y(:,4) = -load('raym4.csv').*0.2+ones(400,1);

% disp('hi')
v(:,1) = -load('rav1.csv').*0.000121;
v(:,2) = -load('rav2.csv').*0.00012;
v(:,3) = -load('rav3.csv').*0.00012;
v(:,4) = -load('rav4.csv').*0.00012;

ym(:,1) = y(:,3);
ym(:,2) = y(:,2)-0.45;
ym(:,3) = y(:,1)-0.75;


vm(:,1) = v(:,3);
vm(:,2) = v(:,2);
vm(:,3) = v(:,1);


a = zeros(size(ym,1), 2, 3);

x1= 1:400;
yy1 = 0.6*exp(-0.004*x1);

for j=1:3
    a(:,1,j) = (vm(:,j)+ ones(400,1).*1).*yy1';
    a(:,2,j) = vm(:,j)+ ones(400,1).*yy1';


end
figure
boundedline(1:size(ym,1), ym, a, 'alpha');

%ylim([-0.4 1])
xlim([0 400])
xlabel('Demonstration number','FontSize',20);
ylabel('Expected reward','FontSize',20);
legend('variance of model 1','variance of model 2','variance of model 3','mean of model 1','mean of model 2','mean of model 3')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on
% ylim([-0.4 1])