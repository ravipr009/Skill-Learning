%%
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


a = zeros(size(y,1), 2, 4);
for j=1:4
    a(:,1,j) = v(:,j);
    a(:,2,j) = v(:,j);

end

figure
plot(y,'LineWidth',2)
xlabel('Demonstration number','FontSize',20);
ylabel('Average number of rallies','FontSize',20);
legend('model 1','model 2','model 3','model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on

figure
b = y(:,1);
boundedline(1:size(y,1), y, a, 'alpha');

%ylim([-0.4 1])
xlim([0 400])
xlabel('Demonstration number','FontSize',20);
ylabel('Expected reward','FontSize',20);
legend('variance of model 1','variance of model 2','variance of model 3','variance of model 4','mean of model 1','mean of model 2','mean of model 3','mean of model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on
ylim([-0.4 1])
%%
clear all
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

a = zeros(size(y,1), 2, 4);
x= 1:400;
yy = 0.6*exp(-0.004*x);

for j=1:4
    a(:,1,j) = (v(:,j)+ ones(400,1).*1).*yy';
    a(:,2,j) = v(:,j)+ ones(400,1).*yy';

end



% hold on
figure
plot(y,'LineWidth',2)
xlabel('Demonstration number','FontSize',20);
ylabel('Average number of rallies','FontSize',20);
legend('model 1','model 2','model 3','model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on

figure()

%aaa = rand(length(y1),2,3)*.5+.5;
b = y(:,1);
boundedline(1:size(y,1), y, a, 'alpha');

%ylim([-0.4 1])
xlim([0 400])
xlabel('Demonstration number','FontSize',20);
ylabel('Earned reward','FontSize',20);
legend('variance of model 1','variance of model 2','variance of model 3','variance of model 4','mean of model 1','mean of model 2','mean of model 3','mean of model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on
%ylim([-0.4 1])





