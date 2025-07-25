## -BatteryProject2025SUMMER- 
Modeling and Optimizing a Battery Charging Profile

The model was based on a RC circuit where the capacitor modeled our battery. We used the data sheet to 
base our model which was the Panasonic NCA103450. The Data sheet contained data regarding the 
battery's capacity and other specifications regarding the battery.

The given equation [ V(t) = V_max (1 - e^{-t/tau} )] was used model the voltage over time. We applied ohms law [ V = I*R ] to
model the current over time. We used the given equation for voltage and divided it by the resistance. Then applied Power formula
[ P = V*I ] which we used both Current and Voltage to get the power over time. With this were were able to intergate by using the 
trapz function in matlab to get the area under the power curve to get the total energy of the battery.

# Folders

Archives folder has previous older verisons of the files that are no longer in use.
Documents folder contains some work that we did and plots of the graphs. It contains some
calcalutions that were done.

The main folder is broken up with the main driver of the program and the functions folder.
The functions are named regarding the task that they complete and are called in the driver.
The BatteryModel.m (Driver) is the only file that has to be run which will provide the graphs along
with display other output in the command prompt. Make sure that files are in the same path to able
run the file if not then matlab will present a popup to add them to a path.

# Work Breakdown

Yeidi Bautista:  functions to compute time to 80% and 100% SOC;

Mariah Contreras: calculating and graphing the derivative of the voltage curve (dV/dt);

Baltazar Pacheco Hernandez: Calculating charging efficiency; Debugging if needed ; Cleaning up files and improving readability; 

Hassan Naboulsi: Updating GitHub README file with recent code changes and usage instructions;

# Further Notes

