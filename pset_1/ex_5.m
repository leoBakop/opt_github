clc, clear
x=0.01:.01:10;
a=[-2,0.5,2];
i=1
figure(i)
i=i+1;

for j = a
    f_x=x.^j;
    hold on;
    plot(x,f_x)
    axis([0,10,0,70])    
end
    legend('a=-2', 'a=0.5', 'a=2')
