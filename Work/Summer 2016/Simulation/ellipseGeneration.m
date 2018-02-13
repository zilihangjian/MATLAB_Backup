function h = ellipseGeneration(ra, rb, ang, x0, y0, C, Nb)
%function h = ellipseGeneration(ra, rb, ang, x0, y0, C, Nb)
%Inputs:  ra, floating point for the semimajor axis 
%         rb, floating point for the semiminor axis
%         ang, floating point for the ellipse tilt in degrees
%         x0, floating point for the center of the ellipse on the cartesian
%         plane
%         y0, floating point for the center of the ellipse on the cartesian
%         plane
%         C, string representing the color of the ellipse   
%         Nb, integer specifying the number of point to be used while
%         generating the ellipse
%
%Outputs: h, the handle of the ellipse 
%
%Description: This function plots an ellipse with the given semimajor,
%semiminor, tilt, center coordinates, color, and number of points to
%generate the ellipse. More than one ellipse can be plotted at once, if the
%values for ra, rb, and ang are all vectors of the same length. If all
%three input values are of length L, then L ellipses will be created and
%added to the starting coordinates. Also, if ra, rb, and ang are scalar,
%but x0 and y0 are vectors of length M, then M ellipses will be generated
%of the same dimensions at the M different coordinates. The string value
%for the color should follow the same as the plot formatting. This format
%should be 'r', 'b', 'g', or some other specificed RGB value.If no color 
%is specified, it makes automatic use of the colors specified by the axes 
%ColorOrder property. For several circles C may be a vector. The default
%value for Nb is 300. If ra == rb, then a circle will be plotted
%Example ellipse(1,2,45,1,1,'r'), This produces a red ellipse rotated 45
%degrees counterclockwise from the x axis, centered at (1,1).


%Input Arguments
if nargin < 1
  ra = [];
end

if nargin < 2
  rb = [];
end

if nargin < 3
  ang = [];
end

if nargin < 5
  x0 = [];
  y0 = [];
end

if nargin < 6
  C = [];
end

if nargin < 7
  Nb = [];
end

%Default Values for Parameters
if isempty(ra)
    ra = 1;
end
if isempty(rb)
    rb = 1;
end
if isempty(ang)
    ang = 0;
end
if isempty(x0)
    x0 = 0;
end;
if isempty(y0) 
    y0 = 0; 
end
if isempty(Nb)
    Nb = 300;
end
if isempty(C)
    C = get(gca,'colororder');
end

%Variable Sizes
x0 = x0(:);
y0 = y0(:);
ra = ra(:);
rb = rb(:);
ang = ang(:);
Nb = Nb(:);
if ischar(C)
    C = C(:);
end

if length(ra) ~= length(rb),
  error('length(ra) ~= length(rb)');
end;
if length(x0)~=length(y0),
  error('length(x0) ~= length(y0)');
end;

%Number of Ellipses
if length(ra) ~= length(x0)
  maxk = length(ra)*length(x0);
else
  maxk = length(ra);
end

%Generation Loop
for k = 1:maxk
  if length(x0) == 1
    xpos = x0;
    ypos = y0;
    radm = ra(k);
    radn = rb(k);
    
    if length(ang) == 1 
      an = ang;
    else
      an = ang(k);
    end
    
  elseif length(ra) == 1
    xpos = x0(k);
    ypos = y0(k);
    radm = ra;
    radn = rb;
    an = ang;
    
  elseif length(x0) == length(ra)
    xpos = x0(k);
    ypos = y0(k);
    radm = ra(k);
    radn = rb(k);
    an = ang(k);
    
  else
    rada = ra(fix((k-1)/size(x0,1))+1);
    radb = rb(fix((k-1)/size(x0,1))+1);
    an = ang(fix((k-1)/size(x0,1))+1);
    xpos = x0(rem(k-1,size(x0,1))+1);
    ypos = y0(rem(k-1,size(y0,1))+1);
  end

  co = cosd(an);
  si = sind(an);
  the = linspace(0,2*pi,Nb(rem(k-1,size(Nb,1))+1,:)+1);
  h(k) = line(radm*cos(the)*co-si*radn*sin(the)+xpos,radm*cos(the)*si+co*radn*sin(the)+ypos);
  set(h(k),'color',C(rem(k-1,size(C,1))+1,:));
end