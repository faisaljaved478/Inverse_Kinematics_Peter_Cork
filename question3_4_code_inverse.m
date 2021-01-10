% FAISAL JAVED
% RMC Assignment No.05
% Question 3.4

%L() = Link([theeta d a alpha])
% to define type of joint use jointtype()
% qlim function will give boundries of workspace for respective joint

% Step 1 - Defining Links using DH parameters from figure 

a = 90*pi/180;
L(1) = Link([0 0 0 0],'modified');
L(1).jointtype = 'R';
L(1).qlim = [0 2*pi];

L(2) = Link ([0 0 0 -a],'modified');
L(2).jointtype = 'P';
L(2).qlim = [0 20];
RP = SerialLink(L);
RP.name = 'RP Robot';
RP
%Step 3- Calculating position of robot using forward kinematics
T = RP.fkine([0 10])
% Step 4- Putting values from above (T) matrix to find variables using inverse
% kinematics
q = RP.ikine(T,'mask',[0 1 1 0 0 0])
% Step 5 - Verification of variables
Ts = RP.fkine(q)
%Step 6 - Plotting the robot
RP.plot (q)   

     