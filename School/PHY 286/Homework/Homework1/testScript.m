clear
bitStream = round(rand(1,1000));
oneCounter = 0;
zeroCounter = 0;
for i = 1: length(bitStream)
    if bitStream(i) == 1
        oneCounter = oneCounter + 1;
    else
        zeroCounter = zeroCounter + 1;
    end
    
end