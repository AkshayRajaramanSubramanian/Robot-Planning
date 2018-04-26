function [NodeSet,success] = actionMoveDown(NodeSet,bX,bY,i,j)
dX = bX+1;
dY = bY;
Node = NodeSet.Nodes(:,:,i);
if(dX>0 && dX<=3 && dY>0 && dY<=3)
    newNode = exchange(Node,bX,bY,dX,dY);
    [NodeSet,success] = addNode(newNode,NodeSet,i,j);
else
    success = 0;
end
end