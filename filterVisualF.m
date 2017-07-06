function filterVisualF(handles,x,y,fs,b,T)
% This function creates a plain sinusoidal array, then runs it through the
% designed filter, and plots the results.  Purpose is to clearly
% demonstrate effects of filter

% Standard audio setup
ts = 1/fs;
N = T/ts;

% monty1 is a time array
monty1 = 0:ts:(N-1)*ts;

% generation of the sinusoidal array
z = cos(2*pi*100*monty1);

for zCnt = 2:(200) % 200 looks the most appropriate on gui
    z = z+cos(2*pi*(100+(zCnt-1)*100)*monty1);
end

% checks if any filter values have changed
% (b = 0 if no sliders moved)
% runs z through b filter
if b ~= 0 
    z = filter(b,1,z);
end

% Plots this filtered z on the gui
magz = abs(fft(z));

magz = magz(1:N/2);

freq = 0 : 1/T : (N/2 -  1)/T;

plot(handles.originalAxes,freq,magz);
xlabel(handles.originalAxes,'f(Hz)');

