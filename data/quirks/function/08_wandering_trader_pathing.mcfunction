# Quirk #8: Wandering Trader Pathfinding (Suggested by trplnr)
# Wandering traders can be easily set up to pathfind to a given location
# This example will spawn a trader that will try to path to where you are looking

# A note for any wanting to use this technique for making custom entities: if you want to make a
# wandering trader invisible, you will need to keep clearing its milk bucket during the day,
# lest it drink and become visible.

# Raycast to where the player is looking
function quirks:04_hitbox_accurate_raycast

# Set up the wander target array
data modify storage quirks:08_wandering_trader_pathing target set value [I;]

# Append raycast result to the target array
# Since this is a typed array, all of the doubles get automagically converted for us!
data modify storage quirks:08_wandering_trader_pathing target append from storage quirks:04_hitbox_accurate_raycast result[]

summon wandering_trader ~ ~ ~
data modify entity @n[type=wandering_trader] wander_target set from storage quirks:08_wandering_trader_pathing target