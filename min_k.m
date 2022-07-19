clc;
clear;
T=1;
rd=2;
sigma_initial=0.05;
alpha_initial=0.9;
number_of_vectors=8900;
number_of_neuorn_inputs=26700;
neighbour_radius_initial=number_of_vectors/2;

%{
    for v=1:9 %number of input neuorns 
       for x=1:3
       l=input('x ');
        I(x,v)=l;
        
       end
       
end

disp(I)
%}

A2=imread('balons11.jpeg');
imshow(A2);
    
A=importdata('balons11.txt');
nr=1;
ng=1;
nb=1;
for i=1:89
    for j=1:300
        I(i,j)=A(i,j);
       
    end
end
%first neuorn for red color
    for i1=1:89
    for j1=1:3:300
       
        X1(nr)=I(i1,j1);
        
        nr=nr+1;
    end
end
disp(X1);
    size(X1)
    %sceond neuorn for green color
    for i2=1:89
    for j2=2:3:300
       
        X2(ng)=I(i2,j2);
        
        ng=ng+1;
    end
end
disp(X2);
    size(X2)
    %third neuorn for blue color
    for i3=1:89
    for j3=3:3:300
       
        X3(nb)=I(i3,j3);
        
        nb=nb+1;
    end
end
disp(X3);
    size(X3)

   
  