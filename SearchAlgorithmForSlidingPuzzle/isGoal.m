function isGoal = isGoal(NodeSet,j)
goal = [1 2 3;4 5 6; 7 8 0];
if(isequal(NodeSet.Nodes(:,:,j),goal))
    isGoal = 1;
else 
    isGoal = 0;
end
end