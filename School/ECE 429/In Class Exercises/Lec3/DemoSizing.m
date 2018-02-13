rgbImage = imread('Miami_Brick.jpg');
%    1. Create a scroll panel.
hFig = figure('Toolbar','none',...
    'Menubar','none');
hIm = imshow(rgbImage);
hSP = imscrollpanel(hFig,hIm);
set(hSP,'Units','normalized',...
    'Position',[0 .1 1 .9])
% 2. Add a Magnification Box and an Overview tool.
hMagBox = immagbox(hFig,hIm);
pos = get(hMagBox,'Position');
set(hMagBox,'Position',[0 0 pos(3) pos(4)])
imoverview(hIm)
% 3. Get the scroll panel API to programmatically control the view.
api = iptgetapi(hSP);
% 4. Get the current magnification and position.
mag = api.getMagnification();
r = api.getVisibleImageRect();
% 5. View the top left corner of the image.
api.setVisibleLocation(0.5,0.5)
% 6. Change the magnification to the value that just fits.
api.setMagnification(api.findFitMag())
% 7. Zoom in to 1600% on the dark spot.
api.setMagnificationAndCenter(16,306,800)