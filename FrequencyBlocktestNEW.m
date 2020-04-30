%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Developed By : Subhadip Ghosh%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%Frequency Monobit Test%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%NATIONAL INSTITUTE OF STANDARDS AND TECHNOLOGY (NIST)%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%Follow me on GitHub%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all
%Contains the Imported CELL Containing LSBs of Binary 
%Equivalent of Voltage Values
VOLTAGELEVVALS; 

%Converts CELL data to DOUBLE Data
bitstring=str2double(VOLTAGELEVVALS); 

%Counts Length of String
n=length(bitstring);

%n=M*N ////Taking M=30 (Parameter)    
M=9500;
N=floor(n/M);

%Resizing the stream to M*N Elements ignoring remaining
bitstring=bitstring(1:M*N,:);
S=zeros(N,M);
%Reshaping to N ROWS AND M COLS
s=1;
v=1;
for i=1:M:M*N
    for j=1:1:M
        S(v,j)=bitstring(s);
        s=s+1;
    end
    v=v+1;
end
bitstring=S;
%EACH ROW ELEMENTS SUM DIVIDED BY M
pi=sum(bitstring,2)/M;

%Chi2 statistics COMPUTATION
chiSquare=4*M*(sum((pi-0.5).^2));

%P-Value COMPUTATION/////////////////////
p_val=gammainc(N/2,chiSquare/2,'upper');

%DECISION MAKING
if(p_val>0.01)
    disp('RANDOM');
else
    disp('NON-RANDOM');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%end of code%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
        

