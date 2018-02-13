function [] = distributionRandom(N)
figure(); hold on;
point = randi([1,10],1,N);
plot(sort(point(:)),linspace(1,N,N), '.r');
end


