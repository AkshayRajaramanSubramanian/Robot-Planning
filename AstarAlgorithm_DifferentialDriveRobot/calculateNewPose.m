function [X,Y,theta] = calculateNewPose(x,y,thetaprev,vR,vL)
l = 0.354;
r = 0.038;
R = (l/2)*(vL+vR)/(vR-vL);
timestep = 1000;
vL = vL*6;
vR = vR*6;
if(vR ~= vL)
omega = (vR+vL)/l;
ICC = [x-(R*sind(thetaprev));(y+R*(cosd(thetaprev)))];
output= ([cosd(omega*timestep) -sind(omega*timestep) 0;sind(omega*timestep) cosd(omega*timestep) 0;0 0 1]*[x-ICC(1,:);y-ICC(2,:);thetaprev])+[ICC(1,:);ICC(2,:);omega*timestep];
X = output(1,:);
Y = output(2,:);
theta = output(3,:);
else
  X = x+(vR*cosd(thetaprev)*timestep);
Y = y+(vR*sind(thetaprev)*timestep);
theta = thetaprev; 
end
X = round(X,2);
Y = round(Y,2);
end