function [NodeSet,success] = actionMoveLeft(NodeSet,bX,bY,i,j)
lX = bX;
lY = bY-1;
Node = NodeSet.Nodes(:,:,i);
if(lX>0 && lX<=3 && lY>0 && lY<=3)
    newNode = exchange(Node,bX,bY,lX,lY);
    [NodeSet,success] = addNode(newNode,NodeSet,i,j);
else
    success = 0;
end
end