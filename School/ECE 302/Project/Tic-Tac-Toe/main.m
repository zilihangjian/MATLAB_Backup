function [] = main(boardSize)%Start in cmd line with main(Boardsize)
clc; close all;
global AI;
AI = false;
board(boardSize);%Starting tic-tac-toe board of 3
text = dialog('Position',[500, 700, 500, 300],'Color','white');
movegui(text,'center');

%Introduction Text
S1 = 'This is Tac-Toe-Toe. There are three different versions with 3x3, ';
S2 = '4x4, and 5x5 Tic-Tac-Toe. The 3x3 version has the option to play a';
S3 = 'gainst a computer or another person. The 4x4 and 5x5 have no optio';
S4 = 'n to play against a computer. There is also a music option for the';
S5 = ' game. All of these options are found in the settings and can be c';
S6 = 'hanged one at a time. The reset button will reset the plays on the'; 
S7 = 'board. It will not reset the music, size, or AI option. Enjoy.    ';
MainText = strcat(S1,S2,S3,S4,S5,S6,S7);
text_info = uicontrol(text,'Style','text','Position',[150, 75, 250, 200],...
     'String',MainText, 'FontSize', 10,'BackgroundColor','white');
Continue = uicontrol(text,'Style','pushbutton','Position',[235,25,75,25]...
    ,'String','Continue','FontSize',10,'BackgroundColor','white','Callback',...
    'delete(gcf)');
end