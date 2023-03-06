function RunRobot3D()
    clear;
    clc;
    close all;
    
    testWalk1;
    testWalk2;
    %testWalk3;
    %testWalk4;
    %testWalk5;
    %testWalk6;
    testJump1();

end


function drawStick3D(theta_left, theta_right,L,R)
    load human_data;

    for i = 1:size(L,2)
        theta_left = invKin3D(Ml, theta_left, L(:,i));
        theta_right = invKin3D(Mr, theta_right, R(:,i));
        thetas = [theta_left
            theta_right];
    
        stick3D( thetas);
    end
end

function testWalk1()
    theta_left = [-0.4; 0.1; -0.4; 0.5];
    theta_right = [-0.4; 0.1; -0.4; 0.5];
    
    load walk1
    drawStick3D(theta_left, theta_right, L,R);
end

function testWalk2()
    theta_left = [-0.4; 0.1; -0.4; 0.5];
    theta_right = [-0.4; 0.1; 0.4; 0.3];
    
    load walk2
    drawStick3D(theta_left, theta_right, L,R);
end

function testWalk3()
    theta_left = [-0.4; 0.1; -0.4; 0.5];
    theta_right = [0.4; 0.1; 0.2; 0.5];    
    load walk3
    drawStick3D(theta_left, theta_right, L,R);
end

function testWalk4()
    theta_left = [0.4; 0.1; -0.8; -0.3];
    theta_right = [-0.4; 0.1; 0.8; 0.3];  
    
    load walk4
    drawStick3D(theta_left, theta_right, L,R);
end

function testWalk5()
    theta_left = [-0.4; 0.1; -0.4; 0.5];
    theta_right = [-0.4; 0.1; -0.4; 0.5];
    
    load walk5
    drawStick3D(theta_left, theta_right, L,R);
end

function testWalk6()
    theta_left = [-0.4; 0.1; -0.4; 0.5];
    theta_right = [-0.4; 0.1; -0.4; 0.5];
    
    load walk6
    drawStick3D(theta_left, theta_right, L,R);
end

function testJump1()
    theta_left = [-0.4; 0.1; -0.4; 0.5];
    theta_right = [0.4; 0.1; -0.4; 0.5];
    
    load jump1
    drawStick3D(theta_left, theta_right, L,R);
end
