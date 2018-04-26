function q = outObstacle3(queryPoint)
distance = sqrt((queryPoint(:,1)-180)^2 + (queryPoint(:,2)-120)^2);
if(distance > 15)
    q = 1;
else
    q = 0;
end
end