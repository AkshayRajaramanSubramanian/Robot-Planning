load('WorkspaceOutputs.mat');
%code to implement a backtracking search algorithm for the output
reqdOutput = [1 2 3;4 5 6;7 8 0];
flag = 0;
j = 2;
rootNode = 0;
for i = 1: size(NodeSet.Nodes,3)
   if(isequal(NodeSet.Nodes(:,:,i),reqdOutput))
       rootNode = NodeSet.NodesInfo(:,1,i);
   end
end
NodeList(1) = rootNode;
if(size(NodeList) == 1)
    while(flag == 0)
        NodeList(j) = NodeSet.NodesInfo(:,2,rootNode);
        if(NodeList(j) == 1)
            flag = 1; 
        end
        rootNode =  NodeList(j);
        j = j+1;
    end
end
m = size(NodeList,2);
if(size(NodeList,2)>1)
    for ii = 1: size(NodeList,2)
        k = NodeList(m);
        pathNodes(:,:,ii) = NodeSet.Nodes(:,:,k);
        m = m-1;
    end
    pathNodes
end