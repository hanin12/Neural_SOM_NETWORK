clc;
clear;
T=100;
rd=2;
sigma_initial=0.05;
alpha_initial=0.9;
number_of_vectors=300;
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

A2=imread('balons11.jpeg');
imshow(A2);
    
A=importdata('balons11.txt');

for i=1:89
    for j=1:300
        I(i,j)=A(i,j);
    end
end
    

    

   
    sprev=rng(1,'v5uniform')
     R=randi([0 255],89,100);
            G=randi([0 255],89,100);
             B=randi([0 255],89,100);
    
    
    
for t=1:T
    alpha=alpha_initial*exp((1-t)/T);
    sigma=sigma_initial*exp((1-t)/T);
    max_neighbour_radius=round(neighbour_radius_initial*exp((1-t)/(log(T))));
   
         k=1;
        for n=1:300
        for i=1:89
          
            for j=1:100
              
              if k+3<=300 
              
           D(i,j)=sqrt((I(i,k)-R(i,j))^2+(I(i,k+1)-G(i,j))^2+(I(i,k+2)-B(i,j))^2);
              end
                  
            end
            
        end
            k=k+3;
      
       
        
        min=D(1,1);
        for i=1:89
            for j=1:100
                if(j+1>100)
                      if ((D(i,j)<=D(i,j-1)) && (D(i,j)<=min))
                          min=D(i,j);
                          m=i;
                          c=j;
                          
                      end
                
                elseif ((j-1>=1))
                 if ((D(i,j)<=D(i,j-1)) && (D(i,j)<=min) && (D(i,j)<=D(i,j+1)))
                          min=D(i,j);
                          m=i;
                          c=j;
                          
                 end
                elseif ((i-1>=1))
                     if ((D(i,j)<=D(i,j+1)) && (D(i,j)<=min) && (D(i,j)<=D(i-1,j)))
                          min=D(i,j);
                          m=i;
                          c=j;
                          
                      end
            end 
                  end
        end
        
          % update the winning neuron
        e_factor = exp(-((m-m).^2+(c-c).^2)/2*sigma^2);
       R(m,c)=R(m,c)+alpha*(I(1,n)-R(m,c));
       G(m,c)=G(m,c)+alpha*(I(2,n)-G(m,c));
       B(m,c)=B(m,c)+alpha*(I(3,n)-B(m,c));
       
        % update the neighbour neurons
       for neighbour_radius=1:1:max_neighbour_radius
            jj1=m - neighbour_radius;
            jj2=c;
            if (jj1>=1) % to stay in the matrix
                e_factor = exp(-((m-jj1).^2+(c-jj2).^2)/2*sigma^2);
                R(jj1,jj2)=R(jj1,jj2) + alpha * e_factor * (I(1,n)-R(jj1,jj2));
                G(jj1,jj2)=G(jj1,jj2) + alpha * e_factor * (I(2,n)-G(jj1,jj2));
                B(jj1,jj2)=B(jj1,jj2) + alpha * e_factor * (I(3,n)-B(jj1,jj2));
            end
            jj1=m + neighbour_radius;
            jj2=c;
            if (jj1<=89) % to stay in the matrix
                e_factor = exp(-((m-jj1).^2+(c-jj2).^2)/2*sigma^2);
                  R(jj1,jj2)=R(jj1,jj2) + alpha * e_factor * (I(1,n)-R(jj1,jj2));
                G(jj1,jj2)=G(jj1,jj2) + alpha * e_factor * (I(2,n)-G(jj1,jj2));
                B(jj1,jj2)=B(jj1,jj2) + alpha * e_factor * (I(3,n)-B(jj1,jj2));
            end
            jj1=m;
            jj2=c - neighbour_radius;
            if (jj2>=1) % to stay in the matrix
               e_factor = exp(-((m-jj1).^2+(c-jj2).^2)/2*sigma^2);
                 R(jj1,jj2)=R(jj1,jj2) + alpha * e_factor * (I(1,n)-R(jj1,jj2));
                G(jj1,jj2)=G(jj1,jj2) + alpha * e_factor * (I(2,n)-G(jj1,jj2));
                B(jj1,jj2)=B(jj1,jj2) + alpha * e_factor * (I(3,n)-B(jj1,jj2));
            end
            jj1=m;
            jj2=c + neighbour_radius;
            if (jj2<=100) % to stay in the matrix
                e_factor = exp(-((m-jj1).^2+(c-jj2).^2)/2*sigma^2);
                 R(jj1,jj2)=R(jj1,jj2) + alpha * e_factor * (I(1,n)-R(jj1,jj2));
                G(jj1,jj2)=G(jj1,jj2) + alpha * e_factor * (I(2,n)-G(jj1,jj2));
                B(jj1,jj2)=B(jj1,jj2) + alpha * e_factor * (I(3,n)-B(jj1,jj2));
            end
       end 
       

    end
   
       

end

disp('this is red');
disp(R);
disp('this is G');
disp(G);
disp('this is B');
disp(B);

 RED=round(R);
 
GREEN=round(G);
BLUE=round(B);
disp('this is red');
disp(RED);
disp('this is G');

disp(GREEN);
disp('this is B');
disp(BLUE);

