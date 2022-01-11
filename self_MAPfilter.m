function dataMat=self_MAPfilter(data, lamda)
%%% Engine MAP filter
%%% By Shengbo LI

[lenRow, lenCol]= size(data);
if( lamda>=1) error('Lamda >= 1');end
if( lamda<=0) error('Lamda <= 1');end
dataMat=data;  
for m=2:(lenRow-1)
    for n=2:(lenCol-1)
       dataMat(m,n)=lamda*data(m,n)+(1-lamda)*(0.25*data(m-1,n)+0.25*data(m+1,n)+0.25*data(m,n-1)+0.25*data(m,n+1)); 
    end    
end
