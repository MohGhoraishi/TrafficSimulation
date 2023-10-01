module DriverBehaviour
export initializeRoad


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

function initializeRoad(numberLanesRoad::Integer, startingDensity::Float64, averageCarLengthDriver::Float64, lengthRoad) #initializes traffic by a starting density ranging from 0 to 1
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