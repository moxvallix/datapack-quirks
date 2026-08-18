# Quirk #1: Passenger ID (Suggested by Greytber)

# Summon an entity (to be your target entity)
# Feel free to change the type of entity here to your liking
summon pig ~ ~ ~ {Tags: ["quirks.target"]}

# Summon a temporary entity (44166be5-c9ce-4904-ad90-3d20d3836624)
summon armor_stand ~ ~ ~ {UUID: [I; 1142320101, -909227772, -1383056096, -746363356]}

# Mount the target entity to the temporary entity
ride @n[tag=quirks.target] mount 44166be5-c9ce-4904-ad90-3d20d3836624

# Store entity id to storage (id of first passenger)
data modify storage quirks:01_passenger_id result set from entity 44166be5-c9ce-4904-ad90-3d20d3836624 Passengers[0].id

# Cleanup
kill 44166be5-c9ce-4904-ad90-3d20d3836624
tp @n[tag=quirks.target] ~ -1000 ~
kill @e[tag=quirks.target]

# Output to chat
tellraw @s ["Your target was a ", {storage: "quirks:01_passenger_id", nbt: "result", color: gold}]