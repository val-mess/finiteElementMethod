function DisplayOmega()

h=1/4;
B_0=1;

n=1/h-1;
X=linspace(0,1,n+2);

epsilon=[0.01, 1];
gamma=B_0./epsilon*h;

figure()

for i=1:5 
Y=zeros(1,n+2);
Y(i)=1;
hold on
subplot(2,1,1);
plot(X,Y);
end
legend('\phi_0','\phi_1','\phi_2','\phi_3','\phi_4')
xlabel('x')
ylabel('y')
title('affichage des fonctions chapeaux')

for j=1:2
for i=2:4 
Y=zeros(1,n+2);
if gamma(j)<6
Y(i)=gamma(j)*h/12/B_0;
else
Y(i)=h/2/B_0;
end
hold on
subplot(2,1,2);
plot(X,Y);
end
end
legend('\omega_1, \epsilon=0.01','\omega_2, \epsilon=0.01','\omega_3, \epsilon=0.01','\omega_1, \epsilon=1','\omega_2, \epsilon=1','\omega_3, \epsilon=1')
xlabel('x')
ylabel('y')
title('affichage des fonctions chapeaux stabilisées')

end