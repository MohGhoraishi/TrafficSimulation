module DriverBehaviour
export initializeRoad


"""
    initializeRoad(numberLanesRoad::Integer, startingDensity::Float64, averageCarLengthDriver::Float64)

Initializes a road with a random distribution of cars with a selected total density.

# Arguments
* `numberLanesRoad` = the number of lanes in our road.
* `startingDensity` = the density of cars we want on our road.
* `averageCarLengthDriver` = the average langth of a car.
* `resolution` = Splits up the available space into smaller chunks

# Notes
* The function is randomized and does not fill the road with the exact density that is specified

"""

function initializeRoad(numberLanesRoad::Integer, startingDensity::Float64, averageCarLengthDriver::Float64, lengthRoad, resolution::Integer) #initializes traffic by a starting density ranging from 0 to 1
    availableSpacesPerLane = floor(Int, lengthRoad / averageCarLengthDriver)
    posMatrix = zeros(availableSpacesPerLane * resolution, numberLanesRoad)
    for i in 1:numberLanesRoad
        for j in 1:availableSpacesPerLane - 1
            if rand() < startingDensity
                for k in 0:resolution-1
                    posMatrix[j * resolution + k, i] = 1
                end
            end
        end
    end
    return posMatrix
end

end