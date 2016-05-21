function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 17-May-2016 16:17:44

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
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
imshow('../imagenes/Nota-0.png');
%imshow('C:\Users\Daniel\Downloads\ProyectoTIC-master\imagenes\Nota-0.png');

% --- Executes on button press in nota.
function nota_Callback(hObject, eventdata, handles)
recObj = audiorecorder; %Para grabar las notas individuales.
%GRABANDO
str='Grabando';
set(handles.message,'string',str);
recordblocking(recObj, 5);
str='';
set(handles.message,'string',str);
%FIN GRABAR
myRecording = getaudiodata(recObj);
handles.myRecording = myRecording;
fmax = fftMax(myRecording,8000);
getNote(fmax);
%imshow('../imagenes/Nota-1.png');

% --- Executes on button press in cancion.
function cancion_Callback(hObject, eventdata, handles)
recObj = audiorecorder; %Para grabar las notas individuales.
%GRABANDO
str='Grabando';
set(handles.message,'string',str);
recordblocking(recObj, 10);
str='';
set(handles.message,'string',str);
%FIN GRABAR
myRecording = getaudiodata(recObj);
handles.myRecording = myRecording;
%getNotes(myRecording,8000);
s = spectrogram(myRecording);
disp(s);




% --- Executes on button press in archivo.
function archivo_Callback(hObject, eventdata, handles)
[FileName,PathName] = uigetfile('*.wav','Seleccione la nota musical');
s = strcat(PathName,FileName);
[y,Fs] = audioread(s);
sound(y,Fs);
fmax = fftMax(y,Fs);
getNote(fmax);


% --- Executes on button press in archivoCancion.
function archivoCancion_Callback(hObject, eventdata, handles)
[FileName,PathName] = uigetfile('*.wav','Seleccione la cancion');
s = strcat(PathName,FileName);
[y,Fs] = audioread(s);
sound(y,Fs);
f = meanfreq(y,Fs,[763.99 800.0]);
disp(f);
