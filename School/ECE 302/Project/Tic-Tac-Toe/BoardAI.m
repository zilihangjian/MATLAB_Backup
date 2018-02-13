function [] = BoardAI()
%BoardAI Used for the AI in the 3x3 tic-tac-toe board
%Called under specific circumstances where the size is 3x3, the boolean for
%AI is true and then every other turn this function is called to make a
%move for the AI. It searchs for specific places in the order of winning
%moves and then blocking moves. If a row, column, or diagonal adds to 2 or
%-2, the AI will go there first. Beyond that, the moves are viewed more
%randomly and will select more to try and block rather than win

global matrix_board;
global turn;
global sq11 sq12 sq13 sq21 sq22 sq23 sq31 sq32 sq33;

%Initial Values
found_move = false;
xcoord = 0;
ycoord = 0;
anyRow = sum(matrix_board,2);%Size (3,1)
anyColumn = sum(matrix_board,1);%Size (1,3)
diag1 = matrix_board(1,1) + matrix_board(2,2) + matrix_board(3,3);%upper to lower
diag2 = matrix_board(1,3) + matrix_board(2,2) + matrix_board(3,1);%lower to upper

%Check for winning move for AI
%Check for row win
for k1=1:length(anyRow)
   if anyRow(k1,1) == 2 && ~found_move
        for k11=1:length(anyRow)
            if matrix_board(k1,k11) == 0
                xcoord = k1;
                ycoord = k11;
                found_move = true;
            end
        end
    end
end

%Check for diagonal wins
for k2=1:length(anyColumn)
     if anyColumn(1,k2) == 2 && ~found_move
        for k22=1:length(anyRow)
            if matrix_board(k22,k2) == 0 
                xcoord = k22;
                ycoord = k2;
                found_move = true;
            end
        end
    end
end

%Check for Diagonal Winning Move
if diag1 == 2 && ~found_move
    for k3 = 1:length(diag1)
        if matrix_board(k3,k3) == 0;
            xcoord = k3;
            ycoord = k3;
            found_move = true;
        end
    end
end

if diag2 == 2 && ~found_move
    if matrix_board(1,3) == 0
        xcoord = 1;
        ycoord = 3;
        found_move = true;
    end
    
    if matrix_board(2,2) == 0
        xcoord = 2;
        ycoord = 2;
        found_move = true;
    end
    
    if matrix_board(3,1) == 0
        xcoord = 3;
        ycoord = 1;
        found_move = true;
    end
end

%Check for Blocking Move

%Check for opponent row win
for k4=1:length(anyRow)
    if anyRow(k4,1) == -2 && ~found_move
        for k44=1:length(anyRow)
            if matrix_board(k4,k44) == 0
                xcoord = k4;
                ycoord = k44;
                found_move = true;
            end
        end
    end
end

%Check for opponent column wins
for k5=1:length(anyColumn)
    if anyColumn(1,k5) == -2 && ~found_move;
        for k55=1:length(anyRow)
            if matrix_board(k55,k5) == 0
                xcoord = k55;
                ycoord = k5;
                found_move = true;
            end
        end
    end
end

%Check for Diagonal Winning Move
if diag1 == -2 && ~found_move
    for k6 = 1:length(diag1)
        if matrix_board(k6,k6) == 0;
            xcoord = k6;
            ycoord = k6;
            found_move = true;
        end
    end
end

if diag2 == -2 && ~found_move
    if matrix_board(1,3) == 0
        xcoord = 1;
        ycoord = 3;
        found_move = true;
    end
    
    if matrix_board(2,2) == 0
        xcoord = 2;
        ycoord = 2;
        found_move = true;
    end
    
    if matrix_board(3,1) == 0
        xcoord = 3;
        ycoord = 1;
        found_move = true;
    end
end


%Random Move, find a random place == 0 and set it to 1
if ~found_move
   while ~found_move 
       c=randi([1,3]);
       r=randi([1,3]);
       if matrix_board(2,2) == 0 
           xcoord = 2;
           ycoord = 2;
           found_move = true;
       end
       if matrix_board(c,r) == 0 && ~found_move
           xcoord = c;
           ycoord = r;
           found_move = true;
       end
   end
end

%Places the X on the board
locationString = strcat(num2str(xcoord),num2str(ycoord));
if strcmp(locationString,'11')
   matrix_board(1,1) = 1; 
   set(sq11,'String','X');
elseif strcmp(locationString,'12')
    matrix_board(1,2) = 1; 
    set(sq12,'String','X');
elseif strcmp(locationString,'13')
    matrix_board(1,3) = 1; 
    set(sq13,'String','X');
elseif strcmp(locationString,'21')
    matrix_board(2,1) = 1; 
    set(sq21,'String','X');
elseif strcmp(locationString,'22')
    matrix_board(2,2) = 1; 
    set(sq22,'String','X');
elseif strcmp(locationString,'23')
    matrix_board(2,3) = 1;
    set(sq23,'String','X');
elseif strcmp(locationString,'31')
    matrix_board(3,1) = 1; 
    set(sq31,'String','X');
elseif strcmp(locationString,'32')
    matrix_board(3,2) = 1; 
    set(sq32,'String','X');
elseif strcmp(locationString,'33')
    matrix_board(3,3) = 1; 
    set(sq33,'String','X');
end
turn = turn + 1;
Check();
end

