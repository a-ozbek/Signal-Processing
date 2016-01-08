function [X,f,n_of_samples] = my_fft_plot_abs(x,fs)
%Parameters:
%x : is the function to calculate its fourier
%fs: sampling frequency of fs
 
NFFT = 2^nextpow2(length(x)); %number of samples
 
%calculating fourier transform
X = fft(x,NFFT);
X=fftshift(X);
 
%arranging f axis
f = fs/2 * linspace(-1,1,NFFT);

X = abs(X);
% X = X(1: (1400*(NFFT/2)) / (fs/2),1);

stem(f,abs(X),'marker','none');
xlim([0 1400]);
title('Magnitude');
xlabel('f [Hertz]');

n_of_samples = NFFT;


%fs/2 --> NFFT/2 
%1400 ---> 1400*(NFFT/2) / (fs/2);