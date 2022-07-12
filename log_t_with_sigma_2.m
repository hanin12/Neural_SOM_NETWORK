clc;
clear;
T=2;
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
%%
% * * *BOLD TEXT* * *
    

     I=[1 0 0 0 0 1 0 1 0; 0 1 0 1 0 0 0 0 1;0 0 1 0 1 0 1 0 0 ];
figure(1);
title('before clustering');
hold on;

plot(0.005,1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[ I(1,1) I(2,1) I(3,1)]);

plot(0.006,1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[I(1,2) I(2,2) I(3,2)]);

plot(0.007,1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[I(1,3) I(2,3) I(3,3)]);

plot(0.005,1.05,'-s','MarkerSize',100,...
    'MarkerFaceColor',[I(1,4) I(2,4) I(3,4)]);

plot(0.006,1.05,'-s','MarkerSize',100,...
    'MarkerFaceColor',[I(1,5) I(2,5) I(3,5)]);

plot(0.007,1.05,'-s','MarkerSize',100,...
    'MarkerFaceColor',[I(1,6) I(2,6) I(3,6)]);

plot(0.005,1.1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[I(1,7) I(2,7) I(3,7)]);

plot(0.006,1.1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[I(1,8) I(2,8) I(3,8)]);

plot(0.007,1.1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[I(1,9) I(2,9) I(3,9)]);
 
hold off;

    

    R=[0.1 0.5 0.9;0.5 0.2 0.7;0.2 0.9 0.5];
    G=[0.4 0.8 0.8; 0.3 0.7 0.6;0.5 0.3 0.3];
    B=[0.7 0.4 0.2; 0.8 0.5 0.1;0.9 0.3 0.4];
    
    
    
for t=1:T
    alpha=alpha_initial*exp((1-t)/T);
    sigma=sigma_initial*exp((1-t)/(log(T)));
    max_neighbour_radius=round(neighbour_radius_initial*exp((1-t)/(log(T))));
   
    for n=1:9
        for i=1:3
            for j=1:3
                D(i,j)=sqrt((I(1,n)-R(i,j))^2+(I(2,n)-R(i,j))^2+(I(3,n)-R(i,j))^2);
                
            end
        end
        disp('this is differences matrix');
        disp(D);
        min=D(1,1);
        for i=1:3
            for j=1:3
                if(j+1==4)
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
       % e_factor = exp(-((m-m).^2+(c-c).^2)/2*sigma);
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
            if (jj1<=3) % to stay in the matrix
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
            if (jj2<=3) % to stay in the matrix
                e_factor = exp(-((m-jj1).^2+(c-jj2).^2)/2*sigma^2);
                 R(jj1,jj2)=R(jj1,jj2) + alpha * e_factor * (I(1,n)-R(jj1,jj2));
                G(jj1,jj2)=G(jj1,jj2) + alpha * e_factor * (I(2,n)-G(jj1,jj2));
                B(jj1,jj2)=B(jj1,jj2) + alpha * e_factor * (I(3,n)-B(jj1,jj2));
            end
       end 
       

    end
   
end
disp(D);
  disp(I);

disp('this is red');
disp(R);
disp('this is G');
disp(G);
disp('this is B');
disp(B);
 RED=round(R);
GREEN=round(G);
BLUE=round(B);
disp(RED);
disp(GREEN);
disp(BLUE);
        figure(2);
title('after clusering');
hold on;

plot(0.005,1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[ RED(1,1) GREEN(1,1) BLUE(1,1)]);

plot(0.006,1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[RED(1,2) GREEN(1,2) BLUE(1,2)]);

plot(0.007,1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[RED(1,3) GREEN(1,3) BLUE(1,3)]);

plot(0.005,1.05,'-s','MarkerSize',100,...
    'MarkerFaceColor',[RED(2,1) GREEN(2,1) BLUE(2,1)]);

plot(0.006,1.05,'-s','MarkerSize',100,...
    'MarkerFaceColor',[RED(2,2) GREEN(2,2) BLUE(2,2)]);

plot(0.007,1.05,'-s','MarkerSize',100,...
    'MarkerFaceColor',[RED(2,3) GREEN(2,3) BLUE(2,3)]);

plot(0.005,1.1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[RED(3,1) GREEN(3,1) BLUE(3,1)]);

plot(0.006,1.1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[RED(3,2) GREEN(3,2) BLUE(3,2)]);

plot(0.007,1.1,'-s','MarkerSize',100,...
    'MarkerFaceColor',[RED(3,3) GREEN(3,3) BLUE(3,3)]);
 
hold off;

