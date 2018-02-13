%{
Brandon Santori - 104592662
section - 306
Kody Newman - 105939651
section - 303
Ioana Fleming
CSCI 1320
%}

classdef Star
    %Star Class - creates randomly generated stars for the univers
    
    properties % initializes all the properties of a star
        
        type;
        name;
        radius;
        temperature;
        color;
        system;
        appearance;
        numPlanets;
        mass;
        %pAlts;
        x;
        y;
    end
    
    methods
        function obj = Star(starCoordList,sys) % assigns values to these properties
            obj.type = randType;
            obj.name = randSunName(obj.type);
            obj.radius = randRadius(obj.type);
            obj.temperature = sunTemp(obj.type);
            obj.color = sunColor(obj.temperature,obj.type);
            [obj.x,obj.y] = starCoords(starCoordList);
            obj.appearance = sunTex(obj.color,obj.type);
            obj.numPlanets = amtPlanets;
            %obj.pAlts = orbitalAltitude(obj.radius,obj.numPlanets);
            obj.system = sys;
            obj.mass = sunMass(obj.type,obj.radius,obj.temperature);
            
        end
    end
    
end

