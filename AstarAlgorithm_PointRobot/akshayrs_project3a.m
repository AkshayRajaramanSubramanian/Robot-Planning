clear
clc
tic
startPosition = [25 100];
goalPosition = [125 100];
%closedNode = [positionX positionY parentNode G H F nodeNumber]
%openNode = [positionX positionY parentNode G H F nodeNumber]
openNode = [startPosition 0 0 0 0 1];
closedNode = [0 0 0 0 0 0 0];
ii =1;

while(~isempty(openNode))
    [~,IndexVal] = min(openNode(:,6));
    currentNode = openNode(IndexVal,:);
    openNode(IndexVal,:) = [];
    
    [isGoal,openNode,ii] = move1(currentNode,goalPosition,openNode,closedNode,ii);
    if(isGoal)
        break;
    end
    [isGoal,openNode,ii] = move2(currentNode,goalPosition,openNode,closedNode,ii);
    if(isGoal)
        break;
    end
    [isGoal,openNode,ii] = move3(currentNode,goalPosition,openNode,closedNode,ii);
    if(isGoal)
        break;
    end
    [isGoal,openNode,ii] = move4(currentNode,goalPosition,openNode,closedNode,ii);
    if(isGoal)
        break;
    end
    [isGoal,openNode,ii] = move5(currentNode,goalPosition,openNode,closedNode,ii);
    if(isGoal)
        break;
    end
    [isGoal,openNode,ii] = move6(currentNode,goalPosition,openNode,closedNode,ii);
    if(isGoal)
        break;
    end
    [isGoal,openNode,ii] = move7(currentNode,goalPosition,openNode,closedNode,ii);
    if(isGoal)
        break;
    end
    [isGoal,openNode,ii] = move8(currentNode,goalPosition,openNode,closedNode,ii);
    if(isGoal)
        break;
    end
    closedNode(size(closedNode,1)+1,:)=currentNode;
%     cSpacePoints = [0 0;250 0;250 150;0 150;0 0];
%  obstacle1Points = [55 67.5;105 67.5;105 112.5;55 112.5;55 67.5];
%  obstacle2Points = [120 55;145 14; 168 14;188 51;165 89;158 51;120 55];
%  obstacle3Centre = [180,120];
%  osbtacle3radius = 15;
%  pos = [obstacle3Centre-osbtacle3radius 2*osbtacle3radius 2*osbtacle3radius];
%  plot(startPosition(:,1),startPosition(:,2),'g*');hold on
%  plot(goalPosition(:,1),goalPosition(:,2),'r*');hold on
%  plot(cSpacePoints(:,1),cSpacePoints(:,2)); hold on
%  fill(obstacle1Points(:,1),obstacle1Points(:,2),'r'); hold on
%  fill(obstacle2Points(:,1),obstacle2Points(:,2),'r');hold on
%  rectangle('Position',pos,'Curvature',[1 1], 'FaceColor', 'red', 'Edgecolor','black');
%     scatter(closedNode(size(closedNode,1),1),closedNode(size(closedNode,1),2));hold on;
%      pause(0.005);
end
[~,IndexVal] = min(openNode(:,6));
closedNode(size(closedNode,1)+1,:)=currentNode;
closedNode(size(closedNode,1)+1,:) =[goalPosition currentNode(:,7) 0 0 0 currentNode(:,7)+1];
jj = 1;
newParent = closedNode(size(closedNode,1),7);
pathVal = [];
Nodes = closedNode(:,1:2);
NodesInfo(:,1) = closedNode(:,7);
NodesInfo(:,2) = closedNode(:,3);
NodesInfo(:,3) = zeros([size(closedNode,1) 1]);
NodeSet.Nodes= Nodes;
NodeSet.NodesInfo = NodesInfo;
while(newParent>0)
   tempParameter = closedNode(ismember(closedNode(:,7),newParent),:);
   pathVal(jj,:) = tempParameter(:,1:2);
   newParent = tempParameter(:,3);
   jj = jj+1;
end
toc
plotSpace(startPosition,goalPosition,pathVal,jj);
clear Node
