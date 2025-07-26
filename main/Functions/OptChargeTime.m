% -OptChargeTime Function-
% Using the Optimization Toolbox, It will find an optimal
% charge time while keeping current within safety limits


%% Inputs
% cap  - Battery Capacity (AH) 
% curr - Current (A)

%% Outputs
% chargeTime - Time when batterry is fully charged (H)


function OptChargeTime(cap, curr)
ctProb = optimproblem();
%curr = optimvar("Current (A)",); put bounds

% ctProb.Constraints = ComputeCurrent(V_max, R, tau, t) <= [current safe]  ;
% Might need to move it around depending

c = ComputeChargeTime(cap, curr);

sol = solve(ctProb);

%plot/graph, output needed


end
