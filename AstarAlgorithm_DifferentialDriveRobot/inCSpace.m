function inCSpace = inCSpace(queryPoint)
    if(queryPoint(:,1)>=0 && queryPoint(:,1)<=15 && queryPoint(:,2)>=0 && queryPoint(:,2)<=10)
       inCSpace = 1; 
    else
        inCSpace = 0;
    end
end