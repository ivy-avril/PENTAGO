function Pentago9
board = zeros(11);
for i = 1:11
    board(1,i) = 10;
    board(11,i) = 10;
end
for i = 1:11
    board(i,1) = 10;
    board(i,11) = 10;
end
board(1,1) = 11;
board(4,1) = 12;
board(5,1) = 13;
board(7,1) = 14;
board(8,1) = 15;
board(11,1) = 16;
board(11,4) = 17;
board(11,5) = 18;
board(11,7) = 19;
board(11,8) = 20;
board(11,11) = 21;
board(8,11) = 22;
board(7,11) = 23;
board(5,11) = 24;
board(4,11) = 25;
board(1,11) = 26;
board(1,8) = 27;
board(1,7) = 28;
board(1,5) = 29;
board(1,4) = 30;
%Empty board finished!

count = 0;
plot(board);
disp('The diagonal arrows at the corners rotate the central 3-by-3 matrix.');
board = red(board);
plot(board);
board = rotation(board);
plot(board);
count = count+1;
board = blue(board);
plot(board);
board = rotation(board);
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
        if isempty(find(board(2:10,2:10)==0))
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
        if isempty(find(board(2:10,2:10)==0))
            draw = true;
        end
        if checkwin(2,board) && draw==false
            board = rotation(board);
            plot(board);
        end
    end
end
if draw == true
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
disp('Turns to red.');
[x,y] = ginput(1);
while x<0 || x>5500 || y<0 || y>5500
    [x,y] = ginput(1);
end
x = ceil(x/500);
y = ceil(y/500);
while board(y,x) ~= 0 || x == 1 || x == 11 || y == 1 || y == 11
    [x,y] = ginput(1);
    x = ceil(x/500);
    y = ceil(y/500);
end
board(y,x) = 1;
end

%This function helps go one step for blue team --------------------------
function board = blue(board)
disp('Turns to blue.');
[x,y] = ginput(1);
while x<0 || x>5500 || y<0 || y>5500
    [x,y] = ginput(1);
end
x = ceil(x/500);
y = ceil(y/500);
while board(y,x) ~= 0 || x == 1 || x == 11 || y == 1 || y == 11
    [x,y] = ginput(1);
    x = ceil(x/500);
    y = ceil(y/500);
end
board(y,x) = 2;
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
rot9r = imread('rot9rightward.png','png');
rot9l = imread('rot9leftward.png','png');
graph = [];
for i = 1:11
    line = [];
    for j = 1:11
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
            case {12,14,23,25}
                line = [line rotdu];
            case {13,15,22,24}
                line = [line rotud];
            case {17,19,28,30}
                line = [line rotrl];
            case {18,20,27,29}
                line = [line rotlr];
            case {11,21}
                line = [line rot9r];
            case {16,26}
                line = [line rot9l];
        end
    end
    graph = [graph;line];
end
image(graph);
end

%-------------------------- Rotate the board! ---------------------------
function board = rotation(board)
disp('Please rotate the board.');
[x,y] = ginput(1);
while x<0 || x>5500 || y<0 || y>5500
    [x,y] = ginput(1);
end
x = ceil(x/500);
y = ceil(y/500);
while board(y,x) <= 10
    [x,y] = ginput(1);
    x = ceil(x/500);
    y = ceil(y/500);
end
A = [board(2,2:4);board(3,2:4);board(4,2:4)];
B = [board(5,2:4);board(6,2:4);board(7,2:4)];
C = [board(8,2:4);board(9,2:4);board(10,2:4)];
D = [board(2,5:7);board(3,5:7);board(4,5:7)];
E = [board(5,5:7);board(6,5:7);board(7,5:7)];
F = [board(8,5:7);board(9,5:7);board(10,5:7)];
G = [board(2,8:10);board(3,8:10);board(4,8:10)];
H = [board(5,8:10);board(6,8:10);board(7,8:10)];
I = [board(8,8:10);board(9,8:10);board(10,8:10)];
switch board(y,x)
    case {11,16}
        E = rot90(rot90(rot90(E)));
    case 12
        A = rot90(rot90(rot90(A)));
    case 13
        B = rot90(B);
    case 14
        B = rot90(rot90(rot90(B)));
    case 15
        C = rot90(C);
    case 17
        C = rot90(rot90(rot90(C)));
    case 18
        F = rot90(F);
    case 19
        F = rot90(rot90(rot90(F)));
    case 20
        I = rot90(I);
    case {21,26}
        E = rot90(E);
    case 22
        I = rot90(rot90(rot90(I)));
    case 23
        H = rot90(H);
    case 24
        H = rot90(rot90(rot90(H)));
    case 25
        G = rot90(G);
    case 27
        G = rot90(rot90(rot90(G)));
    case 28
        D = rot90(D);
    case 29
        D = rot90(rot90(rot90(D)));
    case 30
        A = rot90(A);
end
for i = 1:3
    for j = 1:3
        board(i+1,j+1) = A(i,j);
        board(i+4,j+1) = B(i,j);
        board(i+7,j+1) = C(i,j);
        board(i+1,j+4) = D(i,j);
        board(i+4,j+4) = E(i,j);
        board(i+7,j+4) = F(i,j);
        board(i+1,j+7) = G(i,j);
        board(i+4,j+7) = H(i,j);
        board(i+7,j+7) = I(i,j);
    end
end
end

%-------------------------- Check win --------------------------
function notwin = checkwin(color,board)

notwin = true;

%Check columns
for i = 2:6
    v = find(board(i,:)==color);
    if ~isempty(v)
        for j = v
            col = find(board((i+1):(i+4),j)~=color);
            if isempty(col)
                notwin = false;
            end
        end
    end
end

%Check rows
for i = 2:6
    v = find(board(:,i)==color);
    if ~isempty(v)
        for j = v
            row = find(board(j,(i+1):(i+4))~=color);
            if isempty(row)
                notwin = false;
            end
        end
    end
end

%Check diagonals
for i = 2:6
    v = find(board(2:6,i)==color);
    if ~isempty(v)
        for j = v
            count = 1;
            for k = 1:4
                if board(i+k,j+1+k)==color
                    count = count+1;
                end
            end
            if count == 5
                notwin = false;
            end
        end
    end
end

for i = 6:10
    v = find(board(2:6,i)==color);
    if ~isempty(v)
        for j = v
            count = 1;
            for k = 1:4
                if board(j+1+k,i-k)==color
                    count = count+1;
                end
            end
            if count == 5
                notwin = false;
            end
        end
    end
end

end
            
