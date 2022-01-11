function RowVal=self_CalRow(ColVal,MatVal, RowVec, ColVec, Matrix)
%%% RowVal=self_CalRow(ColVal,MatVal, RowVec, ColVec, Matrix)
%%% 以下面矩阵为例，本函数根据RowVal,MatVal值,计算RowVec的值
% RowVec=[100 200 300 400];
% Matrix=[  1 2 4 8
%           2 4 8 16
%           3 6 15 17];
% ColVec=[10 20 30]';

lenRow=length(RowVec);%列数
lenCol=length(ColVec);%行数
[M,N]=size(Matrix);
if (M~=lenCol)||(N~=lenRow)
    error('The dimensions of matrix do not match')    
end
ColMin=ColVec(1);      ColMax=ColVec(lenCol);
%%% The first row
if ColVal<=ColMin
   MatRow=Matrix(1,:);
   if MatVal<=MatRow(1)
       RowVal=RowVec(1);
   end
   if MatVal>=MatRow(lenRow)
       RowVal=RowVec(lenRow);
   end
   if (MatVal>MatRow(1))&&(MatVal<MatRow(lenRow))
        for k=1:(lenRow-1)
            if (MatVal>MatRow(k))&&(MatVal<=MatRow(k+1))%%寻找所在列的位置
                PosRow=k;
                break;
            end
        end
        %%% 线性插值
        RowVal=(RowVec(k+1)-RowVec(k))*(MatVal-MatRow(k))/(MatRow(k+1)-MatRow(k))+RowVec(k);
   end
end
%%% The last row
if ColVal>=ColMax
   MatRow=Matrix(lenCol,:);
   if MatVal<=MatRow(1)
       RowVal=RowVec(1);
   end
   if MatVal>=MatRow(lenRow)
       RowVal=RowVec(lenRow);
   end
   if (MatVal>MatRow(1))&&(MatVal<MatRow(lenRow))
        for k=1:(lenRow-1)
            if (MatVal>MatRow(k))&&(MatVal<=MatRow(k+1))%%寻找所在列的位置
                PosRow=k;
                break;
            end
        end
        %%% 线性插值
        RowVal=(RowVec(k+1)-RowVec(k))*(MatVal-MatRow(k))/(MatRow(k+1)-MatRow(k))+RowVec(k);
   end 
end
%%% 
if (ColVal>ColMin)&&(ColVal<ColMax)
   %%寻找ColVal所在行的位置
    for k=1:(lenCol-1)
        if (ColVal>ColVec(k))&&(ColVal<=ColVec(k+1))%%寻找所在列的位置
            PosRow=k;
            break;
        end
    end
   MatRow=(Matrix(k+1,:)-Matrix(k,:))*(ColVal-ColVec(k))/(ColVec(k+1)-ColVec(k))+Matrix(k,:);
   %% 计算行值
   if MatVal<=MatRow(1)
       RowVal=RowVec(1);
   end
   if MatVal>=MatRow(lenRow)
       RowVal=RowVec(lenRow);
   end
   if (MatVal>MatRow(1))&&(MatVal<MatRow(lenRow))
        for k=1:(lenRow-1)
            if (MatVal>MatRow(k))&&(MatVal<=MatRow(k+1))%%寻找所在列的位置
                PosRow=k;
                break;
            end
        end
        %%% 线性插值
        RowVal=(RowVec(k+1)-RowVec(k))*(MatVal-MatRow(k))/(MatRow(k+1)-MatRow(k))+RowVec(k);
   end
end