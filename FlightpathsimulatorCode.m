% Main Script
% Coordinates for Kigali International (KGL) and Hamad International (DOH)
lat1 = -1.9642; lon1 = 30.1219; % Kigali International Airport (KGL)
lat2 = 25.276987; lon2 = 51.565020; % Hamad International Airport (DOH)

% Number of intermediate points for the path
num_points = 100;

% Interpolate the great-circle path
[latitudes, longitudes] = interpolate_points(lat1, lon1, lat2, lon2, num_points);

% Plot the flight path
plot_flight_path(latitudes, longitudes, lat1, lon1, lat2, lon2);

% Calculate and display the great-circle distance
distance = haversine(lat1, lon1, lat2, lon2);
disp(['Distance between Kigali International Airport (KGL) and Hamad International Airport (DOH): ', num2str(distance), ' km']);

%% Function: Haversine Formula
function distance = haversine(lat1, lon1, lat2, lon2)
    % Radius of Earth in km
    R = 6371;
    
    % Convert degrees to radians
    lat1 = deg2rad(lat1);
    lon1 = deg2rad(lon1);
    lat2 = deg2rad(lat2);
    lon2 = deg2rad(lon2);
    
    % Haversine formula
    dlat = lat2 - lat1;
    dlon = lon2 - lon1;
    a = sin(dlat / 2)^2 + cos(lat1) * cos(lat2) * sin(dlon / 2)^2;
    c = 2 * atan2(sqrt(a), sqrt(1 - a));
    distance = R * c; % Distance in km
end

%% Function: Geodesic Interpolation
function [latitudes, longitudes] = interpolate_points(lat1, lon1, lat2, lon2, num_points)
    % Interpolate points along the great-circle path
    latitudes = zeros(1, num_points+1);
    longitudes = zeros(1, num_points+1);
    
    for i = 0:num_points
        fraction = i / num_points;
        % Interpolate using geodesic distance
        intermediate = geodesic(lat1, lon1, lat2, lon2, fraction);
        latitudes(i+1) = intermediate(1);
        longitudes(i+1) = intermediate(2);
    end
end

%% Function: Geodesic Calculation
function point = geodesic(lat1, lon1, lat2, lon2, fraction)
    % Function to compute a point at a fraction along the great-circle route
    lat1 = deg2rad(lat1);
    lon1 = deg2rad(lon1);
    lat2 = deg2rad(lat2);
    lon2 = deg2rad(lon2);
    
    delta_sigma = fraction * acos(sin(lat1) * sin(lat2) + cos(lat1) * cos(lat2) * cos(lon2 - lon1));
    A = sin((1 - fraction) * delta_sigma) / sin(delta_sigma);
    B = sin(fraction * delta_sigma) / sin(delta_sigma);
    
    lat = rad2deg(asin(A * sin(lat1) + B * sin(lat2)));
    lon = rad2deg(lon1 + atan2(sin(lon2 - lon1) * cos(B * delta_sigma), cos(lat1) * cos(lat2) * A - sin(lat1) * B));
    
    point = [lat, lon];
end

%% Function: Plot the Flight Path
function plot_flight_path(latitudes, longitudes, lat1, lon1, lat2, lon2)
    % Plot the flight path on a map
    figure;
    worldmap('world');
    load coastlines; % Load coastline data
    plotm(coastlat, coastlon, 'k'); % Plot coastlines
    
    % Plot the flight path
    hold on;
    plotm(latitudes, longitudes, 'b-', 'LineWidth', 2); % Flight path
    scatterm(lat1, lon1, 100, 'r', 'filled'); % Start point
    scatterm(lat2, lon2, 100, 'g', 'filled'); % End point
    
    % Annotate the start and end points
    textm(lat1, lon1, 'Start: KGL', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top');
    textm(lat2, lon2, 'End: DOH', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top');
    
    title('Flight Path Visualization: KGL to DOH');
    hold off;
end
