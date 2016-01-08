function[soundVector] = myKsSoundGenerator(freqOfNote,duration,Fs)


delayLineLength = round(Fs / freqOfNote);
initialRandomWaveTable = rand(delayLineLength,1);

soundVector = zeros(round(duration * Fs) , 1);
soundVector(1:delayLineLength,1) = initialRandomWaveTable;

for i=delayLineLength+1:length(soundVector)    
    soundVector(i) = 0.5 * (soundVector(i-delayLineLength+1) + soundVector(i-delayLineLength));    
end

%Normalizing the output to -1 and +1
soundVector = soundVector-mean(soundVector);
soundVector = soundVector/max(abs(soundVector));


FigHandle = figure;
set(FigHandle, 'Position', [100, 400, 1050, 400]);
subplot(1,2,1);
plot(soundVector); xlabel('Samples'); ylabel('Amplitude'); title('(E4 (329.63 Hz) - In time domain');
subplot(1,2,2);my_fft_plot_abs(soundVector,Fs,freqOfNote*40);

%sound(soundVector,Fs);
end