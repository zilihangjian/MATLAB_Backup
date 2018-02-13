function [] = Move(square,~)%Replaced eventdata with ~
%MOVE Summary of this function goes here
%   Detailed explanation goes here

%Global Variable Declarations
global turn;
global matrix_board;
global game_over;
global board_size;
global AI;
square_string = get(square,'String');
square_tag = str2double(get(square,'Tag'));

%Checks for game_over conditions and if a move has already been played
if game_over
    return;
end
if square_string == 'O'
    return;
end
if square_string == 'X'
    return;
end

%Move for 3x3 board
if board_size == 3
    turn = turn + 1;
    if mod(turn,2) == 0  %O goes first
        set(square,'String','O');%O is represented with a -1
        if square_tag == 1
            matrix_board(1,1) = -1;
        elseif square_tag == 2
            matrix_board(2,1) = -1;
        elseif square_tag == 3
            matrix_board(3,1) = -1;
        elseif square_tag == 4
            matrix_board(1,2) = -1;
        elseif square_tag == 5
            matrix_board(2,2) = -1;
        elseif square_tag == 6
            matrix_board(3,2) = -1;
        elseif square_tag == 7
            matrix_board(1,3) = -1;
        elseif square_tag == 8
            matrix_board(2,3) = -1;
        elseif square_tag == 9
            matrix_board(3,3) = -1;
        end
    end

    if mod(turn,2) ~= 0 %X goes second
        set(square,'String','X');%X is represented with a 1
        if square_tag == 1
            matrix_board(1,1) = 1;
        elseif square_tag == 2
            matrix_board(2,1) = 1;
        elseif square_tag == 3
            matrix_board(3,1) = 1;
        elseif square_tag == 4
            matrix_board(1,2) = 1;
        elseif square_tag == 5
            matrix_board(2,2) = 1;
        elseif square_tag == 6
            matrix_board(3,2) = 1;
        elseif square_tag == 7
            matrix_board(1,3) = 1;
        elseif square_tag == 8
            matrix_board(2,3) = 1;
        elseif square_tag == 9
            matrix_board(3,3) = 1;
        end
    end
end

%Moves for a 4x4 board
if board_size == 4
    turn = turn + 1;
    if mod(turn,2) == 0  %O goes first
        set(square,'String','O');%O is represented with a -1
        if square_tag == 1
            matrix_board(1,1) = -1;
        elseif square_tag == 2
            matrix_board(2,1) = -1;
        elseif square_tag == 3
            matrix_board(3,1) = -1;
        elseif square_tag == 4
            matrix_board(4,1) = -1;
        elseif square_tag == 5
            matrix_board(1,2) = -1;
        elseif square_tag == 6
            matrix_board(2,2) = -1;
        elseif square_tag == 7
            matrix_board(3,2) = -1;
        elseif square_tag == 8
            matrix_board(4,2) = -1;
        elseif square_tag == 9
            matrix_board(1,3) = -1;
        elseif square_tag == 10
            matrix_board(2,3) = -1;
        elseif square_tag == 11
            matrix_board(3,3) = -1;
        elseif square_tag == 12
            matrix_board(4,3) = -1;
        elseif square_tag == 13
            matrix_board(1,4) = -1;
        elseif square_tag == 14
            matrix_board(2,4) = -1;
        elseif square_tag == 15
            matrix_board(3,4) = -1;
        elseif square_tag == 16
            matrix_board(4,4) = -1;    
        end
    end

    if mod(turn,2) ~= 0 %X goes second
        set(square,'String','X');%X is represented with a 1
         if square_tag == 1
            matrix_board(1,1) = 1;
        elseif square_tag == 2
            matrix_board(2,1) = 1;
        elseif square_tag == 3
            matrix_board(3,1) = 1;
        elseif square_tag == 4
            matrix_board(4,1) = 1;
        elseif square_tag == 5
            matrix_board(1,2) = 1;
        elseif square_tag == 6
            matrix_board(2,2) = 1;
        elseif square_tag == 7
            matrix_board(3,2) = 1;
        elseif square_tag == 8
            matrix_board(4,2) = 1;
        elseif square_tag == 9
            matrix_board(1,3) = 1;
        elseif square_tag == 10
            matrix_board(2,3) = 1;
        elseif square_tag == 11
            matrix_board(3,3) = 1;
        elseif square_tag == 12
            matrix_board(4,3) = 1;
        elseif square_tag == 13
            matrix_board(1,4) = 1;
        elseif square_tag == 14
            matrix_board(2,4) = 1;
        elseif square_tag == 15
            matrix_board(3,4) = 1;
        elseif square_tag == 16
            matrix_board(4,4) = 1;    
        end
    end
end

%Moves for a 5x5 board
if board_size == 5
  turn = turn + 1;
    if mod(turn,2) == 0  %O goes first
        set(square,'String','O');%O is represented with a -1
        if square_tag == 1
            matrix_board(1,1) = -1;
        elseif square_tag == 2
            matrix_board(2,1) = -1;
        elseif square_tag == 3
            matrix_board(3,1) = -1;
        elseif square_tag == 4
            matrix_board(4,1) = -1;
        elseif square_tag == 5
            matrix_board(5,1) = -1;
        elseif square_tag == 6
            matrix_board(1,2) = -1;
        elseif square_tag == 7
            matrix_board(2,2) = -1;
        elseif square_tag == 8
            matrix_board(3,2) = -1;
        elseif square_tag == 9
            matrix_board(4,2) = -1;
        elseif square_tag == 10
            matrix_board(5,2) = -1;
        elseif square_tag == 11
            matrix_board(1,3) = -1;
        elseif square_tag == 12
            matrix_board(2,3) = -1;
        elseif square_tag == 13
            matrix_board(3,3) = -1;
        elseif square_tag == 14
            matrix_board(4,3) = -1;
        elseif square_tag == 15
            matrix_board(5,3) = -1;
        elseif square_tag == 16
            matrix_board(1,4) = -1;
        elseif square_tag == 17
            matrix_board(2,4) = -1;
        elseif square_tag == 18
            matrix_board(3,4) = -1;
        elseif square_tag == 19
            matrix_board(4,4) = -1;
        elseif square_tag == 20
            matrix_board(5,4) = -1;
        elseif square_tag == 21
            matrix_board(1,5) = -1;
        elseif square_tag == 22
            matrix_board(2,5) = -1;
        elseif square_tag == 23
            matrix_board(3,5) = -1;
        elseif square_tag == 24
            matrix_board(4,5) = -1;
        elseif square_tag == 25
            matrix_board(5,5) = -1;
        end
    end

    if mod(turn,2) ~= 0 %X goes second
        set(square,'String','X');%X is represented with a 1
        if square_tag == 1
            matrix_board(1,1) = 1;
        elseif square_tag == 2
            matrix_board(2,1) = 1;
        elseif square_tag == 3
            matrix_board(3,1) = 1;
        elseif square_tag == 4
            matrix_board(4,1) = 1;
        elseif square_tag == 5
            matrix_board(5,1) = 1;
        elseif square_tag == 6
            matrix_board(1,2) = 1;
        elseif square_tag == 7
            matrix_board(2,2) = 1;
        elseif square_tag == 8
            matrix_board(3,2) = 1;
        elseif square_tag == 9
            matrix_board(4,2) = 1;
        elseif square_tag == 10
            matrix_board(5,2) = 1;
        elseif square_tag == 11
            matrix_board(1,3) = 1;
        elseif square_tag == 12
            matrix_board(2,3) = 1;
        elseif square_tag == 13
            matrix_board(3,3) = 1;
        elseif square_tag == 14
            matrix_board(4,3) = 1;
        elseif square_tag == 15
            matrix_board(5,3) = 1;
        elseif square_tag == 16
            matrix_board(1,4) = 1;
        elseif square_tag == 17
            matrix_board(2,4) = 1;
        elseif square_tag == 18
            matrix_board(3,4) = 1;
        elseif square_tag == 19
            matrix_board(4,4) = 1;
        elseif square_tag == 20
            matrix_board(5,4) = 1;
        elseif square_tag == 21
            matrix_board(1,5) = 1;
        elseif square_tag == 22
            matrix_board(2,5) = 1;
        elseif square_tag == 23
            matrix_board(3,5) = 1;
        elseif square_tag == 24
            matrix_board(4,5) = 1;
        elseif square_tag == 25
            matrix_board(5,5) = 1;
        end
    end
end

%Prevents Unnecessary Checks to some extent
if board_size == 3 && turn >= 5
    Check();
end

if board_size == 4 && turn >= 7
    Check();
end

if board_size == 5 && turn >= 9
    Check();
end

if AI && mod(turn,2) == 0 && board_size == 3
   BoardAI(); 
end

end