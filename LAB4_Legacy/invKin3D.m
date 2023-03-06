function theta=invKin3D(M,theta,pos)
%use newton's method
    for idx = 1:600
        [position, jacobian] = evalRobot3D(M,theta);
    
        delta_x = position-pos;
    
        f = jacobian\(-delta_x);
        theta = theta + f;
    
        if(abs(f)<0.00001)
            break;
        end
     end

end