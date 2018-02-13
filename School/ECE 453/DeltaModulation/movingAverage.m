function [filtVect] = movingAverage(vector, size,time)
% function [filtVect] = movingAverage(vector, size,time)

if ~mod(size,2) || size == 1
    error('Invalid Filter Size');
end

indexPoint = floor(size/2);%Number of iterations to go from start point
startPoint = indexPoint + 1;%Center point of filter at each iteration
filtVect = vector;
filtVect(indexPoint:end-indexPoint+1) = 0;
for j = 1:length(vector)
    if j < startPoint
        filtVect(j) = sum(vector((j:(j+size-1))))/size;
    elseif j > (length(vector) - (startPoint + 1))
        filtVect(j) = sum(vector((j-size+1):j))/size;
    else
        filtVect(j) = sum(vector((j-indexPoint):(j+indexPoint)))/size;
    end
end

figure()
plot(time, vector);
hold on
plot(time, filtVect);
title('Moving Averaged Signal')
xlabel('Time')
ylabel('Signal Amplitude')
end

