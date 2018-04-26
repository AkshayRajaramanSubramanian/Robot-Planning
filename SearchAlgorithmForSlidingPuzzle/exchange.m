function newNode = exchange(Node,bX,bY,X,Y)
    temp = Node(bX,bY);
    Node(bX,bY) = Node(X,Y);
    Node(X,Y) = temp;
    newNode = Node;
end