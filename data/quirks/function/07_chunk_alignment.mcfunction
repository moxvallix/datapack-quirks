# Quirk #7: Chunk Alignment (suggested by SuperAnt_)
# Credit to this method goes to Crowdford, according to SuperAnt_
# This will get the 0 0 coordinates of the current chunk, and store it to storage

# Temporary Marker (871c9915-fecd-4200-a776-0375b958724d)
summon marker ~ ~ ~ {UUID: [I; -2028168939, -20102656, -1485438091, -1185385907]}

# Use dark magic to teleport the marker to 0 0 of the current chunk
execute positioned ~29999992 ~-8 ~29999992 positioned ~108086391056891904 ~108086391056891904 ~108086391056891904 positioned ~-108086391056891904 ~-108086391056891904 ~-108086391056891904 positioned ~-30000000 ~ ~-30000000 run tp 871c9915-fecd-4200-a776-0375b958724d ~ ~ ~

# Store the position of the entity
data modify storage quirks:07_chunk_alignment result set from entity 871c9915-fecd-4200-a776-0375b958724d Pos

# Cleanup
kill 871c9915-fecd-4200-a776-0375b958724d

# Output to chat
tellraw @s ["0 0 of the current chunk is: ", {storage: "quirks:07_chunk_alignment", nbt: "result", color: gold}]