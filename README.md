
# Flight Path Simulator for KGL to DOH using Haversine Formula in MATLAB

## Project Overview
This project simulates the flight path between **Kigali International Airport (KGL)** in Rwanda and **Hamad International Airport (DOH)** in Qatar. It uses the **Haversine formula** to calculate the great-circle distance between the two airports. The simulation is built in **MATLAB** and visualizes the flight path on a world map. Intermediate waypoints along the great-circle route are interpolated to provide a simplified representation of the flight trajectory.

## Project Objectives
- **Calculate Great-Circle Distance**: Use the Haversine formula to compute the great-circle distance between KGL and DOH based on their latitude and longitude.
- **Geodesic Interpolation**: Interpolate intermediate waypoints along the flight path for visualization purposes.
- **Visualize the Flight Path**: Plot the flight path on a world map, showing both start and destination airports.
- **Educational Tool**: Provide an example of how flight paths are calculated and displayed, useful for aviation studies and enthusiasts.

## Mathematical Foundations
### Haversine Formula
The Haversine formula calculates the shortest distance between two points on the surface of a sphere using their latitude and longitude. It is given by the equation:

```math
a = sin²(Δϕ/2) + cos(ϕ₁) * cos(ϕ₂) * sin²(Δλ/2)
c = 2 * atan2(√a, √(1-a))
d = R * c


Where:

ϕ₁, ϕ₂ are the latitudes of the two points in radians.
λ₁, λ₂ are the longitudes of the two points in radians.
R is the Earth's radius (mean radius = 6371 km).
d is the great-circle distance between the two points in kilometers.
Geodesic Interpolation
This technique involves calculating intermediate points along the great-circle route between two points. These intermediate points simulate the aircraft's path between the start and destination airports.

Tools and Technologies
MATLAB: The primary platform for developing the simulation.
MATLAB Mapping Toolbox: Used for visualizing geospatial data and plotting flight paths.
MATLAB Functions:
deg2rad(), rad2deg(): Convert between degrees and radians.
plotm(), scatterm(): Plot and scatter points on a map.
worldmap(): Create a map of the world.
Code Implementation
Main Script: Flight Path Simulation from KGL to DOH
The main script simulates the flight path between Kigali International Airport (KGL) and Hamad International Airport (DOH) using the Haversine formula and geodesic interpolation. The script includes the following functions:

Haversine Function: Computes the great-circle distance between two points using their latitude and longitude coordinates.
Geodesic Interpolation Function: Generates intermediate latitudes and longitudes between the two airports along the great-circle path.
Plot Flight Path Function: Uses MATLAB’s mapping tools to plot the flight path on a world map.
Main Script: Specifies the coordinates of KGL and DOH, calls the interpolation function to generate the flight path, and visualizes it.
Input Coordinates:
Kigali International Airport (KGL):
Latitude: 1.9642° S
Longitude: 30.1219° E
Hamad International Airport (DOH):
Latitude: 25.276987° N
Longitude: 51.565020° E
Steps to Run the Simulation
Setup MATLAB:
Ensure MATLAB and the Mapping Toolbox are installed on your system.
Create a new script file named FlightPathSimulator.m and paste the provided code into the file.
Execute the Script:
Open MATLAB and navigate to the directory containing the script.
Run the script by typing FlightPathSimulator in the MATLAB command window.
View the Output:
A world map will appear showing the flight path between KGL and DOH.
The great-circle distance between the two airports will be displayed in the MATLAB command window.
Potential Improvements
Weather and Wind Conditions: Integrate real-time weather and wind data for dynamic flight path adjustments.
Multiple Routes: Expand to calculate and visualize flight paths between multiple airports.
Altitude Simulation: Add altitude and flight trajectory to the model to simulate more realistic flight paths.
3D Visualization: Create 3D plots for better representation of the aircraft’s trajectory over the globe.
Conclusion
This flight path simulator demonstrates the application of the Haversine formula in calculating great-circle distances and visualizing flight routes on a map using MATLAB. It serves as an educational tool for understanding basic aviation path calculations and geodesic interpolation.
