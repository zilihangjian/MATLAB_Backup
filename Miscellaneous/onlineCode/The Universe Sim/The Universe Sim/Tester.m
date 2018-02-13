

function [water,temp] = Tester() % test function to ensure that sun and planet generation works

suntype = randType;
sunname = randSunName(suntype);
sunradius = randRadius(suntype);
sunt = sunTemp(suntype);
suncolor = sunColor(sunt,suntype);
sunmass = sunMass(suntype,sunradius,sunt);
sunamt = amtPlanets;
    
ptype = randTypeP;
pradius = randRadiusP;
pmass = planetMass(ptype,pradius);
alt = orbitalAltitude(sunradius,sunamt);
atm = pAtmosphere(ptype);
temp = planetTemp(alt(1),sunt,atm,sunradius,.4);
water = planetWater(ptype,temp);
dayl = daylength;
yearl = yearlength(sunmass,alt);
end

