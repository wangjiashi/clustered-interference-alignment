function subset=Generating_function(M,d) %M为平面大小，%d为线段长度距离
X1=(M/2)*rands(1);       %发射机
Y1=(M/2)*rands(1);
Theta=180*rands(1);
X2=X1+d.*cos(Theta);        %接受机
Y2=Y1+d.*sin(Theta);
subset=[X1,Y1;X2,Y2];
end