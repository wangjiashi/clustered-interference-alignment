function subset=Generating_function(M,d) %MΪƽ���С��%dΪ�߶γ��Ⱦ���
X1=(M/2)*rands(1);       %�����
Y1=(M/2)*rands(1);
Theta=180*rands(1);
X2=X1+d.*cos(Theta);        %���ܻ�
Y2=Y1+d.*sin(Theta);
subset=[X1,Y1;X2,Y2];
end