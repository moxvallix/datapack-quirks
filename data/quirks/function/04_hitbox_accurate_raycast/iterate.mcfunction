# Teleport temporary entity to current location
tp 0d100120-7fcc-4d72-9b22-3497012aea43 ^ ^ ^

# If player is still looking at the temporary entity, continue raycasting forwards.
# If the player is not looking at the temporary entity, it means it has clipped in to a hitbox and
# the raycast should end.
#
# The 0.005 can be changed based on how accurate the raycast needs to be. Smaller steps means higher accuracy
# at the cost of performance.
execute if predicate quirks:04_hitbox_accurate_raycast/looking_at_entity positioned ^ ^ ^0.005 run function quirks:04_hitbox_accurate_raycast/iterate