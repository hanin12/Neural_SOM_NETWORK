clc;
clear;
values = [0.5 0.3 0.2];
colors = [24 70 187; 208 118 22; 88 90 28]/255;

n = numel(values);
x = [0 cumsum(values)]*[1;1];
y = ones(2,n+1)*[1;0];

vertices = [x(:) y(:)];
faces = [1 2 4 3]+((2:2:2*n)-2)';

p = patch(...
    'Vertices',vertices,...
    'Faces',faces,...
    'FaceVertexCData', colors, ...
    'FaceColor', 'flat');

xlim([-0.1 1.1]);
ylim([-0.1 1.1]);