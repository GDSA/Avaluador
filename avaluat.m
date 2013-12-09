Copyright (c) <2013> <Ramon Franquesa Albertí - Carlos Martin Isla - Gonzalo Lopez Lillo - Aleix Gras Godoy>

function OUT = avaluat(evento)

a=strcat('concert');
b=strcat('conference');
c=strcat('exhibition');
d=strcat('fashion');
e=strcat('non_event');
f=strcat('other');
g=strcat('protest');
h=strcat('sports');
i=strcat('theater_dance');

if (strcmpi(evento, a) == 1)
              OUT = 1;
elseif (strcmpi(evento, b) == 1)
              OUT = 2;
elseif (strcmpi(evento, c) == 1)
              OUT = 3;
elseif (strcmpi(evento, d) == 1)
              OUT = 4;
elseif (strcmpi(evento,e) == 1)
              OUT = 5;       
elseif (strcmpi(evento, f) == 1)
              OUT = 6;
elseif (strcmpi(evento, g) == 1)
              OUT = 7;
elseif (strcmpi(evento, h) == 1)
              OUT = 8;       
elseif (strcmpi(evento, i) == 1)
              OUT = 9;
end


end
