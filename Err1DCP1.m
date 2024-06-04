function Err1DCP1()

import RHS1DP1.m.* 
import Matr1DP1.m.*
import uexa.m.*

h=[1/16,1/32,1/64,1/128];
n=1./h-1;

B_0=1;
f_0=1;
epsilon=0.005;

%tracé de u_h en fonction de n
for i=1:4
xi = inv(Matr1DP1(n(i),epsilon,B_0))*RHS1DP1(n(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
hold on
plot(linspace(1,n(i)+2,n(i)+2),xi_complet);
end
title("tracé de la solution en fonction du nombre de subdivisions (n)")
xlabel('y')
ylabel('n')
legend('h=1/16','h=1/32','h=1/64','h=1/128')

%calcul de l'erreur
err = zeros(1,4);

for i=1:4
xi = inv(Matr1DP1(n(i),epsilon,B_0))*RHS1DP1(n(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
X = linspace(0,1,n(i)+2);
err(i) = max(xi_complet-(transpose(uexa(X,f_0,B_0,epsilon))));
end

%tracé des ln pour obtenir le k de O(h^k)
figure()
ln_h=log(h);
ln_err=log(err);
plot(ln_h,ln_err);
title('Estimation de k dans ||Err(h)||_\infty=O(h^k)')
xlabel('ln(h)')
ylabel('ln(||Err(h)||_\infty)')

disp('Estimation du k dans la figure :')
k= (ln_err(4)-ln_err(1))/(ln_h(4)-ln_h(1))


%on fait varier epsilon et on cherche le nombre n qui fait varier les oscillations

epsilon= [0.1,0.05,0.01,0.005];
figure()
for i=1:4
e = epsilon(i);
subplot(2,2,i);
n=linspace(10,120,12);
for ni=n
xi = inv(Matr1DP1(ni,e,B_0))*RHS1DP1(ni,f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
hold on
plot(linspace(1,ni+2,ni+2),xi_complet)
end
formatSpec = "tracé de la solution approchée en fonction \n du nombre de subdivisions (n) pour epsilon= %f";
A1 = e;
str = sprintf(formatSpec,A1);
title(str)
xlabel('n')
ylabel('y')
if i == 1  %tracé de la légende juste sur la première fenêtre
legend_names = cell(12,1);
for i = 1:12
    n = i*10;
    legend_names{i} = ['n=' num2str(n)];
end
legend(legend_names)
end
end

%on lit ainsi n_limit graphiquement...

%on réprésente pour n limite la solution approchée et la solution exacte
n_limite = [20,30,50,100];

figure()
for i=1:4
e = epsilon(i);
X = linspace(0,1,n_limite(i)+2);
xi = inv(Matr1DP1(n_limite(i),e,B_0))*RHS1DP1(n_limite(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
subplot(2,2,i)
plot(X,xi_complet,linspace(0,1,1000),uexa(linspace(0,1,1000),f_0,B_0,e));
formatSpec = "tracé de la solution exacte et approchée pour epsilon=%f, \n correspondant au n_{limite} (=%f)";
A1 = e;
A2 = n_limite(i);
str = sprintf(formatSpec,A1,A2);
title(str)
xlabel('x')
ylabel('y')

if i == 1  %tracé de la légende juste sur la première fenêtre
legend('tracé approché', 'SolEx, calculée en 1000 points ')
end

end









