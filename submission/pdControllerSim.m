% Simulation of PD controller described in 6U cubesat paper
function pdControllerSim

% Initial clean-up
clear;
clc;
close all;

% Initial conditions
w0 = [0.3; -0.1; 0.6];
b0 = [0.5; 0.5; 0.5; -0.5];

% Solve ODE
[t, x] = ode45(@pdControllerODE, [0 30], [b0; w0]);

% Plot Euler parameters
figure;
beta = x(:,1:4);
plot(t,beta);
title('Euler Parameters Over Time');
legend('\beta_1','\beta_2','\beta_3','\beta_4');
xlabel('Time (s)');
ylabel('Value');
grid on;

% Plotting angular velocity
figure;
w = x(:,5:7);
plot(t,w);
title('Angular Velocity Over Time');
legend('w_1 (rad/s)','w_2 (rad/s)','w_3 (rad/s)');
xlabel('Time (s)');
ylabel('Angular Velocity (rad/s)');
grid on;

end