module DriverBehavior
export initializeRoad


#initial parameters - Simple Driver Behavior parameters
averageReactionTimeDriver = 0.75
tendancyChangeLanesDriver = 0.5
tendancyAllowChangeLanesDriver = 0.5
averageCarLengthDriver = 4.5

#Road Property parameters
numberLanesRoad = 3
speedLimitRoad = 20
lengthRoad = 1000

"""
    initializeRoad(numberLanesRoad::Integer, startingDensity::Float64, averageCarLengthDriver::Float64)

Initializes a road with a random distribution of cars with a selected total density.

# Arguments
* `numberLanesRoad` = the number of lanes in our road.
* `startingDensity` = the density of cars we want on our road.
* `averageCarLengthDriver` = the average langth of a car.

# Notes
* The function is randomized and does not fill the road with the exact density that is specified

"""

function initializeRoad(numberLanesRoad::Integer, startingDensity::Float64, averageCarLengthDriver::Float64) #initializes traffic by a starting density ranging from 0 to 1
    availableSpacesPerLane = floor(Int, lengthRoad / averageCarLengthDriver)
    posMatrix = zeros(availableSpacesPerLane, numberLanesRoad)
    for i in 1:numberLanesRoad
        for j in 1:availableSpacesPerLane
            if rand() < startingDensity
                posMatrix[j, i] = 1
            end
        end
    end
    return posMatrix
end

end