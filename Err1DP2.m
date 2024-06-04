function Err1DP2()

import RHS1DP2.m.* 
import Matr1DP2.m.*
import uexa.m.*

h=[1/16,1/32,1/64,1/128];
n=1./h-1;

B_0=1;
f_0=1;
epsilon=1;

%tracé de u_h en fonction de n
for i=1:4
xi = inv(Matr1DP2(n(i),epsilon,B_0))*RHS1DP2(n(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
hold on
plot(linspace(1,2*n(i)+3,2*n(i)+3),xi_complet)
end
title("tracé de la solution en fonction du nombre de subdivisions (n)")
xlabel('y')
ylabel('n')
legend('h=1/16','h=1/32','h=1/64','h=1/128')

%calcul de l'erreur
err = zeros(1,4);

for i=1:4
xi = inv(Matr1DP2(n(i),epsilon,B_0))*RHS1DP2(n(i),f_0);
xi_complet = [0;xi;0]; %compléter avec les conditions aux limites
X = linspace(0,1,2*n(i)+3);
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

end

