tic();
inputConfiguration = [1 3 0;5 2 6;4 7 8];
Nodes= [];
NodesInfo=[];
Nodes(:,:,1)=inputConfiguration;
NodesInfo(:,:,1)= [1,0,0];
Nodes(:,:,2)=[0 0 0;0 0 0;0 0 0];
NodesInfo(:,:,2)= [0,0,0];
NodeSet.Nodes = Nodes;
NodeSet.NodesInfo = NodesInfo;
flagL = 0;
flagR = 0;
flagU = 0;
flagD = 0;
i = 1;
j = 2;
while((flagL == 0 && flagR == 0 && flagU == 0 && flagD == 0) || size(NodeSet.Nodes,3)<100001)
    size(NodeSet.Nodes,3)
    [bX,bY] = blankTileLocation(NodeSet,i);
    %MoveLeft
    [NodeSet,successL] = actionMoveLeft(NodeSet,bX,bY,i,j);
    if(successL == 1)
        flagL = isGoal(NodeSet,j);
        j = j+1;
    end
    %MoveRight
    [NodeSet,successR] = actionMoveRight(NodeSet,bX,bY,i,j);
    if(successR == 1)
        flagR = isGoal(NodeSet,j);
        j = j+1;
    end
    %MoveUp
    [NodeSet,successU] = actionMoveUp(NodeSet,bX,bY,i,j);
    if(successU == 1)
        flagU = isGoal(NodeSet,j);
        j = j+1;
    end
    %MoveDown
    [NodeSet,successD] = actionMoveDown(NodeSet,bX,bY,i,j);
    if(successD == 1)
        flagD = isGoal(NodeSet,j);
        j = j+1;
    end
    i = i+1;
end

toc();    