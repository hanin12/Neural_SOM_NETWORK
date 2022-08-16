clc;
clear;
T=11;
rd=2;
sigma_initial=0.05;
alpha_initial=0.9;
number_of_vectors=9;
number_of_neuorn_inputs=27;
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
    
 sprev=rng(1,'v5uniform')
     I=randi([0 1],3,16)