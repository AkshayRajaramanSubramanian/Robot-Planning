function [isGoal,openNode,ii] = move4(currentNode,goalPosition,openNode,closedNode,ii)
currentPosition = currentNode(:,1:2);
isGoal = 0;
newPosition = [currentPosition(:,1)+1 currentPosition(:,2)-1];
calculatedH = getDistance(newPosition,goalPosition);
if(isequal(newPosition,goalPosition))
     isGoal = 1;
else
     isGoal = 0;
end
 if(inCSpace(newPosition) && outObstacle1(newPosition) && outObstacle2(newPosition)&& outObstacle3(newPosition))
    calculatedG = currentNode(:,4)+1.4;
    calculatedF = calculatedG + calculatedH;
    isOpenmemberOutput = ismember(openNode(:,1:2),newPosition,'rows');
    isClosedmemberOutput = ismember(closedNode(:,1:2),newPosition,'rows');
    if((isempty(isOpenmemberOutput) || any(isOpenmemberOutput)~=1)&&(isempty(isClosedmemberOutput) || any(isClosedmemberOutput)~=1))
         openNode(size(openNode,1)+1,:)= [newPosition currentNode(:,7) calculatedG calculatedH calculatedF ii+1];
         ii=ii+1;
    elseif(any(isOpenmemberOutput)~=1 && any(isOpenmemberOutput)==1)
        correspondingClosedNode = closedNode(ismember(closedNode(:,1:2),newPosition,'rows'),:);
        if(calculatedF<correspondingClosedNode(:,6))
            openNode(size(openNode,1)+1,:)= [newPosition currentNode(:,7) calculatedG calculatedH calculatedF ii+1];
            ii=ii+1;
        end
    elseif(any(isOpenmemberOutput)==1)
        correspondingOpenNode = openNode(ismember(openNode(:,1:2),newPosition,'rows'),:);
        if(calculatedF<correspondingOpenNode(:,6))
            openNode(size(openNode,1)+1,:)= [newPosition currentNode(:,7) calculatedG calculatedH calculatedF ii+1];
            ii=ii+1;
        end
    end 
 end
 
end