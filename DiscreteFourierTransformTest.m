%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Developed By : Subhadip Ghosh%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%Discrete Fourier transform Test%%%%%%%%%%%%%%%%%%%%%%%
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


% Truncate and make +/-1
e= 2.*string;
Xi= e-1;

% FFT
S = fft(Xi,n,1);
SI(:,1)= S(1:n/2,1);


% Modulus of FFT sequence
M = abs(SI);

% 95% bound
results.T = sqrt((-log(0.05))*n);

% Expected count
results.N_0 = 0.95*n / 2;

% Actual count
results.N_1 = sum(M < results.T,1);

% d
results.d = (results.N_1 - results.N_0) / sqrt(n*0.95*0.05/4);

% Statistics
results.p_value = erfc(abs(results.d)/sqrt(2));

disp(results.p_value)

%Decision Making
if results.p_value >0.01
    disp('The result is Random');
else
    disp('The result is non Random');
end


