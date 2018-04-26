function [X,Y] = blankTileLocation(NodeSet,k)
Node = NodeSet.Nodes(:,:,k);
for i = 1:3
    for j = 1:3
        if Node(i,j)==0
            X = i;
            Y = j;
        end
    end
end
end