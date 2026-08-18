# Quirk 5: Cloud Computing (Suggested by trplnr)
# This quirk was adapted from the datapack by SilicaYT in the Minecraft Commands discord.
# It is based on the discovery by Triton365, in the same discord.
# Cloud computing allows for some rather complex math, such as finding the square root of a number
# in a relatively performant way, but for this example I will just be showing off the most basic
# usecase.

data modify storage quirks:05_cloud_computing result set value {}

# Here we can use cloud computing to calculate a simple multiplication of 2 x 8
execute store result storage quirks:05_cloud_computing result.first float 1 run function quirks:05_cloud_computing/multiply.macro {factor1: 2, factor2: 8}

# Here we can use cloud computing to calculate a fixed point multiplication of 32.53 x 12.48.
# For fixed point precision, we first multiply our inputs by 10^(precision).
# So for 2 points of precision (two numbers after the dot), we multiply our inputs by 10^2 (100).
# We then run the multiply function, with our scaled inputs. We then must downscale the result.
# We set the scale to be 10^-(precision x 2) (10^-4) (0.0001).
execute store result storage quirks:05_cloud_computing result.second float 0.0001 run function quirks:05_cloud_computing/multiply.macro {factor1: 3253, factor2: 1248}

# Output to chat
tellraw @s ["Result 1: ", {storage: "quirks:05_cloud_computing", nbt: "result.first", color: gold}]
tellraw @s ["Result 2: ", {storage: "quirks:05_cloud_computing", nbt: "result.second", color: gold}]