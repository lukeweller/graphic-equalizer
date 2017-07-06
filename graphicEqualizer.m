function varargout = graphicEqualizer(varargin)
% GRAPHICEQUALIZER MATLAB code for graphicEqualizer.fig
%      GRAPHICEQUALIZER, by itself, creates a new GRAPHICEQUALIZER or raises the existing
%      singleton*.
%
%      H = GRAPHICEQUALIZER returns the handle to a new GRAPHICEQUALIZER or the handle to
%      the existing singleton*.
%
%      GRAPHICEQUALIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAPHICEQUALIZER.M with the given input arguments.
%
%      GRAPHICEQUALIZER('Property','Value',...) creates a new GRAPHICEQUALIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before graphicEqualizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to graphicEqualizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help graphicEqualizer

% Last Modified by GUIDE v2.5 27-Apr-2017 06:58:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @graphicEqualizer_OpeningFcn, ...
                   'gui_OutputFcn',  @graphicEqualizer_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before graphicEqualizer is made visible.
function graphicEqualizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to graphicEqualizer (see VARARGIN)

% Choose default command line output for graphicEqualizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes graphicEqualizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = graphicEqualizer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browseButton.
function browseButton_Callback(hObject, eventdata, handles)
% hObject    handle to browseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Allows user to find a file in the finder
audiofileName = uigetfile(fullfile(pwd,'Audio_Files','*.wav;*.mp3;*.ogg')); % User grabs file from specail folder called Audio Files
handles.fileselectedEdit.String = audiofileName;


function fileselectedEdit_Callback(hObject, eventdata, handles)
% hObject    handle to fileselectedEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fileselectedEdit as text
%        str2double(get(hObject,'String')) returns contents of fileselectedEdit as a double


% --- Executes during object creation, after setting all properties.
function fileselectedEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileselectedEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in filterorderPopUp.
function filterorderPopUp_Callback(hObject, eventdata, handles)
% hObject    handle to filterorderPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filterorderPopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filterorderPopUp

% --- Executes during object creation, after setting all properties.
function filterorderPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filterorderPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function HzSlider1_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function HzSlider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HzSlider2_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function HzSlider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HzSlider3_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function HzSlider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HzSlider4_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function HzSlider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HzSlider5_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function HzSlider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HzSlider6_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function HzSlider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HzSlider7_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function HzSlider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HzSlider8_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function HzSlider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HzSlider9_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% --- Executes during object creation, after setting all properties.
function HzSlider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HzSlider10_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function HzSlider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HzSlider11_Callback(hObject, eventdata, handles)
% hObject    handle to HzSlider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function HzSlider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HzSlider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in callButton.
function callButton_Callback(hObject, eventdata, handles)
% hObject    handle to callButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Filter button on GUI, essentially applies the filter the user creates
[handles,x,y,fs,b,T] = graphicEqualizerF(handles); % calls main calculations function
filterVisualF(handles,x,y,fs,b,T) % function that plots top right graph

% --- Executes on button press in soundButton.
function soundButton_Callback(hObject, eventdata, handles)
% hObject    handle to soundButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Play audio button on the GUI
[handles,x,y,fs,b,T] = graphicEqualizerF(handles); % calls main calculations function
playSoundF(handles,x,y,fs,b,T); % function that 


% --- Executes on button press in fvtoolButton.
function fvtoolButton_Callback(hObject, eventdata, handles)
% hObject    handle to fvtoolButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% fvtool button on GUI, allows user to view fvtool of the filter
[handles,x,y,fs,b,T] = graphicEqualizerF(handles); % main function call
showfvtoolF(handles,x,y,fs,b,T); % Handles display of fvtool


% --- Executes on button press in savefileButton.
function savefileButton_Callback(hObject, eventdata, handles)
% hObject    handle to savefileButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Allows user to save a file
[handles,x,y,fs,b,T] = graphicEqualizerF(handles); % main function call
saveFileF(handles,x,y,fs,b,T); % calls function to save the filtered audio



function saveasEdit_Callback(hObject, eventdata, handles)
% hObject    handle to saveasEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of saveasEdit as text
%        str2double(get(hObject,'String')) returns contents of saveasEdit as a double

% This edit box controls the name of saved file

% --- Executes during object creation, after setting all properties.
function saveasEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to saveasEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
