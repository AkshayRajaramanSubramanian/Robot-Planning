function [isGoal,openNode,ii] = move2(currentNode,goalPosition,openNode,closedNode,ii)
currentPosition = currentNode(:,1:3);
isGoal = 0;
threshold  = 0.2;
[X,Y,theta] = calculateNewPose(currentPosition(:,1),currentPosition(:,2),currentPosition(:,3),10,10);
newPosition(:,1:3) = [X,Y,theta];
calculatedH = pdist([newPosition(:,1:2);goalPosition(:,1:2)],'euclidean');
if(calculatedH <= threshold)
     isGoal = 1;
else
     isGoal = 0;
end
if(inCSpace(newPosition(:,1:2)) && outObstacle(newPosition(:,1:2)))
   calculatedG = currentNode(:,5)+pdist([newPosition(:,1:2);currentNode(:,1:2)]);
   calculatedF = calculatedG + calculatedH;
   isOpenmemberOutput = ismember(openNode(:,1:2),newPosition(:,1:2),'rows');
   isClosedmemberOutput = ismember(closedNode(:,1:2),newPosition(:,1:2),'rows');
   if((isempty(isOpenmemberOutput) || any(isOpenmemberOutput)~=1)&&(isempty(isClosedmemberOutput) || any(isClosedmemberOutput)~=1))
         openNode(size(openNode,1)+1,:)= [newPosition(:,1) newPosition(:,2) newPosition(:,3) calculatedF calculatedG calculatedH currentNode(:,8) ii+1 10 10];
         ii=ii+1;
    elseif(any(isOpenmemberOutput)~=1 && any(isOpenmemberOutput)==1)
        correspondingClosedNode = closedNode(ismember(closedNode(:,1:2),newPosition(:,1:2),'rows'),:);
        if(calculatedF<correspondingClosedNode(:,4))
            openNode(size(openNode,1)+1,:)= [newPosition(:,1) newPosition(:,2) newPosition(:,3) calculatedF calculatedG calculatedH currentNode(:,8) ii+1 10 10];
            ii=ii+1;
        end
    elseif(any(isOpenmemberOutput)==1)
        correspondingOpenNode = openNode(ismember(openNode(:,1:2),newPosition(:,1:2),'rows'),:);
        if(calculatedF<correspondingOpenNode(:,4))
            openNode(size(openNode,1)+1,:)= [newPosition(:,1) newPosition(:,2) newPosition(:,3) calculatedF calculatedG calculatedH currentNode(:,8) ii+1 10 10];
            ii=ii+1;
        end
    end   
end
end