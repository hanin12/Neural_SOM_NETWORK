
function mhmk(num)
if lenght(num)~=1| ~isnumeric(num)
    disp('error: please enter one number')
else
    for i=1:10
        disp([num2str(num),'*',num2str(i),'=',num2str(num*i)])
    end
    
    
    
    