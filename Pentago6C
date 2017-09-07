function Pentago6C
board = zeros(8);
for i = 1:8
    board(1,i) = 10;
    board(8,i) = 10;
end
for i = 1:8
    board(i,1) = 10;
    board(i,8) = 10;
end
board(4,1) = 11;
board(5,1) = 12;
board(8,4) = 13;
board(8,5) = 14;
board(5,8) = 15;
board(4,8) = 16;
board(1,5) = 17;
board(1,4) = 18;
%Empty board finished!

count = 0;
plot(board);
board = red(board);
plot(board);
board = rotation(board);
plot(board);
count = count+1;
board = blue(board);
plot(board);
board = rotationC(board);
plot(board);
count = count+1;
color = 2;
draw = false;
while checkwin(color,board) && draw==false
    if count/2 == fix(count/2) %Turns to red
        board = red(board);
        plot(board);
        color = 1;
        count = count+1;
        if isempty(find(board(2:7,2:7)==0))
            draw = true;
        end
        if checkwin(1,board) && draw==false
            board = rotation(board);
            plot(board);
        end
    else                      %Turns to blue
        board = blue(board);
        plot(board);
        color = 2;
        count = count+1;
        if isempty(find(board(2:7,2:7)==0))
            draw = true;
        end
        if checkwin(2,board) && draw==false
            board = rotationC(board);
            plot(board);
        end
    end
end
if draw==true
    disp('The game is a draw!');
else
    if color == 1
        disp('The red team win!');
    else
        disp('The blue team win!');
    end
end
end

%This function helps go one step for red team ---------------------------
function board = red(board)
%disp('Turns to red.');
[x,y] = ginput(1);
while x<0 || x>5500 || y<0 || y>5500
    [x,y] = ginput(1);
end
x = ceil(x/500);
y = ceil(y/500);
while board(y,x) ~= 0 % || x == 1 || x == 8 || y == 1 || y == 8
    [x,y] = ginput(1);
    x = ceil(x/500);
    y = ceil(y/500);
end
board(y,x) = 1;
end

%This function helps go one step for blue team --------------------------
function board = blue(board)
x = randi([2,7]);
y = randi([2,7]);
while board(x,y) ~= 0
    x = randi([2,7]);
    y = randi([2,7]);
end
board(x,y) = 2;
end

%------------------------- Plot the graph ------------------------------
function plot(board)
tile{3} = imread('blue.png','png');
tile{2} = imread('red.png','png');
tile{1} = imread('empty.png','png');
norot = imread('norot.png','png');
rotdu = imread('rotdu.png','png');
rotlr = imread('rotlr.png','png');
rotrl = imread('rotrl.png','png');
rotud = imread('rotud.png','png');
graph = [];
for i = 1:8
    line = [];
    for j = 1:8
        v = board(i,j);
        switch v
            case 0
                line = [line tile{1}];
            case 1
                line = [line tile{2}];
            case 2
                line = [line tile{3}];
            case 10
                line = [line norot];
            case {11,16}
                line = [line rotdu];
            case {12,15}
                line = [line rotud];
            case {13,18}
                line = [line rotrl];
            case {14,17}
                line = [line rotlr];
        end
    end
    graph = [graph;line];
end
image(graph);
end

%-------------------------- Rotate the board! ---------------------------
function board = rotation(board)
[x,y] = ginput(1);
while x<0 || x>5500 || y<0 || y>5500
    [x,y] = ginput(1);
end
x = ceil(x/500);
y = ceil(y/500);
while board(y,x) <= 10
    disp('Please rotate the board.');
    [x,y] = ginput(1);
    x = ceil(x/500);
    y = ceil(y/500);
end
A = [board(2,2:4);board(3,2:4);board(4,2:4)];
B = [board(5,2:4);board(6,2:4);board(7,2:4)];
C = [board(2,5:7);board(3,5:7);board(4,5:7)];
D = [board(5,5:7);board(6,5:7);board(7,5:7)];
switch board(y,x)
    case 11
        A = rot90(rot90(rot90(A)));
    case 12
        B = rot90(B);
    case 13
        B = rot90(rot90(rot90(B)));
    case 14
        D = rot90(D);
    case 15
        D = rot90(rot90(rot90(D)));
    case 16
        C = rot90(C);
    case 17
        C = rot90(rot90(rot90(C)));
    case 18
        A = rot90(A);
end
for i = 1:3
    for j = 1:3
        board(i+1,j+1) = A(i,j);
        board(i+4,j+1) = B(i,j);
        board(i+1,j+4) = C(i,j);
        board(i+4,j+4) = D(i,j);
    end
end
end

function board = rotationC(board)
x = randi([11,18]);
A = [board(2,2:4);board(3,2:4);board(4,2:4)];
B = [board(5,2:4);board(6,2:4);board(7,2:4)];
C = [board(2,5:7);board(3,5:7);board(4,5:7)];
D = [board(5,5:7);board(6,5:7);board(7,5:7)];
switch x
    case 11
        A = rot90(rot90(rot90(A)));
    case 12
        B = rot90(B);
    case 13
        B = rot90(rot90(rot90(B)));
    case 14
        D = rot90(D);
    case 15
        D = rot90(rot90(rot90(D)));
    case 16
        C = rot90(C);
    case 17
        C = rot90(rot90(rot90(C)));
    case 18
        A = rot90(A);
end
for i = 1:3
    for j = 1:3
        board(i+1,j+1) = A(i,j);
        board(i+4,j+1) = B(i,j);
        board(i+1,j+4) = C(i,j);
        board(i+4,j+4) = D(i,j);
    end
end
end

%-------------------------- Check win --------------------------
function notwin = checkwin(color,board)

notwin = true;

%Check the first row
v = find(board(2,:)==color);
if ~isempty(v)
for i = v
    col = find(board(3:6,i)~=color);
    if isempty(col)
        notwin = false;
    end
end
end

%Check the last row
v = find(board(7,:)==color);
if ~isempty(v)
for i = v
    col = find(board(3:6,i)~=color);
    if isempty(col)
        notwin = false;
    end
end
end

%Check the first column
v = find(board(:,2)==color);
if ~isempty(v)
for i = v
    col = find(board(i,3:6)~=color);
    if isempty(col)
        notwin = false;
    end
end
end

%Check the last column
v = find(board(:,7)==color);
if ~isempty(v)
for i = v
    col = find(board(i,3:6)~=color);
    if isempty(col)
        notwin = false;
    end
end
end

%Check the diagonal solution
%Check A
v = find(board(2:3,2:3)==color);
if ~isempty(find(v==2))
    count = 0;
    for i = 1:4
        if board(i+3,i+2)==color
            count = count+1;
        end
    end
    if count == 4
        notwin = false;
    end
end
if ~isempty(find(v==3))
    count = 0;
    for i = 1:4
        if board(i+2,i+3)==color
            count = count+1;
        end
    end
    if count == 4
        notwin = false;
    end
end
if ~isempty(find(v==4))
    if ~isempty(find(v==1))
        count = 1;
        for i = 4:6
            if board(i,i)==color
                count = count+1;
            end
        end
    else
        count = 0;
        for i = 4:7
            if board(i,i)==color
                count = count+1;
            end
        end
    end
    if count == 4
        notwin = false;
    end
end
%Check B
v = find(board(6:7,2:3)==color);
if ~isempty(find(v==1))
    count = 0;
    for i = 1:4
        if board(6-i,i+2)==color
            count = count+1;
        end
    end
    if count == 4
        notwin = false;
    end
end
if ~isempty(find(v==4))
    count = 0;
    for i = 1:4
        if board(7-i,i+3)==color
            count = count+1;
        end
    end
    if count == 4
        notwin = false;
    end
end
if ~isempty(find(v==3))
    if ~isempty(find(v==2))
        count = 1;
        for i = 1:3
            if board(6-i,i+3)==color
                count = count+1;
            end
        end
    else
        count = 0;
        for i = 1:4
            if board(6-i,i+3)==color
                count = count+1;
            end
        end
    end
    if count == 4
        notwin = false;
    end
end
end
