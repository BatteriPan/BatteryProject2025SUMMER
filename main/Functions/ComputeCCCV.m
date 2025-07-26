%% -Compute CC-CV Charging Profile-
% This function models a full Constant Current-Constant Voltage (CC-CV)
% charge cycle. It handles the transition from the CC to CV phase.

%% Inputs
% V_start - Starting voltage (Volts)
% V_max - Maximum charging voltage (Volts)
% I_cc  - Constant charge current (Amps)
% R     - Equivalent resistance (Ohms)
% C     - Equivalent capacitance (Farads)
% t     - Time vector (Seconds)

%% Outputs
% V_cccv - Voltage vector for the CC-CV profile
% I_cccv - Current vector for the CC-CV profile

function [V_cccv, I_cccv] = ComputeCCCV(V_start, V_max, I_cc, R, C, t)
    
    % Calculate the time constant
    tau = R * C;

    % --- Time to switch from CC to CV ---
    % This is the time it takes for terminal voltage to reach V_max
    t_switch = (C * (V_max - I_cc * R - V_start)) / I_cc;
    
    % Initialize output vectors
    V_cccv = zeros(size(t));
    I_cccv = zeros(size(t));

    % Find the index where the switch from CC to CV occurs
    switch_idx_vec = find(t >= t_switch, 1);
    
    if isempty(switch_idx_vec)
        % If t_switch is beyond simulation time, the whole charge is CC
        cc_indices = 1:length(t);
        cv_indices = [];
    else
        % Otherwise, split the time into CC and CV phases
        switch_idx = switch_idx_vec(1);
        cc_indices = 1:(switch_idx - 1);
        cv_indices = switch_idx:length(t);
    end

    % --- Phase 1: Constant Current (CC) ---
    if ~isempty(cc_indices)
        I_cccv(cc_indices) = I_cc;
        % Terminal voltage rises as the capacitor charges
        V_cccv(cc_indices) = V_start + (I_cc / C) * t(cc_indices) + (I_cc * R);
    end
    
    % --- Phase 2: Constant Voltage (CV) ---
    if ~isempty(cv_indices)
        % Terminal voltage is held constant at V_max
        V_cccv(cv_indices) = V_max;
        
        % Current starts at I_cc and decays exponentially
        t_cv_phase = t(cv_indices) - t_switch; % Start time from zero at the switch
        I_cccv(cv_indices) = I_cc * exp(-t_cv_phase / tau);
    end
    
    % Clean up any voltage overshoot from discrete time steps
    V_cccv(V_cccv > V_max) = V_max;
end