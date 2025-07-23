%% -Compute Energy Loss Function-
% This function calculates the total energy dissipated as heat
% by the resistor during the charging process.

%% Inputs
% t:    Time vector (seconds)
% I_t:  Current vector over time (Amps)
% R:    Resistance (Ohms)

%% Outputs
% energy_loss_joules: Total energy lost in Joules

%% Equations
% P_loss(t) = I(t)^2 * R
% E_loss = integral(P_loss(t) dt)

function energy_loss_joules = ComputeEnergyLoss(t, I_t, R)
    % Calculate instantaneous power loss in the resistor
    P_loss_t = (I_t.^2) * R;

    % Integrate power loss over time to get total energy loss
    energy_loss_joules = trapz(t, P_loss_t);
end