function [] = Information(~, ~)%Replaced eventdata and settings
%Information Popup dialog that has various settings for the game
%Core function is a dialog box that will contain various changeable 
%concepts with the game like the size of the board and music, along with
%other various aesthetics/game abilities
info = dialog('Position',[500, 700, 500, 300],'Color','white');
movegui(info,'center');
Heading = uicontrol(info,'Style','text','Position',[150, 75, 200, 200],...
    'String','SETTINGS', 'FontSize', 30,'BackgroundColor','white');
BSizegroup = uicontrol(info,'Style','popup','visible', 'on', 'Position',[150,175,150,25],...
    'BackgroundColor','white','String',{'3x3';'4x4';'5x5'},'Callback',...
    @Update, 'Tag','1');
BSizeString = uicontrol(info, 'Style','text','FontSize',12,...
    'Position',[50,100,100,100],'String','Board Size:','BackgroundColor','white');
PlayTypegroup = uicontrol(info,'Style','popup','visible', 'on','Position',[150,125,150,25],...
    'BackgroundColor','white','String',{'2-Player';'Computer'},'Callback',@Update...
    ,'Tag','2');
PlayTypeString = uicontrol(info, 'Style','text','FontSize',12,...
    'Position',[50,50,100,100],'String','Opponent:','BackgroundColor','white');

MusicString = uicontrol(info, 'Style','text','FontSize',12,...
    'Position',[50,0,100,100],'String','Music:','BackgroundColor','white');
Musicgroup = uicontrol(info,'Style','popup','visible', 'on', 'Position',[150,75,150,25],...
    'BackgroundColor','white','String',{'Off';'On'},'Callback',@Update,'Tag','3');
uiwait(info);
end