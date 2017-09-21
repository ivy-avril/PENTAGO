choice1 = menu('Please choose the size of board:','6*6','9*9');
choice2 = menu('Please choose the mode:','Human to human','Human to computer');
switch choice1
    case 1
        switch choice2
            case 1
                Pentago6;
            case 2
                Pentago6C;
        end
    case 2
        switch choice2
            case 1
                Pentago9;
            case 2
                Pentago9C;
        end
end
