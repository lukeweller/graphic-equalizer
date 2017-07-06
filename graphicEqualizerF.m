function [handles,x,y,fs,b,T] = graphicEqualizerF(handles)
% This is the main function for the program.  It takes in the values from
% the GUI and designs the filter

% Reads in the name of the file that appears in the edit box after the user
% has selected a file
audiofile = handles.fileselectedEdit.String;

% Uses the audioread function to create x(the audio array) and fs(the
% sampling rate)
% The "fullfile(pwd,'Audio_Files'," is necessary to access the audiofile
% selected because audio files are stored in the Audio_Files folder, not 
% in the main project folder
[x,fs] = audioread(fullfile(pwd,'Audio_Files',audiofile));

% If the sampling rate is not equal to 44100 (as all audio files should
% be),this causes problems for the filter calculations.  In this event, the
% program will clear the fileselected edit box and display an error message
if fs ~= 44100
    handles.fileselectedEdit.String = '';
    disp('ERROR: MATLAB cannot read this audio file.  Please try another file');
    x = 0;
    y = 0;
    fs = 0;
    b = 0;
    T = 0;
    return;
end

% This section checks to see if the audioread created a 2 column array or a
% 1 column array.  If it was a 2 column array, the average of the two
% columns is taken and stored as the new x
xsize = size(x);
if xsize(1,2) == 2
    x = (x(:,1)+x(:,2))/2;
end

% Standard audio variables to keep track of
fn = fs/2;
ts = 1/fs;
T = length(x)*ts;

%% Tap Filter

% The user is able to control the order that is entered into the firpm
% function. This code grabs the value that the user has inputted for order
% and assigns it to the variable order.
order = get(handles.filterorderPopUp,'Value');
switch order
    case 1
        order = 4;
    case 2
        order = 8;
    case 3
        order = 16;
    case 4
        order = 24;
    case 5
        order = 36;
    case 6
        order = 48;
    case 7
        order = 60;
    case 8
        order = 100;
    case 9
        order = 1000;
end

% Sets up a frequency array (f) for firpm.  Goes up through every integer
% except 1 to the nyquist frequency.  Array skips 1 for simplification, it
% has no effect on results of filter.

f = zeros(1,fn);
for fCnt=2:fn
    f(fCnt) = fCnt;
end

% Sets up an array (a) with the values of the sliders on the GUI.  The
% value of a determines the gain or loss to that specific frequency.  The
% range of a values is (0.562,1.778).  This represents a gain or loss of 5
% decibels.
a(1) = 1;
a(2) = handles.HzSlider1.Value;
a(3) = handles.HzSlider2.Value;
a(4) = handles.HzSlider3.Value;
a(5) = handles.HzSlider4.Value;
a(6) = handles.HzSlider5.Value;
a(7) = handles.HzSlider6.Value;
a(8) = handles.HzSlider7.Value;
a(9) = handles.HzSlider8.Value;
a(10) = handles.HzSlider9.Value;
a(11) = handles.HzSlider10.Value;
a(12) = handles.HzSlider11.Value;

% Reference for which frequency values correspond to which sliders
fHz(1) = 0;
fHz(2) = 32;
fHz(3) = 64;
fHz(4) = 128;
fHz(5) = 256;
fHz(6) = 512;
fHz(7) = 1000;
fHz(8) = 2000;
fHz(9) = 4000;
fHz(10) = 8000;
fHz(11) = 16000;
fHz(12) = fn;

% In these loops, the program is filling a g array for the final input in
% the firpm function.  This g array parallels the f array established
% earlier.  It essentially sets up the weights for each frequency f based
% on the slider value a. The values of g are calculated in ranges.  Each 
% range is programmed as the midpoint between the current fHz value and the
% previous fHz value to the midpoint between current fHz value and the next
% fHz.  Each of these strategies is assigned a value from the a array.
g = zeros(1,fn);
for iCnt=1:((fHz(1)+fHz(2))/2)
    g(iCnt) = a(1);
end
for nCnt=2:11
    for iCnt=((fHz(nCnt-1)+fHz(nCnt))/2)+1:((fHz(nCnt)+fHz(nCnt+1))/2)
        g(iCnt) = a(nCnt);
    end
end
for iCnt=((fHz(11)+fHz(12))/2)+1:fn
    g(iCnt) = a(12);
end


% This if statement checks if any of the slider values have been changed.
% If nothing was changed, the program doesn't run the filter.  Instead, the
% filtered array y is set equal to the orginal audio array x.
% This code exists so that the program does not send an error message if
% the user presses the filter button before changing any of the filter
% sliders.
% If the user has changed the slider values, the program executes the firpm
% filter using the order, f/fn, and g determined above.  The filter (b) that
% is created is then used to filter the original audio array (x) to produce
% the filtered array (y).
if sum(a) == length(a)
    b = 0;
    y = x;
else
    b = firpm(order,f/fn,g);
    y = filter(b,1,x);
end

%% Plot It

% This final section plots the graph that appears in the lower right
% section of the GUI.  The program uses fft() to plot  the orginal audio
% array, and then the filtered audio array on top. Additionaly, a zoomed in 
% view of this same graph is superimposed in the top right corner of the 
% first graph so that the user is able view the low frequency data in
% greater detail.
monty = 0:1/T:(length(x)/2 - 1)/T;

spec1 = fft(x);
mag1 = abs(spec1(1:length(x)/2));

spec2 = fft(y);
mag2 = abs(spec2(1:length(x)/2));

plot(handles.filteredAxes,monty,mag1,'r',monty,mag2,'b');
xlabel(handles.filteredAxes,'f(Hz)');
grid(handles.filteredAxes,'on');
legend(handles.filteredAxes,'Original Signal','Filtered Signal','Location','northwest');

plot(handles.filteredzoomAxes,monty,mag1,'r',monty,mag2,'b');
axis([0 (0.3*10^4) 0 1500]);
xlabel(handles.filteredAxes,'f(Hz)');
grid(handles.filteredzoomAxes,'off');





