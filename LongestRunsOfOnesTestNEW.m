%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Developed By : Subhadip Ghosh%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Longest Runs of Ones Test%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%NATIONAL INSTITUTE OF STANDARDS AND TECHNOLOGY (NIST)%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%Follow me on GitHub%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all

%Contains the Imported CELL Containing LSBs of 
%Binary Equivalent of Voltage Values
VOLTAGELEVVALS; 

%Converts CELL data to DOUBLE Data
S=str2double(VOLTAGELEVVALS);

%Counts Length of String
n=length(S);

%PARAMETER COMPUTATION
if(n>=128 && n<6272)
    M=8;
    vi=zeros(4,1);
    K=3;
    N=16;
    pi_i = [0.21484375, 0.3671875, 0.23046875, 0.1875];

else if (n>=6272 && n<750000)
        M=128;
        vi=zeros(6,1);
        K=5;
        N=49;
        pi_i = [0.1174035788, 0.242955959, 0.249363483, 0.17517706, 0.102701071, 0.112398847];
    else
        M=10000;
        vi=zeros(7,1);
        K=6;
        N=75;
        pi_i = [0.0882, 0.2092, 0.2483, 0.1933, 0.1208, 0.0675, 0.0727];
end
end
c=floor(n/M);
%Resizing the stream to M*N Elements ignoring remaining
S=S(1:M*c,:);

%Reshaping to N ROWS AND M COLS
s=1;
v=1;
for i=1:M:M*c
    for j=1:1:M
        T(v,j)=S(s);
        s=s+1;
    end
    v=v+1;
end
S=T;


%Longest Runs of 1s In Each Block
freq=zeros(c,1);
v=1;
count=0;
result=0;
for i=1:1:c
    for j=1:1:M
        if S(i,j)==0
            count=0
        else
            count=count+1;
            if(count>result)
                result=count
            end
        end
    end
    freq(v)=result;
    result=0;
    count=0;
    v=v+1;
end 
%Vi computation GROUPING

if M==8
    for i=1:1:c
        if freq(i)<=1
            vi(1)=vi(1)+1;
        elseif freq(i)==2
            vi(2)=vi(2)+1;
        elseif freq(i)==3
            vi(3)=vi(3)+1;
        elseif freq(i)>=4
            vi(4)=vi(4)+1;
        end
    end
elseif M==128
    for i=1:1:c
        if freq(i)<=4
            vi(1)=vi(1)+1;
        elseif freq(i)==5
            vi(2)=vi(2)+1;
        elseif freq(i)==6
            vi(3)=vi(3)+1;
        elseif freq(i)==7
            vi(4)=vi(4)+1;
        elseif freq(i)==8
            vi(5)=vi(5)+1;
        elseif freq(i)>=9
            vi(6)=vi(6)+1;
        end
    end
    
else
    for i=1:1:c
        if freq(i)<=10
            vi(1)=vi(1)+1;
        elseif freq(i)==11
            vi(2)=vi(2)+1;
        elseif freq(i)==12
            vi(3)=vi(3)+1;
        elseif freq(i)==13
            vi(4)=vi(4)+1;
        elseif freq(i)==14
            vi(5)=vi(5)+1;
        elseif freq(i)==15
            vi(6)=vi(6)+1;
        elseif freq(i)>=16
            vi(7)=vi(7)+1;
        end
    end
    
end


%TEST STATISTICS COMPUTATION
Chi_Sq=0;
for i=1:1:K+1
    Chi_Sq=Chi_Sq+(power((vi(i)-N*pi_i(i)),2))/(N*pi_i(i));
end

%Decision Making

p_val=gammainc(K/2,Chi_Sq/2);
if(p_val>0.01)
    disp('RANDOM');
else
    disp('NON-RANDOM');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%END OF CODE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






