

function img = sunTex(color,type)
img = zeros(100,100,3);

if type == 'black'  % creates a very basic black hole texture
    for i = 1:100
        for j = 1:100
            for k = 1:3
                col = randi([1,80]);
                if col == 1
                    img(i,j,1) = 5;
                    img(i,j,2) = 80 + randi([-10,10]);
                    img(i,j,3) = 80 + randi([-10,10]);
                else
                    img(i,j,k) = 15 + randi([-8,8]);
                end
            end
        end
    end
    img = img/255;
else
    for i = 1:100 %creates a noise texture for a star based on its color
        for j = 1:100
            for k = 1:3
                img(i,j,k) = color(k)./255+rand/10;
                if img(i,j,k)<0
                    img(i,j,k) = 0;
                elseif img(i,j,k)>1
                    img(i,j,k) = 1;
                end
            end
        end
    end
    img = img + .1; %adjusts brightness to better represent a star
end


%[x,y,z] = sphere(30);
%I=img;
%warp(x,y,z,I);