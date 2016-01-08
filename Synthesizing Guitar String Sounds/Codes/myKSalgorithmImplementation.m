freqOfNote = 110;
Fs = 44100;

%p
delayLineLength = round(Fs / freqOfNote);
initialRandomWaveTable = rand(delayLineLength,1);

%create the sound vector
%duration in seconds
duration = 2;

soundVector = zeros(round(duration * Fs) , 1);
soundVector(1:delayLineLength,1) = initialRandomWaveTable;

for i=delayLineLength+1:length(soundVector)    
    soundVector(i) = 0.5 * (soundVector(i-delayLineLength+1) + soundVector(i-delayLineLength));    
end

soundVector = soundVector-mean(soundVector);
soundVector = soundVector/max(abs(soundVector));

sound(soundVector,Fs);

figure();
my_fft_plot_abs(soundVector,Fs,10000);
title('Spectrum');

figure();
plot(soundVector);
xlabel('seconds');ylabel('amplitude');
title('Signal In Time Domain');