function [] = random_selection(N)

rng('shuffle');
slots = [1:N];

while ~isempty(slots)
    disp('Hit a Key');
    pause;
    r = ceil(rand.*length(slots));
    fprintf(1,'You picked slot %d\n',slots(r));
    slots = setdiff(slots, slots(r));
end