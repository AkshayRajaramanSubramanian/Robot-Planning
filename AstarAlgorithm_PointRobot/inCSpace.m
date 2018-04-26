function q = inCSpace(queryPoint)
x = queryPoint(:,1);
y = queryPoint(:,2);
    if(x>=0 && y>=0 && x<=250 && y<=150)
        q = 1;
    else
        q = 0;
    end
end