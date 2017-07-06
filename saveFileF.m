function saveFileF(handles,x,y,fs,b,T);

% Saves the filtered array as a new audio file
% Name is set by string in the box in the GUI

newfileName = handles.saveasEdit.String;

audiowrite(newfileName,y,fs);

% Moves the new file into a folder called Filtered_Audio
% Helps the user keep track of where the files are going

movefile(newfileName,fullfile(pwd,'Audio_Files/Filtered_Audio'));

% All filtered audio goes into seperate folder

