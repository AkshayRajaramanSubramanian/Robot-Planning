function [isGoal,Node]= move2(currentPosition,Node,ii,goalPosition)
    newPosition = [currentPosition(:,1)+1 currentPosition(:,2)+1];
    if(inCSpace(newPosition) && outObstacle1(newPosition) && outObstacle2(newPosition)&& outObstacle3(newPosition))
        if(~ismember(newPosition,Node(:,1:2),'rows'))
            Node(size(Node,1)+1,:) = [newPosition,ii,size(Node,1)+1];
            if(isequal(newPosition,goalPosition))
                isGoal = 1;
            else
                isGoal = 0;
            end
        else
            isGoal = 0;
         end
    else
        isGoal = 0;
    end
end