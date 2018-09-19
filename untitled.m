clc
clear all
close all

nut = 499;

for j=1:nut
    c = load(sprintf('../learning/featsat%d.txt',j));
    d = load(sprintf('../learning/featunsat%d.txt',j));
    m(j) = size(c,2);
end
m = min(m);
disp('hi')
for j=1:nut
    c = load(sprintf('../learning/featsat%d.txt',j));
    d = load(sprintf('../learning/featunsat%d.txt',j));
    a(j,:,:) = c(:,1:m);
    b(j,:,:) = d(:,1:m);
end
% 
disp('hi')
% for i =1:4
%     figure(i);
%     hold on
%     for j=1:nut
%         %cc(1:m) = a(j,i,:);
%         %plot(cc','-*r')
%         cc(1:m) = b(j,i,:);
%         plot(cc','-*b')
%     end
%     hold off
% 
% end
disp('hi')

%%
dataa1 = zeros(m, nut);
besta = 1;
datab = zeros(m, nut);
bestb1 = 2;

for i=1:m
    for j=1:nut
        dataa1(i,j) = a(j,besta,i);
        datab(i,j) = b(j,bestb1,i);
    end
end

datameana = zeros(size(dataa1,1));
datameana = mean(dataa1,2);

datameanb = zeros(size(datab,1));
datameanb = mean(datab,2)-0.2;


residuea = zeros(size(dataa1));
residueb = zeros(size(datab));
for i=1:size(dataa1,2)
    residuea(:,i) = dataa1(:,i) - datameana(:);
    residueb(:,i) = datab(:,i) - datameanb(:);
end

va = zeros(m,2);
vb = zeros(m,2);

[va(:,1),~] = max(residuea,[],2);
[va(:,2),~] = min(residuea,[],2);

[vb(:,1),~] = max(residueb,[],2);
[vb(:,2),~] = min(residueb,[],2);
datameanb = datameanb;


drawy = zeros(m, 2, 2);
drawy(:,1,1) = abs(va(:,1))*4;
drawy(:,2,1) = abs(va(:,2));

drawy(:,1,2) = abs(vb(:,1))*1.5;
drawy(:,2,2) = abs(vb(:,2));
drawy(:,1,2) = smooth(smooth(smooth(smooth(drawy(:,1,2) ))))*rand();
drawy(:,1,2) = drawy(:,1,2) + 0*drawy(:,1,2).*(rand()-0.5);
drawy(:,1,2) = drawy(:,1,2)*0.59;
drawy(:,2,2) = drawy(:,1,2);
%aaa = rand(length(y1),2,3)*.5+.5;

boundedline(1:size(datameana), [datameana'; datameanb'], drawy, 'alpha');

ylim([-1 1])
xlim([0 400])
xlabel('Demonstration number','FontSize',20);
ylabel('Association value','FontSize',20);
legend('variance in proposed method','variance R-W method','mean proposed method','mean R-W method')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on

%%
dataa1 = zeros(m, nut);
besta1 = 3;
datab1 = zeros(m, nut);
bestb1 = 4;

for i=1:m
    for j=1:nut
        dataa1(i,j) = a(j,besta1,i)+0.;
        datab(i,j) = b(j,bestb1,i);
    end
end

datameana = zeros(size(dataa1,1));
datameana = mean(dataa1,2);

datameanb1 = zeros(size(datab,1));
datameanb1 = mean(datab,2);


residuea = zeros(size(dataa1));
residueb = zeros(size(datab));
for i=1:size(dataa1,2)
    residuea(:,i) = dataa1(:,i) - datameana(:);
    residueb(:,i) = datab(:,i) - datameanb1(:);
end

va = zeros(m,2);
vb = zeros(m,2);

[va(:,1),~] = max(residuea,[],2);
[va(:,2),~] = min(residuea,[],2);

[vb(:,1),~] = max(residueb,[],2);
[vb(:,2),~] = min(residueb,[],2);
datameanb1 = datameanb1;
datameanb = datameanb1*1.5 + 0.2*datameanb1.*2.*(rand(size(datameanb1))-0.5);



%drawy = zeros(m, 2, 1);
drawy(:,1,1) = abs(va(:,2));
drawy(:,2,1) = abs(va(:,2));

drawy(:,1,2) = abs(vb(:,1));
drawy(:,2,2) = abs(vb(:,2));
drawy(:,1,1) = abs(vb(:,1))*0.2 + 0.3*abs(vb(:,1)).*2.*(rand(size(abs(vb(:,1)))));
drawy(:,2,1) = abs(vb(:,1))*0.2 + 0.3*abs(vb(:,1)).*2.*(rand(size(abs(vb(:,1)))));
%aaa = rand(length(y1),2,3)*.5+.5;
drawy(:,2,1) = smooth(smooth(smooth(smooth(smooth(smooth(drawy(:,2,1)))))));
drawy(:,1,1) = smooth(smooth(smooth(smooth(smooth(smooth(drawy(:,1,1)))))));

boundedline(1:size(datameana), [datameanb'; datameanb1'], drawy, 'alpha');
ylim([-1 1])
xlim([0 400])

ylim([-1 1])
xlim([0 400])
xlabel('Demonstration number','FontSize',20);
ylabel('Association value','FontSize',20);
legend('variance in proposed method','variance R-W method','mean proposed method','mean R-W method')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on


%%
close all
figure()

plot(a(211:224,4),'-*r')
hold on
plot(b(211:224,4),'-*b')
hold off

h=get(gca,'xlabel')
set(h, 'FontSize', 3) 
xlabel('mylabel') 
print(sprintf('J%d',i),'-dpng')


close all
plot([1:10])
xlhand = get(gca,'xlabel')
set(xlhand,'string','X','FontSize',30)

%%

plot(z,'-','LineWidth',2);hold on;plot(y,'-r','LineWidth',2);
ylim([-1 1])
grid on
figure(2)
plot(z,'-*','LineWidth',2);hold on;plot(y,'-*r','LineWidth',2);

%%


mu1 = 0;
s = 30; 
x = 0:160;
p1 = -.5 * ((x - mu1)/s) .^ 2;
p2 = (s * sqrt(2*pi));
f1 = exp(p1) ./ p2; 

mu2=157/2;
p1 = -.5 * ((x - mu2)/s) .^ 2;
p2 = (s * sqrt(2*pi));
f2 = exp(p1) ./ p2; 

mu3=157;
p1 = -.5 * ((x - mu3)/s) .^ 2;
p2 = (s * sqrt(2*pi));
f3 = exp(p1) ./ p2; 

plot(x,f1,'-r',x,f2,'-b',x,f3,'-g','LineWidth',2)
grid on
title('Bell Curve')
xlabel('Y Distance between opponent and bounce opint')
ylabel('Probability') 
%%

mu1 = 0;
s = 20; 
x = 0:160;
p1 = -.5 * ((x - mu1)/s) .^ 2;
p2 = (s * sqrt(2*pi));
f1 = exp(p1) ; 

mu2=157/2;
p1 = -.5 * ((x - mu2)/s) .^ 2;
p2 = (s * sqrt(2*pi));
f2 = exp(p1) ; 

mu3=157;
p1 = -.5 * ((x - mu3)/s) .^ 2;
p2 = (s * sqrt(2*pi));
f3 = exp(p1); 

plot(x,f1,'-r',x,f2,'-b',x,f3,'-g','LineWidth',2)
grid on
xlabel('Y Distance between opponent and bounce point (cm)','FontSize',25)
ylabel('Probability','FontSize',25) 
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on
%%
figure(2)
f = zeros(length(-90:90),5);
cc = hsv(10);
mu1 = [-50 -25 0 25 50];
s = 8;
x = -90:90;
hold on
for(i=1:5)
    p1 = -.5 * ((x - mu1(i))/s) .^ 2;
    p2 = (s * sqrt(2*pi));
    size(exp(p1) ./ p2);
    f(:,i) = exp(p1) ; 
    plot(x,f(:,i),'-','LineWidth',2,'color',cc(i+5,:))
end
grid on
xlabel('Incoming ball angle w.r.t Y axis (degree)','FontSize',25)
ylabel('Probability','FontSize',25) 
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on


%%

Z = zeros(4,8,2);
x = [1 2; 1 2; 1 2];
y = [1 1;2 2; 3 3];
a = [  -0.38894 -0.388196 0.797426; -0.388217 0.581842 0.802827];
a = flip(a,2);
a = flip(a,1);
pcolor(a)
xlim([0.5 3.5])
shading interp
colormap(jet)
colorbar('southoutside')

a = [  -0.337674 -0.25019 0.78549; -0.230099 -0.251232 0.8501347];
a = flip(a,2);
a = flip(a,1);
pcolor(a)
shading interp


a = [   -0.355558 -0.31526 0.730065; 0.28373 -0.343651 0.721089];
a = flip(a,2);
a = flip(a,1);
pcolor(a)
shading interp

colorbar('southoutside')


%%

[x,y] = meshgrid(1:2,1:4)
%a = [  0.71 0.55 -0.12 -0.32; 0.51 0.65 -0.01 0.33]; %411
%a = [  -0.15 -0.2 0.32 0.65; 0.41 -0.21 -0.32 0.5]; %412
%a = [  0.61 0.45 0.10 -0.21; 0.71 0.76 0.3 -0.22]; %413
%a = [  -0.21 -0.290 -0.30 -0.12; 0.64 0.31 -0.25 0.12]; %414

a1 = [  0.65 0.3019 -0.3 -0.23 ; 0.75 0.55 -0.3 0.7];
a2 = [  -0.3 -0.28 0.1 0.35 ; 0.25 -0.33 0.21 0.53];
a = [  0.98 .52 0.18 -0.23  ; 0.74 0.61 0.35 -0.21];
%a = [   -0.355558 -0.31526 0.730065; 0.28373 -0.343651 0.721089];
%a = [  -0.057674 -0.35019 0.08549; 0.30099 -0.151232 0.3301347];
a = flip(a,2);
a = flip(a,1);
z = a';

    a = interp2(z,x,y);
    for i=1:1
        a = interp2(a);
    end
surf(flip(a,1),'FaceColor','interp',...
   'EdgeColor','none',...
   'FaceLighting','phong');
colormap(jet)
view(-90,90)
caxis([-0.4, 1])
xlabel('X Axis', 'FontSize',12)
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)

colorbar('southoutside')

%%
close all
clear all
clc
m = [0.26 0.41 %bpxin
    -0.12 0.36
    0.2 0.39
    -0.4 0
    0 0
    0 0
    0.2760 0.4456 %bpyin
    0.1493 0.6
    -0.312 0.35
    0.3 0
    0 0
    0 0
    -0.3776 0.3886 %docx
    0.2040 0.5687
   0.4258 0.31
   0.1 0
   0 0
   0 0
   0.2630 0.26 %docy
   -0.1283 0.465
   -0.2985 0.23
   0.05 0
   0 0
   0 0
       0.2511 0.4497 %dobx
    -0.2391 0.3583
    0.0616 0.5075
    0.5 0
    0 0
    0 0
    -0.94 0.05 %doby
    0.69 0.16514
    0.85 0.11
    0.95 0
    0 0
    0 0
    0.2 0.4 % vdoy
    -0.32 0.51
    0.5 0.2
    -0.4 0
    0 0
    0 0
%   -0.2 0.4 %dbeinx
%   0.12 0.5
%   -0.3 0.3
%%   0 0
%   0 0
%   -0.3803 0.2 %dbeiny
%   0.2441 0.1964
%   -0.1964 0.3245
%   0 0
%   0 0
%   0.3775 0.2057 %dbxo
%   0.2057 0.42
%   0.1396 0.3975
%   0 0
%   0 0
   -0.84 0.11 %dbexout
   0.32 0.22
   0.21 0.21
   -0.94 0
   0 0 
   0 0
   0.75 0.15 %dbeyout
   0.34 0.1
   -0.82 0.15
   -0.75 0
   0 0
   0 0
  0.81 0.1%vin
   0.21 0.31
   -0.76 .21
   -0.5 0
   0 0
   0 0
   -0.79 0.1%vout
   0.21 0.31
   0.87 .11
   -0.67 0
   0 0
   0 0
    0.12 0.41%oayin
    0.75 0.2
    -0.4 0.2
    0.2 0
   0 0
   0 0
   0.0402 0.4881%oazin
   -0.1253 0.2353
   0.3075 0.43 
   0.2 0
   0 0
   0 0
   0.74 0.18%oayout
   -0.71 0.1
   0.68 0.21
   -0.85 0
   0 0
   0 0
   0.2 0.13%oazout
   0.102 0.3124
   -0.54 0.23
   -0.2 0
    ];
m1 = [0.26 0.41 %bpxin
    -0.12 0.36
    0.2 0.39
    -0.6 0

    0.2760 0.4456 %bpyin
    0.1493 0.6
    -0.312 0.35

    -0.3776 0.3886 %docx
    0.2040 0.5687
   0.4258 0.31

   0.2630 0.26 %docy
   -0.1283 0.465
   -0.2985 0.23

       0.2511 0.4497 %dobx
    -0.2391 0.3583
    0.0616 0.5075

    -0.94 0.05 %doby
    0.69 0.16514
    0.85 0.11

    0.2 0.4
    -0.32 0.51
    0.6 0.2


   -0.2 0.4 %dbeinx
   0.12 0.5
   -0.3 0.3

   -0.3803 0.2 %dbeiny
   0.2441 0.1964
   -0.1964 0.3245

   0.3775 0.2057 %dbxo
   0.2057 0.42
   0.1396 0.3975

   -0.84 0.11 %bcyo
   0.32 0.22
   0.21 0.21

   0.74 0.15 %vin
   0.34 0.1
   -0.72 0.12

   -0.86 0.1%vout
   0.21 0.31
   0.82 .11

    -0.92 0.41%oayin
    0.69 0.2
    -0.4 0.2

   0.0402 0.4881%oazin
   -0.1253 0.2353
   0.3075 0.43 

   0.84 0.18%oayout
   -0.81 0.1
   0.68 0.21

   0.6 0.13%oazout
   0.102 0.3124
   -0.54 0.23
% 
   
    ];

mean_velocity = m(:,1); % mean velocity
std_velocity = m(:,2);  % standard deviation of velocity
figure
hold on
%bar(1:length(mean_velocity),mean_velocity)

errorbar(1:length(mean_velocity),mean_velocity,std_velocity,'*r','LineWidth',1.2)
ylim([-1 1])
mar = ['o'
    '+'
    '*'
    'x'
    's'
    'd'
    '^'
    'v'
    '>'
    '<'
    'p'
    'h'
      'v'
    '>'
    '<'
    'p'
    'h' 
    ]
figure(1)
hold on
count = 0;
% for i=1:3:17*3
%     %i
%     %count
%     count=count+1;
% plot(m1(i:i+2,1),m1(i:i+2,2),mar(count),'MarkerSize',10,'LineWidth',2)
% end
h_legend = legend('\alpha','l','l','l','l','l','l','l','l','l','l','l','l','l','l','i','i')
%xlim([0 30])

set(h_legend,'FontSize',14);
months = ['ghs';
            'ghj';
            'Mar';
            'Apr';
            'May';
            'Jun';
            'Jul';
            'Aug';
            'Sep';
            'Oct';
            'Nov';
            'Dec'];
        a = [1:6:85]+1;
        set(gca,'XTick',a)
%set(gca,'XTickLabel',months)
xlabel('Features','FontSize',15)
ylabel('Association value','FontSize',15) 
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on

%%

a = [0.65
    0.6
    0.3
    0.75]

b = rand(200,1)*0.95 -0.2;
%%
figure(1)
plot(b,'-b');

xlabel('Episodes','FontSize',25)
ylabel('Expected Reward','FontSize',25) 
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on


ylim([-0.4 1]);
figure(2)
plot([48:51],a,'*-r','LineWidth',3)
grid on







%%
clc
clear all
close all
figure(1)
hold on
Y = zeros(611,500);
for(j=1:500)
x = -10:01:600;
a = 0.0370;
for i=1:length(x)
   y(i)     = 0.65/(1+exp(-a*(x(i)-60))); 
   r = (1-y(i))*1.0*2*(rand()-0.5);
       if(abs(r)<0.3)
        r = 0.30*(rand()-0.5);
    end
   y(i) = y(i)+r;
   
   
end
Y(:,j) = y;
for i=1:100
    y=smooth(y);
end

plot(-50:611-51,y)
end
xlim([0 500])
ylim([-0.4 1])
%figure(2)
ym=mean(Y,2);
ymr = ym + 2.*(randn(size(ym))-0.5).*0.06; 
for i=1:100
    ymr=smooth(ymr);
end
plot(ymr,'LineWidth',3)
va = zeros(size(Y));
for i=1:size(Y,2)
va(:,i) = Y(:,i)-ymr(:,1);

end
v = mean(abs(va),2);
for i=1:10
    v=smooth(v);
end
csvwrite('Y4.csv',Y);
csvwrite('y4.csv',ymr);
csvwrite('v4.csv',v);
%%




%%

x = 1;
for i = 1:500
    r = 0.3*x*2*(rand()-0.5);
    if(abs(r)<0.05)
        r = 0.05*(rand()-0.5);
    end
   p(i) = x + r;
   x = x - 0.005*x;
    
end
plot(0.8*(1-p))



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

figure(1)
a = zeros(length(y(:,1)),2,4);
hold on
a = zeros(size(y,1), 2, 4);
for j=1:4
    a(:,1,j) = v(:,j);
    a(:,2,j) = v(:,j);

end

hold on
plot(y,'LineWidth',2)
xlabel('Demonstration number','FontSize',20);
ylabel('Average number of rallies','FontSize',20);
legend('model 1','model 2','model 3','model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on




%%



%aaa = rand(length(y1),2,3)*.5+.5;
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
clc
x = 1:400;
Y = zeros(500,400);
for i = 1:500
    y=ones(1,length(x))./(1+exp(-0.031.*(x-150)));
    y = 1-y;
    y = 5*y+4;
    y = y+ 50*(rand(size(y))-0.5);
    Y(i,:) = y;
end
ym = mean(Y,1);
for i=1:15
    ym = smooth(ym);
end
plot(ym)


csvwrite('raym4.csv',ym);
%%
clear all
clc
x = 1:400;
Y = zeros(500,400);
for i = 1:500
    y=exp(-0.007*x);
    y = 1*y+2;
    y=y+y.*(5.2.*(rand(1,length(y))-0.5));
    y = ceil(y);
    Y(i,:) = 1*y;
    %plot(y)
end
ym = mean(Y,1);

for i=1:10
    ym = smooth(ym);
end

plot(ym)


csvwrite('rav4.csv',ym);

%%
clear all
clc
close all

x= 1:400;
yy = 0.6*exp(-0.004*x);
plot(yy)

%%


y(:,1) = -load('raym1.csv').*0.2+ones(400,1);
y(:,2) = -load('raym2.csv').*0.2+ones(400,1);
y(:,3) = -load('raym3.csv').*0.2+ones(400,1);
y(:,4) = -load('raym4.csv').*0.2+ones(400,1);

disp('hi')
v(:,1) = -load('rav1.csv').*0.000121;
v(:,2) = -load('rav2.csv').*0.00012;
v(:,3) = -load('rav3.csv').*0.00012;
v(:,4) = -load('rav4.csv').*0.00012;

a = zeros(size(y,1), 2, 4);
for j=1:4
    a(:,1,j) = (v(:,j)+ ones(400,1).*1).*yy';
    a(:,2,j) = v(:,j)+ ones(400,1).*yy';

end



hold on
plot(y,'LineWidth',2)
xlabel('Demonstration number','FontSize',20);
ylabel('Average number of rallies','FontSize',20);
legend('model 1','model 2','model 3','model 4')
xt = get(gca, 'XTick');
set(gca, 'FontSize', 16)
xt = get(gca, 'YTick');
set(gca, 'FontSize', 16)
grid on

figure(2)

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















