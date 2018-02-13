%Big project 2
%Egor Iuravin
close all
clc

%Initial data
L=70;%Length
W=70;%Width
original = zeros(L,W);

xt1=4+20;
xt2=8+20;
xt3=6+20;
xt4=9+20;
xt5=3+20;
xt6=6+20;
xt7=4+20;
xt8=8+20;
xt9=5+20;
xt10=7+20;

Yt1=3+20;
Yt2=3+20;
Yt3=5+20;
Yt4=6+20;
Yt5=6+20;
Yt6=8+20;
Yt7=7+20;
Yt8=7+20;
Yt9=8+20;
Yt10=8+20;

original(Yt1,xt1)=50;
original(Yt2,xt2)=50;
original(Yt3,xt3)=50;
original(Yt4,xt4)=50;
original(Yt5,xt5)=50;
original(Yt6,xt6)=50;
original(Yt7,xt7)=50;
original(Yt8,xt8)=50;
original(Yt9,xt9)=50;
original(Yt10,xt10)=50;

%Plot original image
figure()
image(original)
xlabel('Width, meters')
ylabel('Length, meters')
title('Target scene arrangement')
%Transmitted signal
txsig=[-1 -1 1 1 1 1 1 1 -1 -1 1 1 -1 1 -1 -1];
tmax=2*sqrt(L^2+W^2)/3e8;
t1=2*sqrt(xt1^2+Yt1^2)/3e8;
t2=2*sqrt(xt2^2+Yt2^2)/3e8;
del_t=t2-t1;
tline=0:6e-12:tmax;
NT=max(size(tline));
Step=7;
Maxsize=70;


%%First target point (xt1,yt1)
%figure()
rxk1=zeros(10,NT);
i=0;
for k=1:Step:Maxsize
    if i<10
        i=i+1;
    end
    tk=2*sqrt((xt1-k)^2+Yt1^2)/3e8;
    tnew=abs(tline-tk);
    xind=find(tnew==min(tnew));
    theta=atand(Yt3/(xt3-k));
    c=cosd(theta)^2;
    rxk1(i,:) = [zeros(1,xind-1) txsig zeros(1, NT-xind-15)];
    %subplot(10,1,i)
    %plot(rxk1(i,:))
end


%%Second target point (xt2,yt2)

i=0;
rxk2=zeros(10,NT);
%figure()
for k=1:Step:Maxsize
    if i<10
        i=i+1;
    end
    tk=2*sqrt((xt2-k)^2+Yt2^2)/3e8;
    tnew=abs(tline-tk);
    xind=find(tnew==min(tnew));
    theta=atand(Yt3/(xt3-k));
    c=cosd(theta)^2;
    rxk2(i,:) = [zeros(1,xind-1) txsig zeros(1, NT-xind-15)];
    %subplot(10,1,i)
    %plot(rxk2(i,:))
end

%%Third target point (xt3,yt3)

i=0;
rxk3=zeros(10,NT);
%figure()
for k=1:Step:Maxsize
    if i<10
        i=i+1;
    end
    tk=2*sqrt((xt3-k)^2+Yt3^2)/3e8;
    tnew=abs(tline-tk);
    xind3=find(tnew==min(tnew));
    theta=atand(Yt3/(xt3-k));
    c=cosd(theta)^2;
    rxk3(i,:) = [zeros(1,xind3-1) txsig zeros(1, NT-xind3-15)]*c;
    %subplot(10,1,i)
    %plot(rxk3(i,:))
end


%%Fourth target point (xt4,yt4)

i=0;
rxk4=zeros(10,NT);
%figure()
for k=1:Step:Maxsize
    if i<10
        i=i+1;
    end
    tk=2*sqrt((xt4-k)^2+Yt4^2)/3e8;
    tnew=abs(tline-tk);
    xind=find(tnew==min(tnew));
    rxk4(i,:) = [zeros(1,xind-1) txsig zeros(1, NT-xind-15)];
    %subplot(10,1,i)
    %plot(rxk4(i,:))
end

%%Fifth target point (xt5,yt5)
i=0;
rxk5=zeros(10,NT);
%figure()
for k=1:Step:Maxsize
    if i<10
        i=i+1;
    end
    tk=2*sqrt((xt5-k)^2+Yt5^2)/3e8;
    tnew=abs(tline-tk);
    xind=find(tnew==min(tnew));
    rxk5(i,:) = [zeros(1,xind-1) txsig zeros(1, NT-xind-15)];
    %subplot(10,1,i)
    %plot(rxk5(i,:))
end

%%Sixth target point (xt6,yt6)

i=0;
rxk6=zeros(10,NT);
%figure()
for k=1:Step:Maxsize
    if i<10
        i=i+1;
    end
    tk=2*sqrt((xt6-k)^2+Yt6^2)/3e8;
    tnew=abs(tline-tk);
    xind=find(tnew==min(tnew));
    rxk6(i,:) = [zeros(1,xind-1) txsig zeros(1, NT-xind-15)];
    %subplot(10,1,i)
    %plot(rxk6(i,:))
end

%%Seventh target point (xt7,yt7)

i=0;
rxk7=zeros(10,NT);
%figure()
for k=1:Step:Maxsize
    if i<10
        i=i+1;
    end
    tk=2*sqrt((xt7-k)^2+Yt7^2)/3e8;
    tnew=abs(tline-tk);
    xind=find(tnew==min(tnew));
    rxk7(i,:) = [zeros(1,xind-1) txsig zeros(1, NT-xind-15)];
    %subplot(10,1,i)
    %plot(rxk7(i,:))
end

%%Eighth target point (xt8,yt8)

i=0;
rxk8=zeros(10,NT);
%figure()
for k=1:Step:Maxsize
    if i<10
        i=i+1;
    end
    tk=2*sqrt((xt8-k)^2+Yt8^2)/3e8;
    tnew=abs(tline-tk);
    xind=find(tnew==min(tnew));
    rxk8(i,:) = [zeros(1,xind-1) txsig zeros(1, NT-xind-15)];
    %subplot(10,1,i)
    %plot(rxk8(i,:))
end

%%Nineth target point (xt9,yt9)

i=0;
rxk9=zeros(10,NT);
%figure()
for k=1:Step:Maxsize
    if i<10
        i=i+1;
    end
    tk=2*sqrt((xt9-k)^2+Yt9^2)/3e8;
    tnew=abs(tline-tk);
    xind=find(tnew==min(tnew));
    rxk9(i,:) = [zeros(1,xind-1) txsig zeros(1, NT-xind-15)];
    %subplot(10,1,i)
    %plot(rxk9(i,:))
end

%%Tenth target point (xt10,yt10)

i=0;
rxk10=zeros(10,NT);
%figure()
for k=1:Step:Maxsize
    if i<10
        i=i+1;
    end
    tk=2*sqrt((xt10-k)^2+Yt10^2)/3e8;
    tnew=abs(tline-tk);
    xind=find(tnew==min(tnew));
    rxk10(i,:) = [zeros(1,xind-1) txsig zeros(1, NT-xind-15)];
    %subplot(10,1,i)
    %plot(rxk10(i,:))
end


%Total matrix
rxp_tot=zeros(10,NT);
figure()
for g=1:10
    rxp_tot(g,:)=rxk1(g,:)+rxk2(g,:)+rxk3(g,:)+rxk4(g,:)+rxk5(g,:)+rxk6(g,:)+rxk7(g,:)+rxk8(g,:)+rxk9(g,:)+rxk10(g,:);
    subplot(10,1,g)
    plot(rxp_tot(g,:))
end
keyboard


% Autocorrelation
figure()
rxcomp=zeros(10,2*NT-1);
% sigma = 1; %noise standard deviation
% yy =sigma*randn(size(rxcomp));
for tt=1:10
    rxcomp(tt,:)=xcorr(rxp_tot(tt,:),txsig);%yy(tt,:);
    subplot(10,1,tt)
    plot(rxcomp(tt,((length(rxcomp)+1)/2):end))
end
rxcomp(:,1:NT-1) = [];

%Image plot
grid = zeros(L,W);
sum=0;
tk=0;
i=0;
for m=1:W
    for n=1:L
        for j=1:Step:Maxsize
            if i<10
                i=i+1;
            end
            tk=2*sqrt((m-j)^2+n^2)/3e8;
            [x,y]=find(tline>=tk,1,'first');
            %y=interp1(tline,rxcomp(i,:),tk);
            store=rxcomp(i,y);
            sum=sum+store;
        end
        grid(n,m)=sum;
        sum=0;
        i=0;
    end
    
end
figure()
image(grid)
keyboard
%Image plot after threshold was applied
th=45;
for m=1:W
    for n=1:L
        if grid(n,m)<th
            grid(n,m)=0;
        end
        
    end
    
end
figure()
image(grid)

%Target identification

Noise_1= randn(L,W,1);
Target=double(grid)+Noise_1;
Target_Noise_id=xcorr2(Target,Noise_1);
figure();
surf(Target_Noise_id)
shading interp
title('Target identification in noise')
xlabel('Cross Range')
ylabel('Range')
zlabel('Amplitude of the Signal')


Target_id=xcorr2(Target,Target);
figure();
surf(abs(Target_id))
shading 'interp'
title('Target only')
xlabel('Cross Range')
ylabel('Range')
zlabel('Amplitude of the Signal')

figure();
Noise_2=randn(L,W,1);
Noise_Id=xcorr2(Noise_1,Noise_2);
surf(abs(Noise_Id))
shading 'interp'
title('Noise only')
xlabel('Cross Range')
ylabel('Range')
zlabel('Amplitude of the Signal')