comm = serial('COM3','BaudRate',9600); 
fopen(a);
x=linspace(1,100);
   
for i=1:length(x)
	y(i)=fscanf(arduino,'%d');
end
	
fclose(arduino);
disp('making plot..')
plot(x,y);