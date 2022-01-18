function y = ObjectiveFunction(u1, u2)
%OBJECTIVE FUNCTION is the function used for input-output data generation
%and for evaluation of results
%   returns the value y, based on inputs u1 and u2.
    y = sin(u1*u2)*sin(u2^2);
end

