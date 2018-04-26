load('pathValues.mat');
Osize = size(pathVal,1);
vrep=remApi('remoteApi');
vrep.simxFinish(-1); 
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
if (clientID>-1)
    [returnCode,leftJoint]=vrep.simxGetObjectHandle(clientID,'wheel_left_joint',vrep.simx_opmode_blocking);
    [returnCode,rightJoint]=vrep.simxGetObjectHandle(clientID,'wheel_right_joint',vrep.simx_opmode_blocking);
    for i = Osize-1:-1:1
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,leftJoint,pathVal(i,4),vrep.simx_opmode_blocking);
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,rightJoint,pathVal(i,3),vrep.simx_opmode_blocking);
        pause(1);
    end
end
 vrep.simxFinish(-1);
 vrep.delete();