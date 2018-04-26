function [NodeSet,success] = actionMoveRight(NodeSet,bX,bY,i,j)
rX = bX;
rY = bY+1;
Node = NodeSet.Nodes(:,:,i);
if(rX>0 && rX<=3 && rY>0 && rY<=3)
    newNode = exchange(Node,bX,bY,rX,rY);
    [NodeSet,success] = addNode(newNode,NodeSet,i,j);
else
    success = 0;
end
end