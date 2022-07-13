clc;
clear;
T=3;
rd=2;
sigma_initial=0.05;
alpha_initial=0.9;
number_of_pixels=8900;%We'll work on full of the dataset.
number_of_neuorn_inputs=26700;
pixels=300;
neighbour_radius_initial=number_of_pixels/2;

nr=1;
ng=1;
nb=1;

A2=imread('balons11.jpeg');
imshow(A2);
    
A=importdata('balons11.txt');

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

    %sceond neuorn for green color
    for i2=1:89
    for j2=2:3:300
       
        X2(ng)=I(i2,j2);
        
        ng=ng+1;
    end
end

    %third neuorn for blue color
    for i3=1:89
    for j3=3:3:300
       
        X3(nb)=I(i3,j3);
        
        nb=nb+1;
    end
end


   
    

   
    sprev=rng(1,'v5uniform')
     R=randi([0 255],89,100);
            G=randi([0 255],89,100);
             B=randi([0 255],89,100);
    
    %100 epochs alpaha=0.9 sigma=0.05 neighbour_radius_initial=number_of_pixels/2;

    
for t=1:T
  alpha=alpha_initial*exp((1-t)/T);
    sigma=sigma_initial*exp((1-t)/(T));
    max_neighbour_radius=round(neighbour_radius_initial*exp((1-t)/(T)));
   
        for n=1:number_of_pixels
        for i=1:89
          
            for j=1:100
              
              
              
           D(i,j)=sqrt((X1(n)-R(i,j))^2+(X2(n)-G(i,j))^2+(X3(n)-B(i,j))^2);
              end
                 
            end
            
        
           
     
       
        
        min=D(1,1);
       for i=1:89
            for j=1:100
                
                      if ( (D(i,j)<min))
                          min=D(i,j);
                          m=i;
                          c=j;
                          
                      end
                
            end
        end
        
          % update the winning neuron
         
     %   e_factor = exp(-((m-m).^2+(c-c).^2)/2*sigma^2);
       R(m,c)=R(m,c)+alpha*(X1(n)-R(m,c));
       G(m,c)=G(m,c)+alpha*(X2(n)-G(m,c));
       B(m,c)=B(m,c)+alpha*(X3(n)-B(m,c));
       
        % update the neighbour neurons
       for neighbour_radius=1:1:max_neighbour_radius
            jj1=m - neighbour_radius;
            jj2=c;
            if (jj1>=1) % to stay in the matrix
                e_factor = exp(-((m-jj1).^2+(c-jj2).^2)/2*sigma^2);
                R(jj1,jj2)=R(jj1,jj2) + alpha * e_factor * (X1(n)-R(jj1,jj2));
                G(jj1,jj2)=G(jj1,jj2) + alpha * e_factor * (X2(n)-G(jj1,jj2));
                B(jj1,jj2)=B(jj1,jj2) + alpha * e_factor * (X3(n)-B(jj1,jj2));
            end
            jj1=m + neighbour_radius;
            jj2=c;
            if (jj1<=89) % to stay in the matrix
                e_factor = exp(-((m-jj1).^2+(c-jj2).^2)/2*sigma^2);
                  R(jj1,jj2)=R(jj1,jj2) + alpha * e_factor * (X1(n)-R(jj1,jj2));
                G(jj1,jj2)=G(jj1,jj2) + alpha * e_factor * (X2(n)-G(jj1,jj2));
                B(jj1,jj2)=B(jj1,jj2) + alpha * e_factor * (X3(n)-B(jj1,jj2));
            end
            jj1=m;
            jj2=c - neighbour_radius;
            if (jj2>=1) % to stay in the matrix
              e_factor = exp(-((m-jj1).^2+(c-jj2).^2)/2*sigma^2);
                 R(jj1,jj2)=R(jj1,jj2) + alpha * e_factor * (X1(n)-R(jj1,jj2));
                G(jj1,jj2)=G(jj1,jj2) + alpha * e_factor * (X2(n)-G(jj1,jj2));
                B(jj1,jj2)=B(jj1,jj2) + alpha * e_factor * (X3(n)-B(jj1,jj2));
            end
            jj1=m;
            jj2=c + neighbour_radius;
            if (jj2<=100) % to stay in the matrix
                e_factor = exp(-((m-jj1).^2+(c-jj2).^2)/2*sigma^2);
                 R(jj1,jj2)=R(jj1,jj2) + alpha * e_factor * (X1(n)-R(jj1,jj2));
                G(jj1,jj2)=G(jj1,jj2) + alpha * e_factor * (X2(n)-G(jj1,jj2));
                B(jj1,jj2)=B(jj1,jj2) + alpha * e_factor * (X3(n)-B(jj1,jj2));
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

%new image after clustring

title('after clusering');


     
        figure(2);
        C=cat(3,RED,GREEN,BLUE);

        %image(C)
%colormap(map)
%axis equal
        
      % im = imshow(A,'InitialMagnification','fit');

    
      %{
      for i=1:89
            for j=1:100
     % C=[RED(i,j) GREEN(i,j) BLUE(i,j)];
      % za=pcolor(C);
      
       rgb=A2(i,j,:);
      
      rgb(:,:,1)=RED(1,j);
       rgb(:,:,2)=GREEN(1,j);
        rgb(:,:,3)=BLUE(1,j);
       
            end
          
        end
      %}
       for i=1:89
            for j=1:100
                rgb=A2(i,j,:);
         A2(i,j:100,1) = RED(i,j);
A2(i,j:100,2) = GREEN(i,j);
A2(i,j:100,3) = BLUE(i,j);
            end
       end
       imshow(A2);
       
 %{       
for j=1:100
        
        rgb=A2(i,j,:);
      subplot(100,100,j);
      rgb(:,:,1)=RED(1,j);
       rgb(:,:,2)=GREEN(1,j);
        rgb(:,:,3)=BLUE(1,j);
       
pcolor(A2)
        end
        %}