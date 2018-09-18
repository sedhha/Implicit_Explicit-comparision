%Submitted by 16BME0099
%Explicit approach
%Since for stable explicit solution lambda value must be less than or equal
%to half we take x-interval as 0.01mm and t interval as 25s giving us
%lambda equal to 0.5. Since we aren't given any certain lambda value.

%% Initializing the variables
tic; %Start the clock
Vo=0; %Initial plate velocity.
Vf=1000; %Converting all units in mm.
yo=0; %initial boundary at y=0mm.
yf=10; %Plate thickness
N=100; %Number of node points.
x=linspace(yo,yf,N); %Creating linearly distributed nodes throughout the length
Vi=ones(N,1)*Vo; %Initial boundary points, velocity values at t=0.
Vt=zeros(N,1); %Operating points at t in certain points.
t=36; %Number of time nodes each node corresponds to every 25s as calculated in notebook.
%Hence 4 nodes means velocities at t=25s, t=50s, t=75s and t=100s.
%% Processing Unit
for i=1:t %Number of node points for time. This decides for how much time we need to calculate
    %velocity values
    for j=2:N-1 %Value of velocity at each node points, since node point 1 and last node points
        %are already defined hence looping from 2 to N-1.
        Vt(j)=Vi(j)+0.5*(Vi(j+1)-(2*Vi(j))+Vi(j-1));
    end
    Vt(1)=Vo; %First and last value remains the same 
    Vt(N)=Vf; %First and last value remains the same
    Vi=Vt; %Updating next loop values from 2-N-1
    %disp(Vt);
    plot(x,Vt,'LineWidth',3); %Plot with LineWidth 3.
    xlabel('Distance in mm.'); %Label x axis
    ylabel('Velocity in mm/s'); %Label y axis
    title('Velocity Vs position curve'); %Title of the graph
    grid on
    pause(0.05); %Create animation effect.
end
toc