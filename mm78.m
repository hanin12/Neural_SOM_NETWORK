clc
clear 


%vectors of matrix
a=1
b=4
for i= a:1
   
    for j=a:b
         x=input('number:');
        A(j,i)=x;
        B(i,j)=x;
       
         
        
    end
end
disp(A)
disp(B)
C=A*B
disp(C)
for i= a:1
   
    for j=a:b
         x=input('number:');
        A1(j,i)=x;
        B1(i,j)=x;
       
         
        
    end
end

C1=A1*B1
disp(C1)
D=C+C1
disp(D)
I = eye(4,4)
F=D.*I
disp(F)
W=D-F
disp(W)

%we want need if matric stable or not
S=W*A
disp(S)
S1=W*A1
disp(S1)%activation function
for i= a:1
   
    for j=a:b
        
       
       if (S(j,i)>=0)
           S(j,i)=1;
       
       else
            S(j,i)=-1;
           end
        
    end
    
end

disp(S)
if (S==A)
    disp('stable')
else
    disp('not stable')
end
    
    
for i= a:1
   
    for j=a:b
        
       
       if (S1(j,i)>=0)
           S1(j,i)=1;
       
       elseif (S1(j,i)<0)
            S1(j,i)=-1;
           end
        
    end
end

disp(S1)
if (S1==A1)
    disp('stable')
else
    disp('not stable')
end
    
%testing stage




for i= a:1
   
    for j=a:b
         x=input('number:');
        TS(j,i)=x;
       
         
        
    end
end
disp(TS)
T=W*TS
%ACTIVATION FUNCTION
for i= a:1
   
    for j=a:b
        
       
       if (T(j,i)>=0)
           T(j,i)=1;
       
       elseif (T(j,i)<0)
            T(j,i)=-1;
           end
        
    end
end

disp(T)