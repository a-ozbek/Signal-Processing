function [] = recognize_chord(input_chord,fs)
disp('**************');
import_chordnotesdata();

[spectrum f n_of_samples] = my_fft_plot_abs(input_chord,fs);
hold on;
level = max(spectrum)/4;
%draw red line at level
plot(1:1400,level,'r');

peak_indexes = find(spectrum>level); 
peak_indexes = peak_indexes(size(peak_indexes)/2 + 1:size(peak_indexes),1);
peaks = f(peak_indexes);


%we obtained peaks
%matching
threshold = 2;
control = 0;
for c=1:24
   for i=1:3      
       if( min(abs(chord_notes{c}(i) - peaks)) <threshold )...
        || (min(abs(chord_notes{c}(i)*2 - peaks)) <threshold )    
             control = control + 1;
       end
    
   end   
   if(control ==3)
       chord_number = c;
       disp(get_chordname(chord_number));
       control = 0;
       %break;break;break;       
   end
   control = 0;
end
disp('**************');
end




function [name] = get_chordname(chord_number)
%C
if(chord_number == 1), name = 'C major'; , end
if(chord_number == 2), name = 'C minor'; , end
if(chord_number == 3), name = 'C# major'; , end
if(chord_number == 4), name = 'C# minor'; , end
%D
if(chord_number == 5), name = 'D major'; , end
if(chord_number == 6), name = 'D minor'; , end
if(chord_number == 7), name = 'D# major'; , end
if(chord_number == 8), name = 'D# minor'; , end
%E
if(chord_number == 9), name = 'E major'; , end
if(chord_number == 10), name = 'E minor'; , end
%F
if(chord_number == 11), name = 'F major'; , end
if(chord_number == 12), name = 'F minor'; , end
if(chord_number == 13), name = 'F# major'; , end
if(chord_number == 14), name = 'F# minor'; , end
%G
if(chord_number == 15), name = 'G major'; , end
if(chord_number == 16), name = 'G minor'; , end
if(chord_number == 17), name = 'G# major'; , end
if(chord_number == 18), name = 'G# minor'; , end
%A
if(chord_number == 19), name = 'A major'; , end
if(chord_number == 20), name = 'A minor'; , end
if(chord_number == 21), name = 'A# major'; , end
if(chord_number == 22), name = 'A# minor'; , end
%B
if(chord_number == 23), name = 'B major'; , end
if(chord_number == 24), name = 'B minor'; , end

      
    
end
