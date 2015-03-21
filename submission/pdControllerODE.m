function x_dot = pdControllerODE(t,x)

% Control gains

% Moment of inertia based on isotropic 16kg rectangular prism
Ixx = (1/12)*(16)*(0.239^2 + 0.2797^2);
Iyy = (1/12)*(16)*(0.366^2 + 0.2797^2);
Izz = (1/12)*(16)*(0.366^2 + 0.239^2);

I = [Ixx 0 0; 0 Iyy 0; 0 0 Izz];

kp = 10;
kd = 1;

b0 = x(1);
b1 = x(2);
b2 = x(3);
b3 = x(4);

w1 = x(5);
w2 = x(6);
w3 = x(7);

w = x(5:7);

omega = [0 -w1 -w2 -w3; w1 0 w3 -w2; w2 -w3 0 w1; w3 w2 -w1 0];
beta = [b0; b1; b2; b3];

qd = [1 0 0 0];
qe = quatmultiply(quatinv(qd),beta')
qe = qe';

% Euler parameter kinematics
q_dot = (1/2) * omega * beta;

% Control to push towards qd
u = -kd * [0; w] - kp * qe;

% Dynamics equation
w_dot = -I\cross(w,I*w) + I\u(2:4);

x_dot = [q_dot' w_dot']';

end