function y = Gaussian(u1, u2, c1, c2, sigma1, sigma2,a)
%GAUSSIAN is the gaussian functions that are used to compute the analytic
%expression of the objective function
%   u1, u2 are the inputs of the function
%   c1, c2 are the means used to constuct the gaussian function. Their values are to
%   be solved for the best score
%   sigma1, sigma2 is the variance used to constuct the gaussian function. 
%   Their values are to be solved for the best score
    Exponent = ((u1-c1)^2)/(2*sigma1^2) + ((u2-c2)^2)/(2*sigma2^2);
    y = a*exp(-Exponent);
end

