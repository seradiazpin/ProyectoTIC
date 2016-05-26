function varargout = GUI(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
%Se inicializa la interfaz con una imagen de la escala de la flauta
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
imshow('../imagenes/final_final.png');
%imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-0.png');

% --- Boton para grabar las notas individuales
function nota_Callback(hObject, eventdata, handles)
recObj = audiorecorder;
%GRABANDO
str='Grabando';
set(handles.message,'string',str);
recordblocking(recObj, 5);
str='';
set(handles.message,'string',str);
%FIN GRABAR

%Calcula la FFT y saca su pico maximo
myRecording = getaudiodata(recObj);
handles.myRecording = myRecording;
fmax = fftMax(myRecording,8000);
getNote(fmax);

%Guarda los datos de la nota para reproducirlos si se desea.
handles.myRecording = myRecording;
handles.fsRec = 8000;
guidata(hObject,handles)
%imshow('../imagenes/Nota-1.png');

% ---Boton para grabar canciones
function cancion_Callback(hObject, eventdata, handles)
recObj = audiorecorder;
%Se mira el tiempo de grabacion sea menos de 20s si no
%se saca error.
tiempo = str2double(get(handles.timeSong,'String'));
if tiempo <= 20.0
    %GRABAR
    str='Grabando';
    set(handles.message,'string',str);
    recordblocking(recObj, tiempo);
    str='';
    set(handles.message,'string',str);
    %FIN GRABAR
    myRecording = getaudiodata(recObj);

    %Guarda los datos de la nota para reproducirlos si se desea.
    handles.myRecording = myRecording;
    handles.fsRec = 8000;
    guidata(hObject,handles)
    %getNotes(myRecording,8000);
else
    str='Tiempo mayor a 20 s, elegir tiempo menor';
    set(handles.message,'string',str);
    recordblocking(recObj, tiempo);
end





% --- Boton para subir un archivo de una nota 
function archivo_Callback(hObject, eventdata, handles)
%Se maneja el error 
try
    w = warning('query','last');
    id = w.identifier;
    warning('off',id);
    
    [FileName,PathName] = uigetfile('*.wav','Seleccione la nota musical');
    s = strcat(PathName,FileName);
    [y,Fs] = audioread(s);
    fmax = fftMax(y,Fs);
    getNote(fmax);
    
    
    handles.myRecording = y;
    handles.fsRec = Fs;
    guidata(hObject,handles)
    
    str = '';
    set(handles.errorFile,'string',str);
catch ME
    str = 'Error al leer el archivo';
    set(handles.errorFile,'string',str);
end
    


% --- Executes on button press in archivoCancion.
function archivoCancion_Callback(hObject, eventdata, handles)
try
    w = warning('query','last');
    id = w.identifier;
    warning('off',id);
    
    [FileName,PathName] = uigetfile('*.wav','Seleccione la cancion');
    s = strcat(PathName,FileName);
    [y,Fs] = audioread(s);
    %sound(y,Fs);
    spectrogram(y,100) 
    
    str = '';
    set(handles.errorFile,'string',str);
catch ME
    str = 'Error al leer el archivo';
    set(handles.errorFile,'string',str);
end


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sound(handles.myRecording,handles.fsRec);



function timeSong_Callback(hObject, eventdata, handles)
% hObject    handle to timeSong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeSong as text
%        str2double(get(hObject,'String')) returns contents of timeSong as a double


% --- Executes during object creation, after setting all properties.
function timeSong_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeSong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
