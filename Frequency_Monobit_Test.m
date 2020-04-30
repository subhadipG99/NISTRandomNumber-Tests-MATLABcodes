%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Developed By : Subhadip Ghosh%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%Frequency Monobit Test%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%NATIONAL INSTITUTE OF STANDARDS AND TECHNOLOGY (NIST)%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%Follow me on GitHub%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all
%Contains the Imported CELL Containing LSBs of Binary Equivalent of Voltage Values
VOLTAGELEVVALS; 

%Converts CELL data to DOUBLE Data
string=str2double(VOLTAGELEVVALS); 

%Counts Length of String
n=length(string);

%Conversion to +1 and -1
e = 2.*string;
Xi = e-1;

%Sabs Test Statistics Calculation
Ssum=abs(sum(Xi));
Sabs=Ssum/sqrt(n);

%Pval using Complementary error function
Pval=erfc(Sabs/sqrt(2));

%Decision Making
if(Pval<0.01)
    disp('The String of Numbers is Not Random');
else
    disp('The String of Numbers is Random');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%END OF CODE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

