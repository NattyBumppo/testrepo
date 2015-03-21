close all;
clear;
clc;

% Plant
s = tf('s');
plant = 1/(s^2 + 10*s + 20);
figure;
step(plant);

kp = 20;
ki = 0;
kd = 0;
controller = (kp + ki/s + kd*s);
closedLoop = feedback(plant, controller);
figure;
step(closedLoop);