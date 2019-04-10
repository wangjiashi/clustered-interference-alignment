%^2017年7月9日%平面随机点阵生成%wjs编

%定义平面大小以及随机点个数，因为考虑仿真成对性%
% M=10;%平面网格 200*200;
M=10;
d=1
V=30;%点数;用户数
% d=1  ;%距离
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%点定义
% X0=(M/2)*rands(1);
% Y0=(M/2)*rands(1);
% X1=(M/2)*rands(1);       %发射机
% Y1=(M/2)*rands(1);
%Theta=180*rands(1);
% jj=1
% while jj<=V
% X1=(M/2)*rands(1);       %发射机
% Y1=(M/2)*rands(1);
% Theta=180*rands(1);
% X2=X1+d.*cos(Theta);        %接受机
% Y2=Y1+d.*sin(Theta);
% if isempty(setA)
% setA{jj}=[X1,Y1;X2,Y2];
% jj=jj+1;
% setB{1}=[X1,Y1;X2,Y2];
% % while isempty(setA(kk))
% %     
% % end
% end
% while isempty(setA{4})
%      
% end
jj=1;
ii=1;
while jj<=V
setB=Generating_function(M,d); %生成函数
if jj==1
    setA{jj}=setB;
    jj=jj+1;
else jj>1
  while  ii<jj
       Result=Judgement_function(setA{ii},setB);                    %判断函数 1代表相交 0代表不相交
       if Result==1
           break
       else 
       ii=ii+1; 
       if ii==jj
       setA{jj}=setB
       jj=jj+1;
       break
       end
       end 
  end 
 ii=1;
end
end
%%%%%数据测试
%%%%%%%%%%%%%%%%
% A=[2.90644897912478,-2.95507418641044;3.46773020060687,-1.03544833994671]
% B=[2.47661582378364,-0.795995687671869;3.51812068726177,-2.50341116708846]
% Resu4lt=Judgement_function(A,B);   
% 
% X1=(M/2)*rands(1,V);       %发射机
% Y1=(M/2)*rands(1,V);
% Theta=180*rands(1,V);
% X2=X1+d.*cos(Theta);        %接受机
% Y2=Y1+d.*sin(Theta);


% X2=X1+d.*cos(Theta);        %接受机
% Y2=Y1+d.*sin(Theta);
for ii=1:1:V
   X1(ii)=setA{ii}(1,1);
   X2(ii)=setA{ii}(2,1);
   Y1(ii)=setA{ii}(1,2);
   Y2(ii)=setA{ii}(2,2);
end

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%作图处
plot(X1,Y1,'o','Color',[1,0,0],'MarkerSize',1)
hold on
plot(X2,Y2,'*','Color',[0,0,1],'MarkerSize',1)
hold on
for i=1:1:V
   text(X1(i),Y1(i),num2str(i),'fontsize',4);
end
for i=1:V
    plot([X1(i);X2(i)],[Y1(i);Y2(i)],'-','Color',[0,0,0]) %描线
    hold on
end
axis([-M/2-0.2*M,M/2+0.2*M,-M/2-0.2*M,M/2+0.2*M])
%axis([0,max([X1:X2]),0,[Y1:Y2]])
xlabel('X coordinate')
ylabel('Y coordinate')
grid on
save ('basedatadistance.mat','X1','X2','Y1','Y2')
set(gca,'FontSize',9,'LineWidth',1)
legend('Rx','Tx')

