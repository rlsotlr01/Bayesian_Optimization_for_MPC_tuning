function MatVal=self_CalMatVal(RowVal,ColVal, RowVec, ColVec, Matrix)
%%% MatVal=self_CalMatVal(RowVal,ColVal, RowVec, ColVec, Matrix)
%%% 以下面矩阵为例，本函数根据RowVal,ColVal值,线性插值计算MatVal的值
% RowVal=150; ColVal=20;
% RowVec=[100 200 300 400];
% Matrix=[  1 2 4 8
%                2 4 8 16
%                3 6 15 17];
% ColVec=[10 20 30]';

lenRow=length(RowVec);  %列数
lenCol=length(ColVec);      %行数
[M,N]=size(Matrix);
if (M~=lenCol)||(N~=lenRow)
    error('self_CalMatVal Error: The dimensions of matrix do not match')    
end
ColMin=ColVec(1);      ColMax=ColVec(lenCol);
RowMin=RowVec(1);      RowMax=RowVec(lenRow);

%%% The first row of Matrix
if ColVal<=ColMin
    MatRec=Matrix(1,:);
   if RowVal<=RowVec(1)
       MatVal=MatRec(1);
   end
   if RowVal>=RowVec(lenRow)
       MatVal=MatRec(lenRow);
   end
   if (RowVal>RowVec(1))&&(RowVal<RowVec(lenRow))
        for k=1:(lenRow-1)
            if (RowVal>RowVec(k))&&(RowVal<=RowVec(k+1))%%寻找所在列的位置
                PosRow=k;
                break;
            end
        end
        %%% 线性插值
        MatVal=(MatRec(k+1)-MatRec(k))*(RowVal-RowVec(k))/(RowVec(k+1)-RowVec(k))+MatRec(k);
   end
end
%%% The last row of Matrix
if ColVal>=ColMax
    MatRec=Matrix(lenCol,:);
   if RowVal<=RowVec(1)
       MatVal=MatRec(1);
   end
   if RowVal>=RowVec(lenRow)
       MatVal=MatRec(lenRow);
   end
   if (RowVal>RowVec(1))&&(RowVal<RowVec(lenRow))
        for k=1:(lenRow-1)
            if (RowVal>RowVec(k))&&(RowVal<=RowVec(k+1))%%寻找所在列的位置
                PosRow=k;
                break;
            end
        end
        %%% 线性插值
        MatVal=(MatRec(k+1)-MatRec(k))*(RowVal-RowVec(k))/(RowVec(k+1)-RowVec(k))+MatRec(k);
   end
end
%%% The middle rows of Matrix
if (ColVal>ColMin)&&(ColVal<ColMax)
    %%寻找ColVal所在行的位置
    for k=1:(lenCol-1)
        if (ColVal>ColVec(k))&&(ColVal<=ColVec(k+1))%%寻找所在列的位置
            PosRow=k;
            break;
        end
    end
   MatRec=(Matrix(k+1,:)-Matrix(k,:))*(ColVal-ColVec(k))/(ColVec(k+1)-ColVec(k))+Matrix(k,:);
   if RowVal<=RowVec(1)
       MatVal=MatRec(1);
   end
   if RowVal>=RowVec(lenRow)
       MatVal=MatRec(lenRow);
   end
   if (RowVal>RowVec(1))&&(RowVal<RowVec(lenRow))
        for k=1:(lenRow-1)
            if (RowVal>RowVec(k))&&(RowVal<=RowVec(k+1))%%寻找所在列的位置
                PosRow=k;
                break;
            end
        end
        %%% 线性插值
        MatVal=(MatRec(k+1)-MatRec(k))*(RowVal-RowVec(k))/(RowVec(k+1)-RowVec(k))+MatRec(k);
   end
end