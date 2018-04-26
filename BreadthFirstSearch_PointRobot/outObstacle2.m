function q = outObstacle2(queryPoint)
x = queryPoint(:,1);
y = queryPoint(:,2);
inPart1 = (y>=((-41/25)*x+(1259/5)))&&(y>=51)&&(y<=((-2/19)*x+(1285/19)));
inPart2 = (y<=((38/7)*x-(5647/7)))&&(y>=51)&&(y<=((-38/23)*x+(8317/23)));
inPart3 = (y>=((-41/25)*x+(1259/5)))&&(y<=51)&&(y>=(((-37/20)*x)-(1484/5)))&&(y>=14)&&(x<=168);
if(inPart1 || inPart2 || inPart3)
    q = 0;
else
    q = 1;
end
end