function MatVal=self_CalMatVal(RowVal,ColVal, RowVec, ColVec, Matrix)
%%% MatVal=self_CalMatVal(RowVal,ColVal, RowVec, ColVec, Matrix)
%%% ���������Ϊ��������������RowVal,ColValֵ,���Բ�ֵ����MatVal��ֵ
% RowVal=150; ColVal=20;
% RowVec=[100 200 300 400];
% Matrix=[  1 2 4 8
%                2 4 8 16
%                3 6 15 17];
% ColVec=[10 20 30]';

lenRow=length(RowVec);  %����
lenCol=length(ColVec);      %����
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
            if (RowVal>RowVec(k))&&(RowVal<=RowVec(k+1))%%Ѱ�������е�λ��
                PosRow=k;
                break;
            end
        end
        %%% ���Բ�ֵ
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
            if (RowVal>RowVec(k))&&(RowVal<=RowVec(k+1))%%Ѱ�������е�λ��
                PosRow=k;
                break;
            end
        end
        %%% ���Բ�ֵ
        MatVal=(MatRec(k+1)-MatRec(k))*(RowVal-RowVec(k))/(RowVec(k+1)-RowVec(k))+MatRec(k);
   end
end
%%% The middle rows of Matrix
if (ColVal>ColMin)&&(ColVal<ColMax)
    %%Ѱ��ColVal�����е�λ��
    for k=1:(lenCol-1)
        if (ColVal>ColVec(k))&&(ColVal<=ColVec(k+1))%%Ѱ�������е�λ��
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
            if (RowVal>RowVec(k))&&(RowVal<=RowVec(k+1))%%Ѱ�������е�λ��
                PosRow=k;
                break;
            end
        end
        %%% ���Բ�ֵ
        MatVal=(MatRec(k+1)-MatRec(k))*(RowVal-RowVec(k))/(RowVec(k+1)-RowVec(k))+MatRec(k);
   end
end