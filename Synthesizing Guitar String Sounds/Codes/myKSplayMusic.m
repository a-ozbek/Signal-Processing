function[] = myKSplayMusic(noteVector)

Fs = 44100;

for i = 1:size(noteVector,1)
    noteFreq = noteVector(i,1);
    noteDuration = noteVector(i,2);
    
    sound(myKsSoundGenerator(noteFreq,noteDuration,Fs),Fs);
    pause(noteDuration);
    
end



end