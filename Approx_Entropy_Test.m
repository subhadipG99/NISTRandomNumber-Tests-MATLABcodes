%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Developed By : Subhadip Ghosh%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%Aprox. Entropy Test%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%NATIONAL INSTITUTE OF STANDARDS AND TECHNOLOGY (NIST)%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%Follow me on GitHub%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all
VOLTAGELEVVALS; %Contains the Imported CELL Containing LSBs of Binary Equivalent of Voltage Values
S=str2double(VOLTAGELEVVALS); %Converts CELL data to DOUBLE Data
n=length(S);%Counts Length of String
m=6;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Appending M-1 Bits%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:m-1
    S(n+i)=S(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%M - BIT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
binary6bit=decimalToBinaryVector(0:(power(2,m)-1),m);
freq6=zeros(power(2,m),1);

buffer6=zeros(1,m);
stop=m-1;
l=1;
for i=1:1:n
    for j=i:1:stop+i
        buffer6(l)=S(j);
        l=l+1;
    end
    l=1;
    for k=1:1:power(2,m)
        if binary6bit(k,1:m)==buffer6;
           freq6(k)=freq6(k)+1;
        end
    end
end

%%%%%%%%%%%%COMPUTING CiM%%%%%%%%%%%%%%%%%%%%%%%%$$$$$$$$$$$$$$$$$$$
CiM6=zeros(power(2,m),1);

for i=1:1:power(2,m)
    CiM6(i)=freq6(i)/n;
end

%%%%%%%%%%%%COMPUTING PhiM%%%%%%%%%%%%%%%%%%%%%%%$$$$$$$$$$$$$$$$$$$
PhiM6=0;
for i=0:1:power(2,m)-1
    temp=CiM6(i);
    PhiM6=PhiM6 + temp*log2(temp);
end
m=m+1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%Appending M-1 Bits%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:m-1
    S(n+i)=S(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%M - BIT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
binary7bit=decimalToBinaryVector(0:(power(2,m)-1),m);
freq7=zeros(power(2,m),1);
buffer7=zeros(1,m);
stop=m-1;
l=1;
for i=1:1:n
    for j=i:1:stop+i
        buffer7(l)=S(j);
        l=l+1;
    end
    l=1;
    for k=1:1:power(2,m)
        if binary7bit(k,1:m)==buffer7;
           freq7(k)=freq7(k)+1;
        end
    end
end

%%%%%%%%%%%%COMPUTING CiM%%%%%%%%%%%%%%%%%%%%%%%%$$$$$$$$$$$$$$$$$$$
CiM7=zeros(power(2,m),1);

for i=1:1:power(2,m)
    CiM7(i)=freq7(i)/n;
end

%%%%%%%%%%%%COMPUTING PhiM%%%%%%%%%%%%%%%%%%%%%%%$$$$$$$$$$$$$$$$$$$
PhiM7=0;
for i=1:1:power(2,m)
    PhiM7=PhiM7 + CiM7(i)*log2(CiM7(i));
end


%%%%%%%%%%%%%%%Statistic%%%%%%%%%%%%%%%%%%%%%%%/////////////////////
Avar=PhiM6-PhiM7;
ChiSQ=2*n*(log(2)-Avar);

%%%%%%%%%%%%%%%%P-VAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$$$$$$$$$$$$$$$$$$

P_Val=gammainc(power(2,m-1),(ChiSQ/2));
if P_Val>0.01
    disp('RANDOM');
else
    disp('NON-RANDOM');
end
