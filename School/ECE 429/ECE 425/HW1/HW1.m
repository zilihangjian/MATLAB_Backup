r = audiorecorder(8000, 16, 1);
recordblocking(r,1);
play(r);
x = getaudiodata(r, 'double');
x2 = x*0.2;
keydown = waitforbuttonpress; %#ok<NASGU>
r = audioplayer(x2, 8000);
play(r);
audiowrite('Filter2.wav',x2,8000);
[y, Fs]=audioread('Filter2.wav');
keydown = waitforbuttonpress;
r = audioplayer(y, Fs);