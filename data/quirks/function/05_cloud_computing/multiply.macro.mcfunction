# The way this works is that we have two timelines set up, which both multiply the cloud height based on
# the time the timeline is set to.

# Here the cloud height in the quirks:05_cloud_computing dimension is 1

# Now we set the time of the factor1 clock. This multiplies the cloud height (1) by factor1
# which sets the cloud height to be factor1.
$time of quirks:05_cloud_computing/factor1 set $(factor1)

# Then we set the time of the factor2 clock. This multiplies the cloud height (factor1) by factor2.
$time of quirks:05_cloud_computing/factor2 set $(factor2)

# Use an item modifier to store the cloud height environment attribute in to the item custom model data.
execute in quirks:05_cloud_computing run item modify block 0 0 0 container.0 {function:set_custom_model_data,floats:{mode:replace_all,values:[{type:environment_attribute,attribute:"minecraft:visual/cloud_height"}]}}

# Return the value from the item custom model data.
execute in quirks:05_cloud_computing run return run data get block 0 0 0 Items[0].components.minecraft:custom_model_data.floats[0]
