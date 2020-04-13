function [Youngs_Modulus,Modulus_of_Resilience,Yeild_Stress_Val,Ultimate_Stress] = Yield_Stress(Sts,Str,Yeild_Offset)
%disp(Sts)
%disp(Str)
for i=1:length(Str)
    Str(i)=Str(i)+Yeild_Offset;
end
n=length(Sts);
m=[];
m1=[];
x=1;
for i=1:n-1
    m(i)=(Sts(i+1)-Sts(i))/Str(i+1)-Str(i);
    if m(i)<0
        n=m(i);
        m1(((i+x)-i))=n;     
        x=x+1;
    end
end
%disp(m)


Youngs_Modulus=m(1);
Sts_New=[];
Str_New=[];
for i=1:length(m)-1
    Sts_New(i)= Sts(i);
    Str_New(i)= Str(i);
end
fprintf('Proportional Limit')
disp(Sts_New(length(m)-2))
disp(Str_New(length(m)-2))

Sts_After=[];
Str_After=[];
f=length(m);
for i=1:length(m1)-1
    Sts_After(i)=Sts(f+i);
    Str_After(i)=Sts(f+i);
end
Ultimate_Stress=max(Sts_After);
Yeild_Stress_Val=max(Sts_New);
Modulus_of_Resilience=trapz(Str_New,Sts_New);
end

