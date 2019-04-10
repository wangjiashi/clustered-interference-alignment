function Result=Judgement_function(A,B) %M为平面大小，%d为线段长度距离
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X1=A(1,1);
X2=A(2,1);
Y1=A(1,2);
Y2=A(2,2);
X3=B(1,1);
X4=B(2,1);
Y3=B(1,2);
Y4=B(2,2);
L1=((X1-X4)^2+(Y1-Y4)^2)^(1/2);
L2=((X3-X2)^2+(Y3-Y2)^2)^(1/2);
L3=((X1-X3)^2+(Y1-Y3)^2)^(1/2)
L4=((X2-X4)^2+(Y2-Y4)^2)^(1/2)
dd=1000/1000 %收发之间最短距离
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
 RX1=min(A(1,1),A(2,1));
 RX2=max(A(1,1),A(2,1));
 RY1=min(A(1,2),A(2,2));
 RY2=max(A(1,2),A(2,2));
 TX1=min(B(1,1),B(2,1));
 TX2=max(B(1,1),B(2,1));
 TY1=min(B(1,2),B(2,2));
 TY2=max(B(1,2),B(2,2));
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
FX1=max(RX1,TX1);
FX2=min(RX2,TX2);
FY1=max(RY1,TY1);
FY2=min(RY2,TY2);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %以上为定义快速排斥试验的数据
 %%%%%%%%%%%%%%%%%%%%%%%%%%
 P1Q1=[A(1,1)-B(1,1),A(1,2)-B(1,2)];
 P2Q1=[A(2,1)-B(1,1),A(2,2)-B(1,2)];
 Q2Q1=[B(2,1)-B(1,1),B(2,2)-B(1,2)];
 Q2P2=[B(2,1)-A(2,1),B(2,2)-A(2,1)];       %%可能误
 Q1P2=[B(1,2)-A(2,1),B(1,2)-A(2,2)];
 P1P2=[A(1,1)-A(2,1),A(1,2)-A(2,1)];
 %%%%%%%%%%%%%%%%%%%%%%%%%%
 %以上为定义跨立试验的数据
 if FX1>=FX2||FY1>=FY2
   if L1>dd && L2>dd&& L3>dd&& L4>dd
     Result=0;
   else
     Result=1;
   end
 else 
  Result=1;
%      if L1<dd && L2<dd
%      Result=1;
%      else
%      Result=0;
%      end  
%      if (P1Q1(1,1)*Q2Q1(1,2)-Q2Q1(1,1)*P(1,2))*(Q2Q1(1,1)*P2Q1(1,2)-P2Q1(1,1)*Q2Q1(1,2))>=0
%          if (Q1P2(1,1)*Q2P2(1,2)-Q2P2(1,1)*Q1P2(1,2))*(Q2P2(1,1)*P1P2(1,2)-P1P2(1,1)*Q2P2(1,2))>=0
%              Result=1;
%          end
%      else
%           Result=0;
%      end %定义跨立试验
 end
end