%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Developed By : Subhadip Ghosh%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%Cumulative Sums Test%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%NATIONAL INSTITUTE OF STANDARDS AND TECHNOLOGY (NIST)%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%Follow me on GitHub%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all
VOLTAGELEVVALS; %Contains the Imported CELL Containing LSBs of Binary Equivalent of Voltage Values
S=str2double(VOLTAGELEVVALS); %Converts CELL data to DOUBLE Data
n=length(S);%Counts Length of String

%////////////////////CREATING NORMALIZED SEQUENCE////////////////////////
S=2*S-1;

%//////////////////////SUCCESIVE FORWARD SUM/////////////////////////////
For=zeros(n,1);

for i=1:1:n
    for j=1:1:i
        For(i)=For(i)+S(j);
    end
end

%//////////////////////SUCCESIVE BACKWARD SUM/////////////////////////////
Back=zeros(n,1);
k=1;
for i=n:-1:1
    for j=n:-1:i
        Back(k)=Back(k)+S(j);
    end
    k=k+1;
end


%/////////////////////MAX FORWARD & BACKWARD VALUE//////////////////////////////////
Fortemp=abs(For);
Backtemp=abs(Back);
Formax=max(Fortemp);
Backmax=max(Backtemp);


%%%%%%%%%%%%%%%%%%%%%P_VAL FOR FORWARD///////////////////$$$$$$$$$$$$$$$$$$

zf=Formax;
l1=floor(((-n/zf)+1)/4);
l2=floor(((-n/zf)-3)/4);
u1=floor(((n/zf)-1)/4);
u2=floor(((n/zf)-1)/4);

func=@(u)exp(-power(u,2)/2)*(1/sqrt(2*pi));

sum1=0;
sum2=0;
sum3=0;
sum4=0;

for k=l1:1:u1
    
    var1=((4*k+1)*zf/sqrt(n));
    sum1=sum1 + integral(func,-Inf,var1);
    var2=((4*k-1)*zf/sqrt(n));
    sum2=sum2 + integral(func,-Inf,var2);
 
end

for k=l2:1:u2
    
    var3=((4*k+3)*zf/sqrt(n));
    sum3=sum3 + integral(func,-Inf,var3);
    var4=((4*k+1)*zf/sqrt(n));
    sum4=sum4 + integral(func,-Inf,var4);
 
end


Pvalfor=1-(sum1-sum2)+(sum3-sum4);


%%%%%%%%%%%%%%%%%%%%%P_VAL FOR BACKWARD///////////////////$$$$$$$$$$$$$$$$$$

zb=Backmax;
l1=floor(((-n/zb)+1)/4);
l2=floor(((-n/zb)-3)/4);
u1=floor(((n/zb)-1)/4);
u2=floor(((n/zb)-1)/4);

func=@(u)exp(-power(u,2)/2)*(1/sqrt(2*pi));

sum1=0;
sum2=0;
sum3=0;
sum4=0;

for k=l1:1:u1
    
    var1=((4*k+1)*zb/sqrt(n));
    sum1=sum1 + integral(func,-Inf,var1);
    var2=((4*k-1)*zb/sqrt(n));
    sum2=sum2 + integral(func,-Inf,var2);
 
end

for k=l2:1:u2
    
    var3=((4*k+3)*zb/sqrt(n));
    sum3=sum3 + integral(func,-Inf,var3);
    var4=((4*k+1)*zb/sqrt(n));
    sum4=sum4 + integral(func,-Inf,var4);
 
end


Pvalback=1-(sum1-sum2)+(sum3-sum4);

if Pvalfor>0.01 && Pvalback>0.01
    disp('RANDOM');
else
    disp('NON RANDOM');
end