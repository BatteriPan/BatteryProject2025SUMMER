%[text] ## Compute Power Function
%[text] This function calculates the voltage across a capacitor (or battery terminal) during charging in an RC circuit. The voltage increases exponentially over time toward a maximum voltage (V\_max) based on the time constant (tau).
%[text] ### Inputs
%[text]     V\_t - Voltage vector over time (Volts)
%[text]     I\_t   - Current vector over time (Amps)
%[text] ### Outputs
%[text]     P\_t - Instantaneous power vector over time (Watts)
%[text] ### Equations 
%[text]  $&dollar&;&dollar&;P(t) = V(t) \\cdot I(t)&dollar&;&dollar&;$
function P_t = ComputePower(V_t, I_t)
    P_t = V_t .* I_t;
end
%[text] 

%[appendix]{"version":"1.0"}
%---
