% FAISAL JAVED
% RMC Assignment No.05
% Question 3.2

%L() = Link([theeta d a alpha])
% to define type of joint use jointtype()
% qlim function will give boundries of workspace for respective joint
% Step 1 - Defining Links using DH parameters from figure 

a = 90*pi/180;
L(1) = Link([0 0 0 0],'modified');
L(1).jointtype = 'R';
L(1).qlim = [0 2*pi];

L(2) = Link([0 0 10 0],'modified');
L(2).jointtype = 'R';
L(2).qlim = [-a a];

L(3) = Link([0 0 20 0],'modified');
L(3).jointtype = 'R';
L(3).qlim = [0 2*pi];

%Step 2 - Combining all links
RRR = SerialLink(L);
RRR.name = 'RRR Robot';
RRR

%Step 3- Calculating position of robot using forward kinematics
T = RRR.fkine([30*pi/180 20*pi/180 0])
% Step 4- Putting values from above (T) matrix to find theetas using inverse
% kinematics
q = RRR.ikine(T,'mask',[1 1 1 0 0 0])
% Step 5 - Verification of variables
Ts = RRR.fkine(q)


%Step 6 - Plotting the robot

RRR.plot(q)
