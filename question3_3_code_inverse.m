% FAISAL JAVED
% RMC Assignment No.05
% Question 3.3

%L() = Link([theeta d a alpha])
% to define type of joint use jointtype()
% qlim function will give boundries of workspace for respective joint
% Step 1 - Defining Links using DH parameters from figure 

L(1) = Link([0 0 0 0],'modified');
L(1).jointtype = 'P';
L(1).qlim = [0 20];

L(2) = Link ([0 0 0 -90*pi/180],'modified');
L(2).jointtype = 'P';
L(2).qlim = [0 20];
PP = SerialLink(L);
PP.name = '2P Robot';
PP
%Step 3- Calculating position of robot using forward kinematics
T = PP.fkine([10 10])
% Step 4- Putting values from above (T) matrix to find variables using inverse
% kinematics
q = PP.ikine(T,'mask',[0 1 1 0 0 0])
% Step 5 - Verification of variables
Ts = PP.fkine(q)
%Step 6 - Plotting the robot
PP.plot (q)   
        