# Quirk 4: Hitbox Accurate Raycast (Suggested by Moxvallix)

# Summon a temporary interaction (0d100120-7fcc-4d72-9b22-3497012aea43)
summon interaction ~ ~ ~ {UUID:[I; 219152672, 2144095602, -1692257129, 19589699],width:0.1,height:0.1}

# Run iterate function, positioned at player eyes and start outside their hitbox
execute at @s anchored eyes positioned ^ ^ ^0.5 run function quirks:04_hitbox_accurate_raycast/iterate

# Store raycast position
data modify storage quirks:04_hitbox_accurate_raycast result set from entity 0d100120-7fcc-4d72-9b22-3497012aea43 Pos

# Kill temporary interaction
kill 0d100120-7fcc-4d72-9b22-3497012aea43

# Output to chat
tellraw @s ["You are looking at: ", {storage: "quirks:04_hitbox_accurate_raycast", nbt: "result", color: gold}]