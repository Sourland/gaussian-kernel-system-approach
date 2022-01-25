function [] = Image(Solution, NumberOfWords)
    
    x = linspace(-1, 2, 150);
    y = linspace(-2, 1, 150);
    [x, y] = meshgrid(x, y);
    z = sin(x+y).*sin(y.^2);
    z_sol = 0;
    for i = 1:NumberOfWords
        a = Solution(i,1);
        c1 = Solution(i,2);
        c2 = Solution(i,3);
        sigma1 = Solution(i,4);
        sigma2 = Solution(i,5);
        G = ((x-c1).^2)./(2*sigma1^2) + ((y-c2).^2)./(2*sigma2^2);
        z_sol = z_sol + a.*exp(-G);
    end
    figure()
    subplot(1,2,1)
    surf(x,y,z)
    colormap summer
    shading interp
    title('Plot of Input-Output System')
    xlabel('u_{1}')
    ylabel('u_{2}')
    zlabel('f(u_{1}, u_{2})')
    colorbar
    
    
    subplot(1,2,2)
    surf(x,y,z_sol)
    
    shading interp
    %view([15 15])
    title('Plot of Solution')
    xlabel('u_{1}')
    ylabel('u_{2}')
    zlabel('z')
    colormap cool
    colorbar
end


