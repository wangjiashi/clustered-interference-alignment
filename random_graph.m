d = [13,13,13,13,11,12,12,5,7,12,7,11,7,8,12,5,3,5,7,5,3,5,3,3,7,11,11];
n = length(d);
V = [];
tab1 = [];
tab2 = [];
s=0;
count = 0;
alen = 1;
blen = 1;
vlen = 1;
for i = 1:n
    s = s + d(i);
end
if mod(s,2)~=0
    disp('No');
    return ;
end
while 1 
    for i = 1:n
        if(d(i)<0)
            disp('No');
            break;
        end
    end
    %如果所有的度都为0，则输出G
    for i = 1:n
        if(d(i) ==0)
            count = count+1;
        end
        if (count == n)           
           G = graph(tab1,tab2);
            plot(G);
            return;
        end
    end
    Arr = randperm(n);
    for i = 1:n
    v = Arr(i);
    if d(v)>0      %随机选取一个度大于0的顶点v
        a = d(v);         %a个与v相连的节点
        d(v) = 0;
        [B,I] = sort(d);      %并返回最大的a个数,将d从小到大排序，B是排序后的序列，I是排序后的索引
        for j = n-a+1:n           %将这a个结点存在V中       
            V(vlen) = I(j);
            vlen = vlen+1;           
        end
        for k = 1:a
            tab2(blen) = V(blen);
            w = tab2(blen);
            d(w) = d(w)-1;                     
            tab1(alen) = v;
            alen = alen+1;
             blen = blen+1;
        end      
    end
         i = i+1;
    end
end
