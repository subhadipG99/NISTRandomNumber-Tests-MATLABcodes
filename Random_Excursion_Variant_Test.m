%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Developed By : Subhadip Ghosh%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Random Excursion Variant Test%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%NATIONAL INSTITUTE OF STANDARDS AND TECHNOLOGY (NIST)%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%Follow me on GitHub%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all
VOLTAGELEVVALS; %Contains the Imported CELL Containing LSBs of Binary Equivalent of Voltage Values
string=str2double(VOLTAGELEVVALS); %Converts CELL data to DOUBLE Data
n=length(string);%Counts Length of String
e = 2.*string;
S=zeros(n,1);
Xi = e-1;
k=1;
for i=1:1:n
    temp=Xi(1:i,:);
    S(i)=sum(temp);
end
SD=zeros(n+2,1);
SD(1)=0;
for  k=1:1:n;
    SD(k+1)=S(k);
end
SD(n+2)=0;


freq=zeros(18,1);

for i=1:1:length(SD) 
   if SD(i)==-9
        freq(1)=freq(1)+1;
   end
   if SD(i)==-8
        freq(2)=freq(2)+1;
   end
   if SD(i)==-7
        freq(3)=freq(3)+1;
   end
   if SD(i)==-6
        freq(4)=freq(4)+1;
   end
   if SD(i)==-5
        freq(5)=freq(5)+1;
   end
   if SD(i)==-4
        freq(6)=freq(6)+1;
   end
   if SD(i)==-3
        freq(7)=freq(7)+1;
   end
   if SD(i)==-2
        freq(8)=freq(8)+1;
   end
   if SD(i)==-1
        freq(9)=freq(9)+1;
   end
   if SD(i)==1
        freq(10)=freq(10)+1;
   end
   if SD(i)==2
        freq(11)=freq(11)+1;
   end
   if SD(i)==3
        freq(12)=freq(12)+1;
   end
   if SD(i)==4
        freq(13)=freq(13)+1;
   end
   if SD(i)==5
        freq(14)=freq(14)+1;
   end
   if SD(i)==6
        freq(15)=freq(15)+1;
   end
   if SD(i)==7
        freq(16)=freq(16)+1;
   end
   if SD(i)==8
        freq(17)=freq(17)+1;
   end
   if SD(i)==9
        freq(18)=freq(18)+1;
   end
end

countzero=0;
for i=1:1:n+1
    if SD(i)==0
        countzero=countzero+1;
    end
end

J=countzero-1;
p_val=zeros(18,1);
for i=1:1:18
    p_val(i)=erfc(abs(freq(i)-J)/sqrt(2*J*(4*abs(i)-2)));
end


for i=1:1:18
    if p_val(i)>=0.01
        flag=1;
    else
        flag=0;
    end
end

if flag==1
    disp('THE SEQUENCE IS HIGHLY RANDOM');
else
    disp('THE SEQUENCE IS NON-RANDOM');
end




