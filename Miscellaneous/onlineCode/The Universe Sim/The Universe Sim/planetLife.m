%randomly decides if a planet has life based on its type, atmosphere, and
%having water



function life = planetLife(type,atmo,water)

%initializes life to 0
life = 0;
if type == 'rock'
    if atmo > 1 && water > 0
        if rand([1,2]) == 1
            life = 1;
        end
    end
end