function [pos,J] = evalRobot3D(l,theta)

    M_hip = cell2mat(l(1));
    M_knee = cell2mat(l(2));
    M_foot =  cell2mat(l(3));

    theta1 = theta(1);
    theta2 = theta(2);
    theta3 = theta(3);
    theta4 = theta(4);

    pos = M_hip * R_z(theta3) * R_y(theta2) * R_x(theta1) * M_knee * R_x(theta4) * M_foot * [0 0 0 1]';
    pos = pos(1:3);

    J_1 = M_hip * R_z(theta3) * R_y(theta2) * dri_R_x(theta1) * M_knee * R_x(theta4) * M_foot * [0 0 0 1]';
    J_2 = M_hip * R_z(theta3) * dri_R_y(theta2) * R_x(theta1) * M_knee * R_x(theta4) * M_foot * [0 0 0 1]';
    J_3 = M_hip * dri_R_z(theta3) * R_y(theta2) * R_x(theta1) * M_knee * R_x(theta4) * M_foot * [0 0 0 1]';
    J_4 = M_hip * R_z(theta3) * R_y(theta2) * R_x(theta1) * M_knee * dri_R_x(theta4) * M_foot * [0 0 0 1]';

    J  = [ J_1(1,1) J_2(1,1) J_3(1,1) J_4(1,1)
           J_1(2,1) J_2(2,1) J_3(2,1) J_4(2,1)
           J_1(3,1) J_2(3,1) J_3(3,1) J_4(3,1)
           ];
end

%R_x
function R_x_theta = R_x(theta)
    R_x_theta = [1 0 0 0
            0 cos(theta) -sin(theta) 0
            0 sin(theta) cos(theta) 0
            0 0 0 1];
end

%derivative of R_x
function dri_R_x_theta = dri_R_x(theta)
    dri_R_x_theta = [ 0 0 0 0
                      0 -sin(theta) -cos(theta) 0
                      0  cos(theta) -sin(theta) 0
                      0 0 0 0];
end

%R_y
function R_y_theta = R_y(theta)
    R_y_theta = [ cos(theta) 0  sin(theta) 0
                   0 1 0 0
                  -sin(theta) 0 cos(theta) 0
                  0 0 0 1 ];
end

%derivative of R_y
function dri_R_y_theta = dri_R_y(theta)
    dri_R_y_theta = [-sin(theta) 0 cos(theta) 0
                     0 0 0 0
                     -cos(theta) 0 -sin(theta) 0 
                     0 0 0 0 ];
end

%R_z
function R_z_theta = R_z(theta)
    R_z_theta = [ cos(theta) -sin(theta) 0 0
                  sin(theta)  cos(theta) 0 0
                  0 0 1 0 
                  0 0 0 1 ];
end

%derivative of R_z
function dri_R_z_theta = dri_R_z(theta)
    dri_R_z_theta = [-sin(theta) -cos(theta) 0 0
                     cos(theta) -sin(theta) 0 0 
                     0 0 0 0
                     0 0 0 0 ];
end