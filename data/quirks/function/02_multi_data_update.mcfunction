# Quirk #2: Multi Data Update (Suggested by Moxvallix)

# Setup dataset
data modify storage quirks:02_multi_data_update array set value [{type: frog, color: red}, {type: toad, color: brown}, {type: frog, color: green}, {type: frog, color: blue}, {type: toad, color: brown}]

# Example 1: collect all frogs to another array
data modify storage quirks:02_multi_data_update frogs set value []
data modify storage quirks:02_multi_data_update frogs append from storage quirks:02_multi_data_update array[{type: frog}]

# Example 2: modify all frogs to have the same color
data modify storage quirks:02_multi_data_update array[{type: frog}].color set value "pink"

# Output to chat
tellraw @s ["Frog Collection: ", {storage: "quirks:02_multi_data_update", nbt: "frogs", color: gold}]
tellraw @s ["Updated Array: ", {storage: "quirks:02_multi_data_update", nbt: "array", color: gold}]