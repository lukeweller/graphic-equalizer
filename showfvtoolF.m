function showfvtoolF(handles,x,y,fs,b,T)

% checks if slider values have changed
% if no change, b is set to 0
% If sliders have moved, runs fvtool
if b~=0
    fvtool(b,1);
end