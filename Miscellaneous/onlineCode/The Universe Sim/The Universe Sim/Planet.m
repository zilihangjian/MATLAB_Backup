

classdef Planet
    %Planet class - Creates a randomly generated planet for the star
    
    properties
        system;
        name;
        type;
        mass;
        radius;
        orbitAlt;
        temperature;
        atmosphere;
        life;
        water;
        special;
        year;
        day;
        numMoons;
        texture;
        albedo;
        
    end
    
    methods
        function obj = Planet(sun,sys,i,pAlts) % functions not all created to generate the planets yet
            if nargin > 0
                obj.system = sys;
                obj.name = randPlanetName;
                obj.type = randTypeP;
                obj.radius = randRadiusP(obj.type);
                obj.mass = planetMass(obj.type,obj.radius);
                %obj.orbitAlt = sun.pAlts(i);
                obj.orbitAlt = orbitalAltitude(sun.radius,sun.numPlanets,sun.mass,obj.radius,obj.mass,pAlts);
                obj.atmosphere = pAtmosphere(obj.type);
                obj.water = planetWater(obj.type,obj.atmosphere);
                obj.life = planetLife(obj.type,obj.atmosphere,obj.water);
                obj.special;
                obj.year = yearlength(sun.mass,obj.orbitAlt);
                obj.day = daylength;
                obj.numMoons = numMoons();
                obj.texture = planTex(obj.type,obj.water,obj.life,obj.atmosphere);
                obj.albedo = planAlbedo(obj.texture);
                obj.temperature = planetTemp(obj.orbitAlt,sun.temperature,obj.atmosphere,sun.radius,obj.albedo);
                if obj.temperature < -272 % makes sure the temp isnt below absolute 0
                    obj.temperature = -272;
                end
                if(obj.temperature(1) > 100 || obj.temperature(1)<0) %water is dependent on temp so if the temp isnt in the range for water, redraws with no water
                    obj.water = 0;
                    obj.texture = planTex(obj.type,obj.water,obj.life,obj.atmosphere);
                end
            end
        end
    end
    
end

