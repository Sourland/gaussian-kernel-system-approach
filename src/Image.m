function [] = Image(Solution, NumberOfGaussians)
    
    a = Solution(:,1);
    c1 = Solution(:,2);
    c2 = Solution(:,3);
    Sigma1 = Solution(:,4);
    Sigma2 = Solution(:,5);
    
    syms u1 u2
    exponential = -(((u1-c1).^2)./(2*Sigma1.^2) + ((u2-c2).^2)./(2*Sigma2.^2));
    fun = sum(a.*exp(exponential));
    fun2 = sin(u1 + u2)*sin(u2^2);
    
    figure()
    colormap summer
    shading interp
    fsurf(fun2, [-1 2 -2 1])
    title('Plot of Input-Output System')
    xlabel('u_{1}')
    ylabel('u_{2}')
    zlabel('f(u_{1}, u_{2})')
    colorbar
    
    figure()
    colormap cool
    shading interp
    fsurf(fun, [-1 2 -2 1])
    
    %view([15 15])
    title('Plot of Solution')
    xlabel('u_{1}')
    ylabel('u_{2}')
    zlabel('z')
    
    colorbar
end


