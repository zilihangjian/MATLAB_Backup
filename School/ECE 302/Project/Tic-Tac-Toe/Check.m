function [] = Check()
%CHECK Called after every move to see if a winning move has occured
%Declares the necessary global variables, and then depending on the board_size 
%of the matrix, will create the number of create solutions to the board and 
%if any of the solutions occur on the board then the GameOver function is
%called. Also has checks based on if a tie occurs, and saves this code for
%the end due to it being the same regardless of the board_size of the board

%Global Variable Declarations
global matrix_board; 
global game_over;
global board_size;
global gameOverMessage;

%3x3 Board
if board_size == 3
    %Variable Declarations for every possible combination
    row1 = matrix_board(1,1) + matrix_board(1,2) + matrix_board(1,3);
    row2 = matrix_board(2,1) + matrix_board(2,2) + matrix_board(2,3);
    row3 = matrix_board(3,1) + matrix_board(3,2) + matrix_board(3,3);
    col1 = matrix_board(1,1) + matrix_board(2,1) + matrix_board(3,1);
    col2 = matrix_board(1,2) + matrix_board(2,2) + matrix_board(3,2);
    col3 = matrix_board(1,3) + matrix_board(2,3) + matrix_board(3,3);
    diag1 = matrix_board(1,1) + matrix_board(2,2) + matrix_board(3,3);
    diag2 = matrix_board(1,3) + matrix_board(2,2) + matrix_board(3,1);

%Check for X win
if row1 == board_size || row2 == board_size || row3 == board_size || col1 == board_size ...
   || col2 == board_size || col3 == board_size || diag1 == board_size || diag2 == board_size 
   
   gameOverMessage = 'Victory for Player X'; 
   game_over = true;
   GameOver();
end

%Check for O win
if row1 == -board_size || row2 == -board_size || row3 == -board_size || col1 == -board_size...
   || col2 == -board_size || col3 == -board_size || diag1 == -board_size || diag2 == -board_size 
   
   gameOverMessage = 'Victory for Player O'; 
   game_over = true;
   GameOver();
end
end

%4x4 Board
if board_size == 4
    %Variable Declarations for every possible winning move
    row1 = matrix_board(1,1) + matrix_board(1,2) + matrix_board(1,3) + ...
        matrix_board(1,4);
    row2 = matrix_board(2,1) + matrix_board(2,2) + matrix_board(2,3) + ...
        matrix_board(2,4);
    row3 = matrix_board(3,1) + matrix_board(3,2) + matrix_board(3,3) + ...
        matrix_board(3,4);
    row4 = matrix_board(4,1) + matrix_board(4,2) + matrix_board(4,3) + ...
        matrix_board(4,4);
    col1 = matrix_board(1,1) + matrix_board(2,1) + matrix_board(3,1) + ...
        matrix_board(4,1);
    col2 = matrix_board(1,2) + matrix_board(2,2) + matrix_board(3,2) + ...
        matrix_board(4,2);
    col3 = matrix_board(1,3) + matrix_board(2,3) + matrix_board(3,3) + ...
        matrix_board(4,3);
    col4 = matrix_board(1,4) + matrix_board(2,4) + matrix_board(3,4) + ...
        matrix_board(4,4);
    diag1 = matrix_board(1,1) + matrix_board(2,2) + matrix_board(3,3) + ...
        matrix_board(4,4);
    diag2 = matrix_board(1,4) + matrix_board(2,3) + matrix_board(3,2) + ...
        matrix_board(4,1);
    
%Check for X win Condition 1
if row1 == board_size || row2 == board_size || row3 == board_size || row4 == board_size ||...
   col1 == board_size || col2 == board_size || col3 == board_size || col4 == board_size ||...
   diag1 == board_size || diag2 == board_size 
   gameOverMessage = 'Victory for Player X';
   game_over = true;
   GameOver();
end
%Check for O win
if row1 == -board_size || row2 == -board_size || row3 == -board_size || row4 == -board_size ||...
   col1 == -board_size || col2 == -board_size || col3 == -board_size || col4 == -board_size ||...
   diag1 == -board_size || diag2 == -board_size
   gameOverMessage = 'Victory for Player O';
   game_over = true;
   GameOver();
end
end

%5x5 Board
if board_size == 5
    %Variable Declarations for every possible winning move
    row1 = matrix_board(1,1) + matrix_board(1,2) + matrix_board(1,3) + ...
        matrix_board(1,4) + matrix_board(1,5);
    row2 = matrix_board(2,1) + matrix_board(2,2) + matrix_board(2,3) + ...
        matrix_board(2,4) + matrix_board(2,5);
    row3 = matrix_board(3,1) + matrix_board(3,2) + matrix_board(3,3) + ...
        matrix_board(3,4) + matrix_board(3,5);
    row4 = matrix_board(4,1) + matrix_board(4,2) + matrix_board(4,3) + ...
        matrix_board(4,4) + matrix_board(4,5);
    row5 = matrix_board(5,1) + matrix_board(5,2) + matrix_board(5,3) + ...
        matrix_board(5,4) + matrix_board(5,5);
    col1 = matrix_board(1,1) + matrix_board(2,1) + matrix_board(3,1) + ...
        matrix_board(4,1) + matrix_board(5,1);
    col2 = matrix_board(1,2) + matrix_board(2,2) + matrix_board(3,2) + ...
        matrix_board(4,2) + matrix_board(5,2);
    col3 = matrix_board(1,3) + matrix_board(2,3) + matrix_board(3,3) + ...
        matrix_board(4,3) + matrix_board(5,3);
    col4 = matrix_board(1,4) + matrix_board(2,4) + matrix_board(3,4) + ...
        matrix_board(4,4) + matrix_board(5,4);
    col5 = matrix_board(1,5) + matrix_board(2,5) + matrix_board(3,5) + ...
        matrix_board(4,5) + matrix_board(5,5);
    diag1 = matrix_board(1,1) + matrix_board(2,2) + matrix_board(3,3) + ...
        matrix_board(4,4) + matrix_board(5,5);
    diag2 = matrix_board(1,5) + matrix_board(2,4) + matrix_board(3,3) + ...
        matrix_board(4,2) + matrix_board(5,1);
    
if row1 == board_size || row2 == board_size || row3 == board_size || row4 == board_size || row5...
        == board_size || col1 == board_size || col2 == board_size || col3 == board_size || col4...
        == board_size || col5 == board_size || diag1 == board_size || diag2 == board_size 
    gameOverMessage = 'Victory for Player X';
    game_over = true;
    GameOver();
end
%Check for O win
if row1 == -board_size || row2 == -board_size || row3 == -board_size || row4 == -board_size ||...
   row5 == -board_size || col1 == -board_size || col2 == -board_size || col3 == -board_size ...
   || col4 == -board_size || col5 == -board_size || diag1 == -board_size || diag2 == -board_size
   gameOverMessage = 'Victory for Player O';
   game_over = true;
   GameOver();
end
  
end
count = 0;
    for i=1:board_size
        for j=1:board_size
            if matrix_board(i,j) ~= 0
                count = count + 1;
            end
        end
    end

if count == board_size^2 && game_over == false
    gameOverMessage = 'Tie';
    game_over = true;
    GameOver();
end
end