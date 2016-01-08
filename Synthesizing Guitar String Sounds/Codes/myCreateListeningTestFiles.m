%Sampling Frequency
Fs = 44100;
%Listening Test Notes
%noteData
noteFreqs = {82.41, 110, 146.83, 196, 246.94, 329.63};
noteNames = {'E2','A2','D3','G3','B3','E4'};

%noteDuration
nD = 2;
%pause duration between each note in the sound file
pauseDuration = 0.4;
pauseBlock = zeros(round(pauseDuration * Fs),1);

for i=1:size(noteFreqs,2)
    for j=i+1:size(noteFreqs,2)
        wavwrite([myKsSoundGenerator(noteFreqs{i},nD,Fs); pauseDuration; myKsSoundGenerator(noteFreqs{j},nD,Fs)], Fs, strcat(noteNames{i},'v',noteNames{j}));         
    end
end





