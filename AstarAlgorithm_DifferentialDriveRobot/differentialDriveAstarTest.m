% function differentialDriveAstarTest()
clc
clear
tic
startPosition = [1 1 0];
%startPosition = [x y theta];
goalPosition =[4 3 0];

obstacleCoords1 = [1 7;2 7;2 9;1 9];
obstacleCoords2 = [3 7;4 7;4 9;3 9];
obstacleCoords3 = [6 4;8 4;8 6;6 6];
obstacleCoords4 = [10 4;12 4;12 6;10 6];
obstacleCoords5 = [12 9;13 9;13 10;12 10];
obstacleCoords6 = [14 3;15 3;15 6;14 6];
%endPoint = [x y theta]; 
isGoal = 0;
%openNode = [startPoint F G H parentNode NodeNumber vR vL];
%closedNode = [startPoint F G H parentNode NodeNumber vR vL];
openNode = [startPosition 0 0 0 0 1 0 0];
closedNode = [0 0 0 0 0 0 0 0 0 0];
ii=1;
figure();
fill(obstacleCoords1(:,1),obstacleCoords1(:,2),'r');hold on
fill(obstacleCoords2(:,1),obstacleCoords2(:,2),'r');hold on
fill(obstacleCoords3(:,1),obstacleCoords3(:,2),'r');hold on
fill(obstacleCoords4(:,1),obstacleCoords4(:,2),'r');hold on
fill(obstacleCoords5(:,1),obstacleCoords5(:,2),'r');hold on
fill(obstacleCoords6(:,1),obstacleCoords6(:,2),'r');hold on
while(~isGoal)
    [~,IndexVal] = min(openNode(:,4));
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
     
     scatter(closedNode(size(closedNode,1),1),closedNode(size(closedNode,1),2));hold on 
    pause(0.005);
end
closedNode(size(closedNode,1)+1,:)=currentNode;
closedNode(size(closedNode,1)+1,:)=openNode(size(openNode,1),:);
closedNode(size(closedNode,1)+1,:) =[goalPosition 0 0 0 openNode(size(openNode,1),8) max(closedNode(:,8))+1 0 0];
jj = 1;
newParent = closedNode(size(closedNode,1),8);
pathVal = [];
Nodes = closedNode(:,1:2);
NodesInfo(:,1) = closedNode(:,7);
NodesInfo(:,2) = closedNode(:,3);
NodesInfo(:,3) = zeros([size(closedNode,1) 1]);
NodeSet.Nodes= Nodes;
NodeSet.NodesInfo = NodesInfo;
while(newParent>0)
   tempParameter = closedNode(ismember(closedNode(:,8),newParent),:);
   pathVal(jj,1:2) = tempParameter(:,1:2);
   pathVal(jj,3:4) = tempParameter(:,9:10);
   newParent = tempParameter(:,7);
   jj = jj+1;
end
toc
figure();

fill(obstacleCoords1(:,1),obstacleCoords1(:,2),'r');hold on
fill(obstacleCoords2(:,1),obstacleCoords2(:,2),'r');hold on
fill(obstacleCoords3(:,1),obstacleCoords3(:,2),'r');hold on
fill(obstacleCoords4(:,1),obstacleCoords4(:,2),'r');hold on
fill(obstacleCoords5(:,1),obstacleCoords5(:,2),'r');hold on
fill(obstacleCoords6(:,1),obstacleCoords6(:,2),'r');hold on
plot(pathVal(:,1),pathVal(:,2))
% end