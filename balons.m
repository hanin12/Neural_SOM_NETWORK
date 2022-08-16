clc;
clear;
RGBImage = imread('soms.jpg');
disp(RGBImage);
d=imshow('soms.jpg');
impixelinfo(d);

csvwrite('soms.txt', reshape(RGBImage, size(RGBImage,1),[]));