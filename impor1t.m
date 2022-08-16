clc;
clear;
A=importdata('balons11.txt');

for i=1:89
    for j=1:300
        I(i,j)=A(i,j);
    end
end
st=0;
r1=0;
 sprev=rng(1,'v5uniform')
     R=randi([0 255],89,100);
            G=randi([0 255],89,100);
             B=randi([0 255],89,100);
      k=1;
        for n=1:300
        for i=1:89
          
            for j=1:100
              
              if k+3<=300 
              
           D(i,j)=sqrt((I(i,k)-R(i,j))^2+(I(i,k+1)-R(i,j))^2+(I(i,k+2)-R(i,j))^2);
              end
                  
            end
            
        end
            k=k+3;
        end
       
      
        disp('this is differences matrix');
        disp(D);