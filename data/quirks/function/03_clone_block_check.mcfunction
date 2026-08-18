# Quirk #3: Clone Block Check (Suggested by SuperAnt_)

# If the clone is successful, then there are diamond ores in the specified area.
# Otherwise, there are not
execute store success storage quirks:03_clone_block_check result byte 1 run clone ~-5 ~-5 ~-5 ~5 ~5 ~5 ~-5 ~-5 ~-5 filtered #minecraft:diamond_ores force

# Output to chat
execute if data storage quirks:03_clone_block_check {result: true} run tellraw @s "There is diamond ore nearby."
execute if data storage quirks:03_clone_block_check {result: false} run tellraw @s "There are no diamond ores nearby."