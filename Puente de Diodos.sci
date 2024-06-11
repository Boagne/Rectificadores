clc 
clear
clf(0)
clf(1)

vi = 12
vd = 1.4
raiz = sqrt(2)
R1 = 1e3
C1 = 470e-6
f = 120
Vmax = vi*raiz - vd
Vrizo = 2*Vmax/(2*f*C1*R1+1)

T = 1/f
w = 2*%pi*f
t = 0: T/1e3: 2*T
Vin = Vmax*sin(w*t)

VinVectorSize = size(Vin)
for i = 1:VinVectorSize(2)
    if abs(Vin(1,i))>vd then
        Vr(1,i) = abs(Vin(1,i))-vd
    else
        Vr(1,i) = 0
    end
end

plot(t*1e3, Vr,'b',t*1e3,Vin,'r','LineWidth',3)
xgrid(1,1,3)
xtitle("Rectificador Onda Completa con Puente de Diodos")
xlabel('tiempo [ms]')
ylabel('Tensión [V]')
