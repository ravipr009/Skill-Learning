clear all
clc
close all

y(:,1) = load('y1.csv');
y(:,2) = load('y3.csv');
y(:,3) = load('y2.csv');
y(:,4) = load('y4.csv');


v(:,1) = load('v1.csv');
v(:,2) = load('v3.csv');
v(:,3) = load('v2.csv');
v(:,4) = load('v4.csv');

ym(:,1) = 10*(y(:,3)+0.35);
ym(:,2) = 10*y(:,1);
ym(:,3) = 10*(y(:,4)-0.2);


vm(:,1) = 5*v(:,3);
vm(:,2) = 8*v(:,1);
vm(:,3) = 8*v(:,4);


a = zeros(size(ym,1), 2, 3);

for j=1:3
    a(:,1,j) = vm(:,j);
    a(:,2,j) = vm(:,j);


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