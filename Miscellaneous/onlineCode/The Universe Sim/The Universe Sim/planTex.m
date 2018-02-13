%creates planet textures using thier type,atmosphere, and whether they have
%water/life



function outImg = planTex(type,water,life,atmosphere)
%atmosphere
outImg = zeros(100,100,3);
if type == 'gass' % defines surface of gas planets
    color = [randi([30,230]),randi([30,230]),randi([30,230])];
    color2 = [color(1) + randi([-20,20]),color(2) + randi([-20,20]),color(2) + randi([-20,20])];
    color3 = (uint8([color(1) + randi([-20,20]),color(2) + randi([-20,20]),color(2) + randi([-20,20])]))/255;
    for i = 1:100
        for j = 1:100
            for k = 1:3
                outImg(i,j,k) = (color(k) + randi([0,15]))/255; % creates base color of planet
            end
        end
    end
    for i = 0:randi([0,5]) % creates colored bands for gas giant planets
        for j = 1:3
            stripeY = randi([1,95]);
            thickness = randi([1,5]);
            outImg(stripeY:(stripeY + thickness),:,j) = (color2(j) + randi([0,10]))/255;
        end
    end
    for i = 0:randi([0,3])
        
        weatherX = randi([5,90]); %adds spots representing storms (SEE JUPITER GREAT RED SPOT)
        weatherY = randi([5,90]);
        weatherR = randi([2,5]);
        outImg = insertShape(outImg, 'FilledCircle', [weatherX weatherY weatherR],'color',color3);
        
    end
    
else % defines surfaces of rocky planets
    if water == 1
        outImg = zeros(100,200,3);
        baseColor = [randi([30,100]),randi([30,100]),randi([180,230])];
        for i = 1:100
            for j = 1:200
                for k = 1:3
                    outImg(i,j,k) = (baseColor(k) + randi([0,15]))/255; % creates base color of planet
                end
            end
        end
        outImg = landify(outImg,1,baseColor,life); % calls function to create texture using specific qualities of the planet
    else
        if randi([1,5]) == 1
            baseColor = [randi([30,150]),randi([30,200]),randi([30,220])];
        else
            baseColor = [randi([30,220]),randi([30,100]),randi([30,100])];
        end
        for i = 1:100
            for j = 1:100
                for k = 1:3
                    outImg(i,j,k) = (baseColor(k) + randi([0,15]))/255; % creates base color of planet
                end
            end
        end
        outImg = landify(outImg,0,baseColor,life);
    end
    if atmosphere >0 
        outImg = cloudify(outImg,atmosphere); % if the planet has an atmosphere, adds clouds
    end
    outImg = outImg - .1;
end
    planAlbedo(outImg); 
    
%[x,y,z] = sphere(30);
%I=outImg;
%warp(x,y,z,I);   