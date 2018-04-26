function [NodeSet,success] = actionMoveUp(NodeSet,bX,bY,i,j)
uX = bX-1;
uY = bY;
Node = NodeSet.Nodes(:,:,i);
if(uX>0 && uX<=3 && uY>0 && uY<=3)
    newNode = exchange(Node,bX,bY,uX,uY);
    [NodeSet,success] = addNode(newNode,NodeSet,i,j);
else
    success = 0;
end
end