function [] = Update(pp,~)
%Update: Update the Settings Value based on user input
%There are three main values that the user can change, the first being the
%board_size of the board, the second being the opponent type, and the third being
%the music. This function operates as an updater for these values based on
%the user input Settings menu. It reads the tag with the get function based
%on what popup menu is associated with that tag, and subsequently changes
%updates based on which string was selected from the popupmenu. The input
%pp represents the popupmenu selected

%Global Variable Declrations
global board_size;
global AI;
global music;
global game;
%Other Declarations  
pu_tag = get(pp,'Tag');
pu_tag = str2double(pu_tag);
   
%Tage for changeing board_size
if pu_tag == 1
    index1 = get(pp,'Value');
    items1 = get(pp,'String');
    Stringboard_size = char(items1(index1,:));
    board_size = str2double(Stringboard_size(1,1));
end
%Tag for changing Opponent Type
if pu_tag == 2
    index2 = get(pp,'Value');
    items2 = get(pp,'String');
    AIString = char(items2(index2,:));
    if strcmp(AIString,'Computer')
        AI = true;
    else
        AI = false;
    end
end
%Tag for toggling Music\
if pu_tag == 3
    index3 = get(pp,'Value');
    items3 = get(pp,'String');
    MusicString = char(items3(index3,:));
    if strcmp(MusicString,'On')
        music = true;
    else
        music = false; 
    end
end
close(game);
board(board_size);
end