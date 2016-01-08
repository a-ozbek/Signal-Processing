function [X,f,N_point_DFT] = my_fft_plot_abs(x,Fs,xlimFreq)
%Parameters:
%x : is the function to calculate its fourier
%fs: sampling frequency of x
 
NFFT = 2^nextpow2(length(x)); %N-point DFT
 
%calculating fourier transform
X = fft(x,NFFT);
X=fftshift(X);
 
%arranging f axis
f = Fs/2 * linspace(-1,1,NFFT);

X = abs(X);

stem(f,abs(X),'marker','none');
xlim([-xlimFreq xlimFreq]);
title('Magnitude');
xlabel('f [Hertz]');

N_point_DFT = NFFT;
