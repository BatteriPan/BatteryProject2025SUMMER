% -Compute ChargeTime Function-
% Function calculates the time to charge the battery.
% ChargeTime is done in an array to optimize with different currents.

%% Inputs
% Cap  - Battery Capacity (AH) 
% curr - Current (A)

%% Outputs
% chargeTime - Time when batterry is fully charged (H)

%% Equation
% Time (H) = Capacity / Current

function chargeTime = ComputeChargeTime(cap, curr)
    chargeTime = cap ./ curr;
end

