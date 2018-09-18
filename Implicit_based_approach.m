%Submitted by 16BME0099
%IMPLICIT METHOD FOR DISCRITIZATION AND SOLVING PDE
%% Initialize values and matrices
tic; %Start the clock
yo=0; %Value of y at initial boundary
yf=10; %Value of y at final boundary
vo=0; %Velocuty of fluid at y=0
vf=1000; %Velocity of fluid at y=10
n=100;    %Number of node points between y=0 to y=10mm.
Lambda=0.5; %(beta*dt/dx^2) where beta is kinematic viscocity
t_iter=36; %Number of time iterations
x=linspace(0,10,n); %Linear division of nodes
A=full(gallery('tridiag',n,-(Lambda),(1+2*Lambda),-(Lambda))); %Tri-diagonal system of matrix
U=zeros(n,1); %Initial U value matrix Initial conditions
%All values are in zero
U(1)=Lambda*vo; %Initial value is U1t+ (Lambda*U0t)
U(n)=Lambda*vf; %Final value is U5t+(Lambda*U6t) as calculated in notebook
V_mod=zeros(n,1); %Initialized matrix for evaluation

%% Start processing

for i=1:t_iter %Number of time nodes to run loop
    V_mod=linsolve(A,U); %Solving matrix equation
    V_mod(n)=1000; %Velocity of fluid at y=10
    V_mod(1)=0; %Velocity of fluid at y=0
    plot(x,V_mod,'LineWidth',3); %Obtain the plot
    xlabel('Distance in mm.'); %Label x axis
    ylabel('Velocity in mm/s'); %Label y axis
    title('Velocity Vs position curve'); %Title of the graph
    grid on %For grid enabling
    pause(0.05); %Animate
    U=V_mod; %Update the values
end
toc 