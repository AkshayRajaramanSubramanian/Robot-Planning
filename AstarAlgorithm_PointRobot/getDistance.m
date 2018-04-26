function distance = getDistance(currentNode,newNode)
distance = abs(newNode(:,1)-currentNode(:,1))+abs(newNode(:,2)-currentNode(:,2));
end