% FAISAL JAVED
% RMC Assignment No.05
% Question 3.10

%L() = Link([theeta d a alpha])
% to define type of joint use jointtype()
% qlim function will give boundries of workspace for respective joint
% Step 1 - Defining Links using DH parameters from figure 

a = 90*pi/180;
L(1) = Link([0 0 0 0],'modified');
L(1).jointtype = 'R';
L(1).qlim = [0 2*pi];

L(2) = Link([0 0 8 -a],'modified');
L(2).jointtype = 'R';
L(2).qlim = [0 2*pi];

L(3) = Link([a -2 8 0],'modified');
L(3).jointtype = 'R';
L(3).qlim = [0 2*pi];

L(4) = Link([0 8 0 -a],'modified');
L(4).jointtype = 'R';
L(4).qlim = [0 2*pi];

L(5) = Link([-a 0 0 -a],'modified');
L(5).jointtype = 'R';
L(5).qlim = [0 2*pi];

L(6) = Link([0 10 0 a],'modified');
L(6).jointtype = 'R';
L(6).qlim = [0 2*pi];

%Step 2 - Combining all links
P260 = SerialLink(L);
P260.name = 'PUMA 260';
P260

%Step 3- Calculating position of robot using forward kinematics
T = P260.fkine([0 0 0 0 0 0])
% Step 4- Putting values from above (T) matrix to find theetas using inverse
% kinematics
q = P260.ikine(T,'mask',[1 1 1 0 0 0])
% Step 5 - Verification of variables
Ts = P260.fkine(q)
%Step 6 - Plotting the robot
P260.plot (q)
