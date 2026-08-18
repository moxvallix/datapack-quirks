# Summon item display and set values (0a84ed7f-6495-4424-a8e3-81712cd79c5b)
$summon item_display ~ ~ ~ {UUID: [I; 176483711, 1687503908, -1461485199, 752327771], transformation: [$(x)f,0f,0f,0f,$(y)f,0f,0f,0f,$(z)f,0f,0f,0f,0f,0f,0f,1f]}

# Store result of scale[0], which works out to be sqrt(x^2 + y^2 + z^2)
data modify storage quirks:10_easy_distance_calc result set from entity 0a84ed7f-6495-4424-a8e3-81712cd79c5b transformation.scale[0]

# Cleanup
kill 0a84ed7f-6495-4424-a8e3-81712cd79c5b