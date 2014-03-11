function varargout = hc_gui2(varargin)
% HC_GUI2 MATLAB code for hc_gui2.fig
%      HC_GUI2, by itself, creates a new HC_GUI2 or raises the existing
%      singleton*.
%
%      H = HC_GUI2 returns the handle to a new HC_GUI2 or the handle to
%      the existing singleton*.
%
%      HC_GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HC_GUI2.M with the given input arguments.
%
%      HC_GUI2('Property','Value',...) creates a new HC_GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hc_gui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hc_gui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hc_gui2

% Last Modified by GUIDE v2.5 13-Mar-2013 02:49:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hc_gui2_OpeningFcn, ...
                   'gui_OutputFcn',  @hc_gui2_OutputFcn, ...
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


% --- Executes just before hc_gui2 is made visible.
function hc_gui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hc_gui2 (see VARARGIN)

% Choose default command line output for hc_gui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hc_gui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hc_gui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str = get(handles.popupmenu1, 'String');
val = get(handles.popupmenu1,'Value');

switch str{val};
    case 'Genetski algoritam - krizanje poretkom'
        e4 = str2double(get(handles.edit4,'String'));
        e1 = str2double(get(handles.edit1,'String'));
        e2 = str2double(get(handles.edit2,'String'));
        e3 = str2double(get(handles.edit3,'String'));
        [x,y,t] = pozovi_genetski1(e4,e1, e2, e3);
        h=findobj('Type','axes','Tag','axes1');
        plot(h,x,y,'d','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','g','MarkerSize',10);
        title(h,'Graficki prikaz rezultata');
        xlabel(h,'Indeksi pokretanja');
        ylabel(h,'Rezultat algoritma');
        grid(h,'on');
        set(h,'Tag','axes1');
        
        text = '';
        myHandle = handles.edit10;   
        for j=1:length(t)
            if (j == 1)
                formatSpec = '------------> Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
            elseif(j==length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            elseif (j~=length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            end
        end
        set(myHandle,'String',text);
        
    case 'Genetski algoritam - krizanje poretkom & elitizam'
        e4 = str2double(get(handles.edit4,'String'));
        e1 = str2double(get(handles.edit1,'String'));
        e2 = str2double(get(handles.edit2,'String'));
        e3 = str2double(get(handles.edit3,'String'));
        e11 = str2double(get(handles.edit11,'String'));
        [x,y,t] = pozoviGenetski_2var(e4,e1, e2, e3, e11);
        h=findobj('Type','axes','Tag','axes1');
        plot(h,x,y,'d','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','g','MarkerSize',10);
        title(h,'Graficki prikaz rezultata');
        xlabel(h,'Indeksi pokretanja');
        ylabel(h,'Rezultat algoritma');
        grid(h,'on');
        set(h,'Tag','axes1');
        
        text = '';
        myHandle = handles.edit10;   
        for j=1:length(t)
            if (j == 1)
                formatSpec = '------------> Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
            elseif(j==length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            elseif (j~=length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            end
        end
        set(myHandle,'String',text);
        
        
    case 'Mravlji algoritam '
        e4 = str2double(get(handles.edit4,'String'));
        e1 = str2double(get(handles.edit1,'String'));
        e2 = str2double(get(handles.edit2,'String'));
        e3 = str2double(get(handles.edit3,'String'));
        [x,y,t] = pozovi_mravlji_v1(e4,e1, e2, e3);
        h=findobj('Type','axes','Tag','axes1');
        plot(h,x,y,'d','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','g','MarkerSize',10);
        title(h,'Graficki prikaz rezultata');
        xlabel(h,'Indeksi pokretanja');
        ylabel(h,'Rezultat algoritma');
        grid(h,'on');
        set(h,'Tag','axes1');
        
            text = '';
        myHandle = handles.edit10;   
        for j=1:length(t)
            if (j == 1)
                formatSpec = '------------> Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
            elseif(j==length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            elseif (j~=length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            end
        end
        set(myHandle,'String',text);
        
        
    case 'Mravlji algoritam - blizanac'
        e4 = str2double(get(handles.edit4,'String'));
        e1 = str2double(get(handles.edit1,'String'));
        e2 = str2double(get(handles.edit2,'String'));
        e3 = str2double(get(handles.edit3,'String'));
        [x,y,t] = pozovi_mravlji_v2(e4,e1, e2, e3);
        h=findobj('Type','axes','Tag','axes1');
        plot(h,x,y,'d','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','g','MarkerSize',10);
        title(h,'Graficki prikaz rezultata');
        xlabel(h,'Indeksi pokretanja');
        ylabel(h,'Rezultat algoritma');
        grid(h,'on');
        set(h,'Tag','axes1');
        
           text = '';
        myHandle = handles.edit10;   
        for j=1:length(t)
            if (j == 1)
                formatSpec = '------------> Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
            elseif(j==length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            elseif (j~=length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            end
        end
        set(myHandle,'String',text);
        
        
    case 'Imunoloski algoritam'
        e4 = str2double(get(handles.edit4,'String'));
        e1 = str2double(get(handles.edit1,'String'));
        e2 = str2double(get(handles.edit2,'String'));
        e3 = str2double(get(handles.edit3,'String'));
        [x,y,t] = pozovi_imunoloski(e4,e1, e2, e3);
        h=findobj('Type','axes','Tag','axes1');
        plot(h,x,y,'d','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','g','MarkerSize',10);
        title(h,'Graficki prikaz rezultata');
        xlabel(h,'Indeksi pokretanja');
        ylabel(h,'Rezultat algoritma');
        grid(h,'on');
        set(h,'Tag','axes1');
        
          text = '';
        myHandle = handles.edit10;   
        for j=1:length(t)
            if (j == 1)
                formatSpec = '------------> Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
            elseif(j==length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            elseif (j~=length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            end
        end
        set(myHandle,'String',text);
        
    case 'Genetski algoritam - greedy krizanje'    
        e4 = str2double(get(handles.edit4,'String'));
        e1 = str2double(get(handles.edit1,'String'));
        e2 = str2double(get(handles.edit2,'String'));
        e3 = str2double(get(handles.edit3,'String'));
        [x,y,t] = pozovi_genetski_greedy(e4,e1, e2, e3);
        h=findobj('Type','axes','Tag','axes1');
        plot(h,x,y,'d','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','g','MarkerSize',10);
        title(h,'Graficki prikaz rezultata');
        xlabel(h,'Indeksi pokretanja');
        ylabel(h,'Rezultat algoritma');
        grid(h,'on');
        set(h,'Tag','axes1');
        
        text = '';
        myHandle = handles.edit10;   
        for j=1:length(t)
            if (j == 1)
                formatSpec = '------------> Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
            elseif(j==length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            elseif (j~=length(t))
                formatSpec = 'Trajanje %d.og izvodjenja: %f s ------------> ';
                str = sprintf(formatSpec, j, t(j));
                text = strcat(text,str);
                
            end
        end
        set(myHandle,'String',text); 
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

e5 = str2double(get(handles.edit5,'String')); %ime datoteke novog grafa
e6 = str2double(get(handles.edit6,'String')); %broj vrhova u novom grafu
e7 = str2double(get(handles.edit7,'String')); %konstanta c
random_graph1(e6,e5,e7);
warndlg('Proces je zavrsio!','!! Warning !!')

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
