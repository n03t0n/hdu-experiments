clear;clc;close all;
fc=1000;
ap=1;as=10;fp=100;fs=150;
wp=2*pi*fp/fc;
ws=2*pi*fs/fc;
Wanp=wp*fc;
Wans=ws*fc;
[N,Wanc]=buttord(Wanp,Wans,ap,as,'s');
[b,a]=butter(N,Wanc,'s');
[B1,A1]=impinvar(b,a,fc);   
[H1,w]=freqz(B1,A1,'whole');
subplot(2,1,1);
plot(w/pi,20*log10(abs(H1)));grid on;
axis([0,2,-60,0]);xlabel('pi');ylabel('H1幅值dB');
title('冲激响应不变法设计的数字低通IIR滤波器');
subplot(2,1,2);
plot(w/pi,angle(H1));
xlabel('频率(rad)');ylabel('相位(弧度)');grid on;