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
figure
for j=1:4
    a(:,1,j) = v(:,j);
    a(:,2,j) = v(:,j);
% plot(y(:,j),'LineWidth',2)
% hold on
% pause();

end



figure
% b = y(:,1);
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


y1(:,1) = -load('raym1.csv').*0.2+ones(400,1);
y1(:,2) = -load('raym2.csv').*0.2+ones(400,1);
y1(:,3) = -load('raym3.csv').*0.2+ones(400,1);
y1(:,4) = -load('raym4.csv').*0.2+ones(400,1);

% disp('hi')
v1(:,1) = -load('rav1.csv').*0.000121;
v1(:,2) = -load('rav2.csv').*0.00012;
v1(:,3) = -load('rav3.csv').*0.00012;
v1(:,4) = -load('rav4.csv').*0.00012;

a = zeros(size(y1,1), 2, 4);a1 = zeros(size(y1,1), 2, 4);

x1= 1:400;
yy1 = 0.6*exp(-0.004*x1);

for j=1:4
    a(:,1,j) = (v1(:,j)+ ones(400,1).*1).*yy1';
    a(:,2,j) = v1(:,j)+ ones(400,1).*yy1';


end




% figure()
% 
% %aaa = rand(length(y1),2,3)*.5+.5;
% % b = y(:,1);
% boundedline(1:size(y1,1), y1, a, 'alpha');
% 
% %ylim([-0.4 1])
% xlim([0 400])
% xlabel('Demonstration number','FontSize',20);
% ylabel('Earned reward','FontSize',20);
% legend('variance of model 1','variance of model 2','variance of model 3','variance of model 4','mean of model 1','mean of model 2','mean of model 3','mean of model 4')
% xt = get(gca, 'XTick');
% set(gca, 'FontSize', 16)
% xt = get(gca, 'YTick');
% set(gca, 'FontSize', 16)
% grid on
% %ylim([-0.4 1])
%%
close all
figure()
plot(y1(:,3),'LineWidth',2) ;hold on
plot(y1(:,1),'LineWidth',2) ;
xlabel('Demonstration number','FontSize',20);
ylabel('Average number of rallies','FontSize',20);
legend('model 1','model 2','model 3','model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on
hold off

figure()
plot(y1(:,3),'LineWidth',2) ;hold on
plot(y1(:,2),'LineWidth',2) ;
xlabel('Demonstration number','FontSize',20);
ylabel('Average number of rallies','FontSize',20);
legend('model 1','model 2','model 3','model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on
hold off

figure()
plot(y1(:,3),'LineWidth',2) ;hold on
plot(y1(:,3),'LineWidth',2) ;
xlabel('Demonstration number','FontSize',20);
ylabel('Average number of rallies','FontSize',20);
legend('model 1','model 2','model 3','model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on
hold off

figure()
plot(y1(:,3),'LineWidth',2) ;hold on
plot(y1(:,4),'LineWidth',2) ;
xlabel('Demonstration number','FontSize',20);
ylabel('Average number of rallies','FontSize',20);
legend('model 1','model 2','model 3','model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on
hold off



%% model 1

figure()
plot(y(:,1),'LineWidth',2) ;hold on
plot(y(:,3)+0.35,'LineWidth',2) ;
plot(y(:,4)-0.2,'LineWidth',2) ;

xlabel('Demonstration number','FontSize',20);
ylabel('Average number of rallies','FontSize',20);
legend('model 1','model 2','model 3','model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on
hold off
%%
figure()

%aaa = rand(length(y1),2,3)*.5+.5;
% b = y(:,1);
boundedline(1:size(y,1), y(:,1), a(:,:,1), 'alpha');

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
