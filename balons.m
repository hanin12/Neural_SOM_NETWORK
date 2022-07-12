clc;
clear;
RGBImage = imread('balons11.jpeg');
disp(RGBImage);
d=imshow('balons11.jpeg');
impixelinfo(d);

csvwrite('balons11.txt', reshape(RGBImage, size(RGBImage,1),[]));