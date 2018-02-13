function [] = GameOver()
%GAMEOVER Generates the game over popup dialog
%Function called when the game has been won by either player, or if a tie 
%has occured. Will create the dialog box with the appropriate message and 
%a button that will close the dialog box for a new game. Reset is called after
%the dialog box has been close with the NewGame button
    
    info = dialog('Position',[30 10 200 200], 'Name','GameOver');
    movegui(info,'center');
    global gameOverMessage;
    message = uicontrol(info,'Style','text','Position',[50 50 100 100],...
           'String',gameOverMessage);
    NewGame = uicontrol(info,'Style','pushbutton','Units','centimeters',...
           'Position',[1.65,.25,2,.5],'FontSize',8,'Callback',...
           'delete(gcf)','String','NEWGAME');  
    uiwait(info);
    Reset();
end

