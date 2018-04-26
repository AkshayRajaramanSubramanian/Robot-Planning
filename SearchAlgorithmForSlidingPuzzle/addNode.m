function [NodeSet,success] = addNode(newNode,NodeSet,i,j)
l = 1;
flag = 0;
while(l<j && flag == 0)
    if(isequal(newNode,NodeSet.Nodes(:,:,l)))
        success = 0;
        flag = 1;
    else
        NodeSet.Nodes(:,:,j) = newNode;
        NodeSet.NodesInfo(:,:,j) = [j,i,0];
       success = 1; 
    end
    l = l+1;
end