Copyright (c) <2013> <Ramon Franquesa Albertí - Carlos Martin Isla - Gonzalo Lopez Lillo - Aleix Gras Godoy>

function [name class] = spacecuter (str)
    s = char(str);
    n = find(s < char (33));
    name = s(1:n(1)-1);
    class = s(n(length(n))+1:length(s));
    
end
