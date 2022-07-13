clc
clear 


%vectors of matrix 1
a=1;
b=16;
for i= a:1
   
    for j=a:b
         x=input('number:');
       
        A(j,i)=x;
        B(i,j)=x;
       
       
    end
   
end
s=0;
for r= 1:4
   if r>1
       s=s+4;
   end
    for r1=1:4
       if r1>1
           M(r,r1)=B(a,s+r1);
       else
            M(r,r1)=B(a,r1);
       end
       
       
    end
   
end
disp('This is vector l')
 disp(M)
 disp('This is transpose of vector ')
disp(A)
disp(B)

   %{
V = reshape(B,4,4)
 disp('vector')
    disp(V)
%}

C=A*B;
 disp('This is transpose of vector and main vector ')
disp(C)
%vectors of matrix 2
for i= a:1
   
    for j=a:b
         x=input('number:');
        A1(j,i)=x;
        B1(i,j)=x;
       
         
        
    end
end
s1=0;
for r= 1:4
   if r>1
       s1=s1+4;
   end
    for r1=1:4
       if r1>1
           M1(r,r1)=B1(a,s1+r1);
       else
            M1(r,r1)=B1(a,r1);
       end
       
       
    end
   
end
disp('This is vector E')
 disp(M1)
 disp('This is vector E and tarnspose')
 disp(A1)
 disp(B1)
C1=A1*B1;
disp(C1)

%vectors of matrix 3
for i= a:1
   
    for j=a:b
         x=input('number:');
        A2(j,i)=x;
        B2(i,j)=x;
       
         
        
    end
end
s2=0;
for rt= 1:4
   if rt>1
       s2=s2+4;
   end
    for r2=1:4
       if r2>1
           M2(rt,r2)=B2(a,s2+r2);
       else
            M2(rt,r2)=B2(a,r2);
       end
       
       
    end
   
end
disp('This is vector T')
 disp(M2)
 disp('This is vector T and tarnspose')
 disp(A2)
 disp(B2)
C2=A2*B2;
disp(C2)
%Calculation of weights
D=C+C1+C2;
disp(D)
I = eye(16,16)
F=D.*I;
disp(F)
W=D-F;
 disp(' weights ')
disp(W)

%we want need if matric stable or not
%matric1
S=W*A;
disp(S)
%matric2
S1=W*A1;
disp(S1)
%matric3
S2=W*A2;
disp(S2)
disp('we want to know if vectores stable or not')
%activation function
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
    disp('stable vector 1')
else
    disp('not stable vector 1')
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
    disp('stable vector 2')
else
    disp('not stable vector 2')
end
    
for i= a:1
   
    for j=a:b
        
       
       if (S2(j,i)>=0)
           S2(j,i)=1;
       
       elseif (S2(j,i)<0)
            S2(j,i)=-1;
           end
        
    end
end

disp(S2)
if (S2==A2)
    disp('stable vector 3')
else
    disp('not stable vector 3')
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
sr=0;
for rs= 1:4
   if rs>1
       sr=sr+4;
   end
    for rr=1:4
       if rr>1
           Mr(rs,rr)=T(sr+rr,a);
       else
            Mr(rs,rr)=T(rr,a);
       end
       
       
    end
   
end
disp('This is vector after test')
 disp(Mr)


