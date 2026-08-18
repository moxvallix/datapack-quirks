# Quirk #6: Fun With Tags (Suggested by Moxvallix)

data modify storage quirks:06_fun_with_tags result set value {}

# Summon temporary marker (82444d21-08ef-4431-b42d-737311df5554)
summon marker ~ ~ ~ {UUID: [I; -2109453023, 149898289, -1272089741, 299849044]}

# Append some strings in no particular order
data modify entity 82444d21-08ef-4431-b42d-737311df5554 Tags append value "carrot"
data modify entity 82444d21-08ef-4431-b42d-737311df5554 Tags append value "apple"
data modify entity 82444d21-08ef-4431-b42d-737311df5554 Tags append value "banana"

data modify storage quirks:06_fun_with_tags result.first set from entity 82444d21-08ef-4431-b42d-737311df5554 Tags

# Reset the tags array
data modify entity 82444d21-08ef-4431-b42d-737311df5554 Tags set value []

# Append the same strings in a different order
data modify entity 82444d21-08ef-4431-b42d-737311df5554 Tags append value "apple"
data modify entity 82444d21-08ef-4431-b42d-737311df5554 Tags append value "banana"
data modify entity 82444d21-08ef-4431-b42d-737311df5554 Tags append value "carrot"

data modify storage quirks:06_fun_with_tags result.second set from entity 82444d21-08ef-4431-b42d-737311df5554 Tags

# Notice that result.first and result.second are identical, even though the order the tags were appended was different
# This can be used for a predictable sort. Unfortunately, the sort order isn't very practical, but its still cool.

# This next trick relies on the fact that entities cannot have duplicate tags. We can use this to check if
# a string is already in a list. Macros have made this technique somewhat obsolete however, but its
# still worth showing off.
data modify entity 82444d21-08ef-4431-b42d-737311df5554 Tags set value ["frog", "toad", "newt"]

data remove storage quirks:06_fun_with_tags temp

# Store the entity's current tags to a temp storage
data modify storage quirks:06_fun_with_tags temp.list set from entity 82444d21-08ef-4431-b42d-737311df5554 Tags

# Attempt to append the string needing to be checked to the entity tag list
# TIP: Try changing the string here to be something else, like "salamander", and see if the result changes!
data modify entity 82444d21-08ef-4431-b42d-737311df5554 Tags append value "toad"

# Get the success of setting temp.list to be the entity tags. If it succeeds, it means the entity tags array
# was changed, and that the string was unique. However, if it fails, it means that the entity tags array
# did not change, and that the string already existed in the list.
execute store success storage quirks:06_fun_with_tags result.third byte 1 run data modify storage quirks:06_fun_with_tags temp.list set from entity 82444d21-08ef-4431-b42d-737311df5554 Tags

# Cleanup
kill 82444d21-08ef-4431-b42d-737311df5554

# Output to chat
tellraw @s ["Result 1: ", {storage: "quirks:06_fun_with_tags", nbt: "result.first", color: gold}]
tellraw @s ["Result 2: ", {storage: "quirks:06_fun_with_tags", nbt: "result.second", color: gold}]
tellraw @s ["Result 3: ", {storage: "quirks:06_fun_with_tags", nbt: "result.third", color: gold}]