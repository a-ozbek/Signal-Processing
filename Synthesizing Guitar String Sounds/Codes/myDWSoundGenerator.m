function [y] = myDWSoundGenerator(freqOfNote,duration,pickLoc, pickUpLoc,Fs)
%duration: duration of the note that is going to be played
%pickLoc: relative picking position of the string [0-1]
%pickUpLoc: relative picking up position of the sound.
%Fs: Sampling frequency

%In this method freqOfNote is determined by the string length.
%lambda = waveLength, f = freqOfNote, v = speed of the wave
%v = lambda * f;
%v = Fs samples/second
%-> lambda = Fs / f
%-> stringLength = lambda / 2;
%-> stringLength = (Fs/f) / 2;
stringLength = round((Fs/freqOfNote) / 2);
pickPosition = round(stringLength * pickLoc);
pickupPosition = round(stringLength * pickUpLoc);


%the wave traveling to the right, amplitude values
rightWave = zeros(stringLength,1);
%the wave traveling to the left, amplitude values
leftWave  = zeros(stringLength,1);
%initial conditions of the string(generate triangular wave)
initialHeight = 0.5;

x = 0:stringLength-1;
initialCondition=initialHeight/pickPosition.*x(1:pickPosition+1);
initialCondition(pickPosition+1:stringLength)=-initialHeight/(stringLength-pickPosition).*x(pickPosition+1:stringLength)+initialHeight*stringLength/(stringLength-pickPosition+1);
rightWave = initialCondition; leftWave = initialCondition;

dampingFactor = 0.99;
y = zeros(Fs*duration,1);
for i=1:Fs*duration    
    y(i) = rightWave(pickupPosition) + leftWave(pickupPosition);
    
    %Here we are going to simulate travelling of both right and left waves
    %shift the waves traveling to the right
    rightLast = rightWave(stringLength);
    rightWave(2:stringLength) = rightWave(1:stringLength-1);
    rightWave(1) = (-1) * dampingFactor * leftWave(1);
    
    leftWave(1:stringLength-1) = leftWave(2:stringLength);
    leftWave(stringLength) = (-1) * dampingFactor * rightLast;
        
end

%normalize y
y = y - mean(y);
y = y / max(abs(y));

FigHandle = figure;
set(FigHandle, 'Position', [100, 400, 1050, 400]);
subplot(1,2,1);
plot(y); xlabel('Samples'); ylabel('Amplitude'); title('(G3 (196 Hz) - In time domain');
subplot(1,2,2);my_fft_plot_abs(y,Fs,freqOfNote*100);

%sound(y,Fs);


end