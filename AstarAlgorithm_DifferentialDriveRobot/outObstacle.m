function outObstacle = outObstacle(queryPoint)
 obstacle1 = queryPoint(:,1)>=1 && queryPoint(:,1)<=2 && queryPoint(:,2)>=7 && queryPoint(:,2)<=9;
 obstacle2 = queryPoint(:,1)>=3 && queryPoint(:,1)<=4 && queryPoint(:,2)>=7 && queryPoint(:,2)<=9;
 obstacle3 = queryPoint(:,1)>=6 && queryPoint(:,1)<=8 && queryPoint(:,2)>=4 && queryPoint(:,2)<=6;
 obstacle4 = queryPoint(:,1)>=10 && queryPoint(:,1)<=12 && queryPoint(:,2)>=4 && queryPoint(:,2)<=6;
 obstacle5 = queryPoint(:,1)>=12 && queryPoint(:,1)<=13 && queryPoint(:,2)>=9 && queryPoint(:,2)<=10;
 obstacle6 = queryPoint(:,1)>=14 && queryPoint(:,1)<=15 && queryPoint(:,2)>=3 && queryPoint(:,2)<=6;
 
 
 
if( obstacle1 || obstacle2 || obstacle3 || obstacle4 ||  obstacle5 ||  obstacle6)
    outObstacle = 0;
else
    outObstacle = 1;
end