%Copyright (c) 2013   Ramon Franquesa Alberti, Carlos Martin Isla , Gonzalo Lopez Lillo , Aleix Gras Godoy 


function c = classidentify (C)
    l = length(C);
    switch l
        case 5      %other
            c = 6;  %Class 1
            
        case 6      %
            c = 8;  %Class 2 sports
        case 7     
            if C(1) == 'p'
                c = 7;  %Class 9 protest
            elseif C(1) == 'f'
                c = 4;  %Class 8 fashion
            else
                c = 1;  %Class 3 concert
            end
        case 9      %non_event
            c = 5;  %Class 4
        case 10     %conference/exhibition
            if (C(1)=='c')
                c = 2;  %Class 5 confere
            else
                c = 3;  %Class 6 exhibit
            end
        case 13     %theater_dance
            c = 9;  %Class 7
    end

end
