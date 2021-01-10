% FAISAL JAVED
% RMC Assignment No.05
% Question 3.5

%L() = Link([theeta d a alpha])
% to define type of joint use jointtype()
% qlim function will give boundries of workspace for respective joint

% Step 1 - Defining Links using DH parameters from figure 

a = 90*pi/180;
L(1) = Link([0 0 0 0],'modified');
L(1).jointtype = 'R';
L(1).qlim = [0 2*pi];

L(2) = Link ([0 0 0 a],'modified');
L(2).jointtype = 'P';
L(2).qlim = [0 20];

L(3) = Link([0 0 0 -a],'modified');
L(3).jointtype = 'R';
L(3).qlim = [0 2*pi];

RPR = SerialLink(L);
RPR.name = 'RPR Robot';
RPR
%Step 3- Calculating position of robot using forward kinematics
T = RPR.fkine([30*pi/180 10 0])
% Step 4- Putting values from above (T) matrix to find variables using inverse
% kinematics
q = RPR.ikine(T,'mask',[1 1 1 0 0 0])
% Step 5 - Verification of variables
Ts = RPR.fkine(q)
%Step 6 - Plotting the robot
RPR.plot (q)


