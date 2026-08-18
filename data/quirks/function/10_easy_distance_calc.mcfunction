# Quirk #10: Easy Distance Calc (Suggested by Siscu and trplnr)
# Method discovered by Triton365 on the Minecraft Commands discord.
# This example calculates the player's distance from 0 0 0

# Store players current position
data modify storage quirks:10_easy_distance_calc pos set from entity @s Pos

# Convert the doubles from the position to floats
execute store result storage quirks:10_easy_distance_calc target.x float 0.001 run data get storage quirks:10_easy_distance_calc pos[0] 1000
execute store result storage quirks:10_easy_distance_calc target.y float 0.001 run data get storage quirks:10_easy_distance_calc pos[1] 1000
execute store result storage quirks:10_easy_distance_calc target.z float 0.001 run data get storage quirks:10_easy_distance_calc pos[2] 1000

# Run the calculation macro
function quirks:10_easy_distance_calc/calculate.macro with storage quirks:10_easy_distance_calc target

# Output to chat
tellraw @s ["You are ", {storage: "quirks:10_easy_distance_calc", nbt: "result", color: gold}, " blocks from 0 0 0."]