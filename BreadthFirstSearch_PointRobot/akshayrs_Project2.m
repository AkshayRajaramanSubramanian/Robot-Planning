clear
clc
tic
startPosition = [20 20];
goalPosition = [30 30];
%Node = [positionX positionY parentNode nodeNumber]
Node = [startPosition,0,1];
isGoal = 0;
ii= 1;
while(~isGoal)
    currentPosition = Node(ii,1:2)
    [isGoal,Node]= move1(currentPosition,Node,ii,goalPosition);
    if(isGoal == 1)
        break;
    end
    [isGoal,Node] = move2(currentPosition,Node,ii,goalPosition);
    if(isGoal == 1)
        break;
    end
    [isGoal,Node]= move3(currentPosition,Node,ii,goalPosition);
    if(isGoal == 1)
        break;
    end
    [isGoal,Node]= move4(currentPosition,Node,ii,goalPosition);
    if(isGoal == 1)
        break;
    end
    [isGoal,Node]= move5(currentPosition,Node,ii,goalPosition);
    if(isGoal == 1)
        break;
    end
    [isGoal,Node]= move6(currentPosition,Node,ii,goalPosition);
    if(isGoal == 1)
        break;
    end
    [isGoal,Node]= move7(currentPosition,Node,ii,goalPosition);
    if(isGoal == 1)
        break;
    end
    [isGoal,Node]= move8(currentPosition,Node,ii,goalPosition);
    if(isGoal == 1)
        break;
    end
    ii = ii+1;
end
jj = 1;
newParent = size(Node,1);
pathVal = [];
Nodes = Node(:,1:2);
NodesInfo(:,1) = Node(:,4);
NodesInfo(:,2) = Node(:,3);
NodesInfo(:,3) = zeros([size(Node,1) 1]);
NodeSet.Nodes= Nodes;
NodeSet.NodesInfo = NodesInfo;
while(newParent>0)
   pathVal(jj,:) = Node(newParent,1:2);
   newParent = Node(newParent,3);
   jj = jj+1;
end
plotSpace(startPosition,goalPosition,pathVal,jj);
clear Node
toc