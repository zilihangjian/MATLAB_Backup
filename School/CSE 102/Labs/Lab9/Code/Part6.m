clc; close all; clear;
airport = imread('marion_airport.tif');
figure(1); imshow(airport); title('Original');
air_rotate = imrotate(airport,33,'crop');
air_binary = edge(air_rotate,'canny');
[H,T,R] = hough(air_binary);
figure(2); 
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

peaks = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(peaks(:,2)); y = R(peaks(:,1));
plot(x,y,'s','color','white');

lines = houghlines(air_binary,T,R,peaks,'FillGap',5,'MinLength',7);
figure, imshow(air_rotate), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end