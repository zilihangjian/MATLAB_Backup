function [] = Reset(~,~)%Replaced eventdata and reset pushbutton
%RESET Resets all the game values to the initial positions and values
%   Has access to most of the initial values and will reset all of them to
%   the original state of the game. This will set the three settings value
%   to the original state, reset turn to 1 and set the matrix_board back to
%   all zeros. Does not alter board_size to keep the board at the same previous
%   board_size.

%Global Variable Declarations
global turn;
global matrix_board;
global game_over;
global board_size
global sq11 sq12 sq13 sq14 sq15 sq21 sq22 sq23 sq24 sq25 sq31 sq32 sq33...
    sq34 sq35 sq41 sq42 sq43 sq44 sq45 sq51 sq52 sq53 sq54 sq55;
%Variable Resets
game_over = false;
turn = 1;
for i=1:board_size
    for j=1:board_size
        matrix_board(i,j) = 0;
    end
end

%Reset 3x3 Board
if board_size >= 3
    set(sq11,'String','');
    set(sq12,'String','');
    set(sq13,'String','');
    set(sq21,'String','');
    set(sq22,'String','');
    set(sq23,'String','');
    set(sq31,'String','');
    set(sq32,'String','');
    set(sq33,'String','');
end
%Reset 4x4 Board
if board_size >= 4
    set(sq14,'String','');
    set(sq24,'String','');
    set(sq34,'String','');
    set(sq41,'String','');
    set(sq42,'String','');
    set(sq43,'String','');
    set(sq44,'String','');
end
%Reset 5x5 Board
if board_size >= 5
    set(sq15,'String','');
    set(sq25,'String','');
    set(sq35,'String','');
    set(sq45,'String','');
    set(sq51,'String','');
    set(sq52,'String','');
    set(sq53,'String','');
    set(sq54,'String','');
    set(sq55,'String','');
end
end