function q = outObstacle1(queryPoint)
x = queryPoint(:,1);
y = queryPoint(:,2);
if(x>=55 && x<=105 && y>=67.5 && y<=112.5)
    q =0;
else
    q = 1;
end