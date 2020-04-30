%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Developed By : Subhadip Ghosh%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%Binary Matrix Rabk Test%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%NATIONAL INSTITUTE OF STANDARDS AND TECHNOLOGY (NIST)%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%Follow me on GitHub%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all
%IMPORTED BIT STREAM
VOLTAGELEVVALS;

%CELL TO DOUBLE VALUE CONVERSION
bitStream=(VOLTAGELEVVALS);
n=length(bitStream);

%PARAMETER VALUE ASSIGNMENT
M=32;
Q=32;
N=fix(n/(M*Q));
start=1;
stop=M*Q;

%DIVISION OF SEQUENCE INTO SMALLER M BY Q 
%SUBMATRICES AND COMPUTING THEIR RESPECTIVE RANKS
for i=1:N
    matrix=zeros(M,Q);
    temp=transpose(bitStream(start:i*stop,:));
    matrix=reshape(temp,M,Q,[]);
    Rank(i)=rank(matrix);
    start=i*stop+1;
end

%COMPUTATION OF Fm, Fm-1, Fm-2

FM=0;
FM_1=0;
N_FM=0;
for i=1:N
    if Rank(i)==M
        FM=FM+1;
    elseif Rank(i)==M-1
        FM_1=FM_1+1;
    else N_FM=N_FM+1;
    end
end

%Test STATISTICS CALCULATION
chi_sq=(((FM-0.2888*N).^2)/(0.2888*N))+(((FM_1-0.5776*N).^2)/(0.5776*N))+(((N_FM-0.1336*N).^2)/(0.1336*N));
p_val=gammainc(1,chi_sq/2);

%DECISION MAKING
if p_val>0.01
    disp('RANDOM');
else
    disp('NON-RANDOM');
end