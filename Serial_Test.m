%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Developed By : Subhadip Ghosh%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%the Serial Test%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%NATIONAL INSTITUTE OF STANDARDS AND TECHNOLOGY (NIST)%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%Follow me on GitHub%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all

%Contains the Imported CELL Containing LSBs of
%Binary Equivalent of Voltage Values
VOLTAGELEVVALS;
%Converts CELL data to DOUBLE Data
string=str2double(VOLTAGELEVVALS); 
%Counts Length of String
n=length(string);
S=string;
m=1;

%appending first m-1 bits to the end
for i=1:1:m-1
    S(n+i)=S(i);
end

% //////////////////////////////////M BIT//////////////////////////////////
binary10bit=decimalToBinaryVector(0:1023,10);
freq10=zeros(1024,1);

buffer10=zeros(1,10);
stop=m-1;
l=1;
for i=1:1:n
    for j=i:1:stop+i
        buffer10(l)=S(j);
        l=l+1;
    end
    l=1;
    for k=1:1:1024
        if binary10bit(k,1:10)==buffer10;
           freq10(k)=freq10(k)+1;
        end
    end
end



% //////////////////////////////////M-1 BIT///////////////////////////////

binary9bit=decimalToBinaryVector(0:511,9);
freq9=zeros(512,1);

buffer9=zeros(1,9);
stop=m-2;
l=1;
for i=1:1:n
    for j=i:1:stop+i
        buffer9(l)=S(j);
        l=l+1;
    end
    l=1;
    for k=1:1:512
        if binary9bit(k,1:9)==buffer9;
           freq9(k)=freq9(k)+1;
        end
    end
end


% //////////////////////////////////M-2 BIT///////////////////////////////

binary8bit=decimalToBinaryVector(0:255,8);
freq8=zeros(256,1);

buffer8=zeros(1,8);
stop=m-3;
l=1;
for i=1:1:n
    for j=i:1:stop+i
        buffer8(l)=S(j);
        l=l+1;
    end
    l=1;
    for k=1:1:256
        if binary8bit(k,1:8)==buffer8;
           freq8(k)=freq8(k)+1;
        end
    end
end


% CHI m SQUARE CALCULATION////////////////////////////////////////////////
Chim2=0;
for i=1:1:1024
    Chim2=Chim2+(power(freq10(i),2));
end
Chim2=(power(2,m)/n)*Chim2-n;


% CHI m-1 SQUARE CALCULATION////////////////////////////////////////////////
Chim_12T=0;
for i=1:1:512
    Chim_12T=Chim_12T+(power(freq9(i),2));
end
Chim_12=((power(2,(m-1))/n)*Chim_12T)-n;
        
% CHI m-2 SQUARE CALCULATION////////////////////////////////////////////////
Chim_22T=0;
for i=1:1:256
    Chim_22T=Chim_22T+(power(freq8(i),2));
end
Chim_22=(power(2,m-2)/n)*Chim_22T-n;

%DelCHIsquare Compiutation
DelChim2=Chim2-Chim_12;
Del2Chim2=Chim2-2*Chim_12+Chim_22;
p_val1=gammainc(power(2,m-2),DelChim2);
p_val2=gammainc(power(2,m-3),Del2Chim2);

%Decision Making
if p_val1>=0.01
    if p_val2>=0.01
        disp('THE SERIES IS RANDOM');
    end
else
    disp('THE SERIES IS NON-RANDOM');
end

        