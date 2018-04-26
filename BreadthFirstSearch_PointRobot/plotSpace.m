function plotSpace(startPosition,goalPosition,pathVal,jj)
cSpacePoints = [0 0;250 0;250 150;0 150;0 0];
 obstacle1Points = [55 67.5;105 67.5;105 112.5;55 112.5;55 67.5];
 obstacle2Points = [120 55;145 14; 168 14;188 51;165 89;158 51;120 55];
 obstacle3Centre = [180,120];
 osbtacle3radius = 15;
 pos = [obstacle3Centre-osbtacle3radius 2*osbtacle3radius 2*osbtacle3radius];
 plot(startPosition(:,1),startPosition(:,2),'g*');hold on
 plot(goalPosition(:,1),goalPosition(:,2),'r*');hold on
 plot(cSpacePoints(:,1),cSpacePoints(:,2)); hold on
 fill(obstacle1Points(:,1),obstacle1Points(:,2),'r'); hold on
 fill(obstacle2Points(:,1),obstacle2Points(:,2),'r');hold on
 rectangle('Position',pos,'Curvature',[1 1], 'FaceColor', 'red', 'Edgecolor','black');
 for i = jj-1:-1:1
    scatter(pathVal(i,1),pathVal(i,2));hold on  
    pause(0.05)
 end
end