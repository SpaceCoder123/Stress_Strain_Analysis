function [] = Stress_Strain_Analysis(Load,Elongation,Diameter,Length,Yeild_Offset,Degree)
n=length(Load);
Sts=[];
Str=[];
for i=1:n
    Sts(i)=Stress(Load(i),Diameter);
    Str(i)=Strain(Elongation(i),Length);
end
[X1,X2,X3,X4]=Yield_Stress(Sts,Str,Yeild_Offset);




%Final Results
fprintf('Modulus of Toughness for given data sets of Load and Displacement is: ')
disp(Modulus_Of_Toughness(Str,Sts))
fprintf('Rupture Strength: ')
disp(Sts(end));
fprintf('Ultimate Strength: ')
disp(X4);
fprintf('The Yeild Stress of the given material is')
disp(X3);
fprintf('The Modulus of Resilience')
disp(X2)
fprintf('The Youngs Modulus of the given material is')
disp(X1)



plot(Str,Sts)
hold on
%plotting
r=polyfit(Str,Sts,Degree);
loglog(Str,polyval(r,Str),'*-')
xlabel('Strain (mm/mm)')
ylabel('Stress (MPa)')
legend('Stress Strain Points','Stress Strain 5th Degree Plot')
grid 
end

