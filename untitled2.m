clear all 
close all

x = linspace(0, 2*pi, 50);
y1 = sin(x);
y2 = cos(x);
y3 = 0.5*cos(x);
e1 = rand(size(y1))*.5+.5;
e2 = [.25 .5];
e3 = [.01 .01];

ax(1) = subplot(2,2,1);
[l,p] = boundedline(x, y1, e1, '-b*', x, y2, e2, '--ro');
outlinebounds(l,p);
title('Opaque bounds, with outline');

ax(2) = subplot(2,2,2);
aaa = rand(length(y1),2,3)*.5+.5;
boundedline(x, [y1;y2;y3], aaa, 'alpha');
title('Transparent bounds');

ax(3) = subplot(2,2,3);
boundedline([y1;y2], x, e1(1), 'orientation', 'horiz')
title('Horizontal bounds');

ax(4) = subplot(2,2,4);
boundedline(x, repmat(y1, 4,1), permute(0.5:-0.1:0.2, [3 1 2]), ...
            'cmap', cool(4), 'transparency', 0.5);
title('Multiple bounds using colormap');

