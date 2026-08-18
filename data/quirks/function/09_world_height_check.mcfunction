# Quirk #9: World Height Check (Suggested by runcows)
# This method can tell you whether you are outside of world height or not by checking the light level.
# Inside bounds, the light level will always be from 0 to 15. Outside of bounds, there is no light level
# so the predicate fails.

# If result is true, current position is in world height bounds. Else, it is not.
execute store result storage quirks:09_world_height_check result byte 1 if predicate quirks:09_world_height_check/in_bounds

# Output to chat
execute if data storage quirks:09_world_height_check {result: true} run tellraw @s "Current position is in world bounds."
execute if data storage quirks:09_world_height_check {result: false} run tellraw @s "Current position is outside world bounds."
