##This is a failsafe for items in progress of being modified but fall short - It is assumed the items will be transformed when near an entity
scoreboard objectives add sulstalk_pickup_delay dummy ""
execute as @e[type=item] if data entity @s {Item:{components:{"minecraft:item_model":"minecraft:air"}}} store result score @s sulstalk_pickup_delay run data get entity @s PickupDelay 1
execute as @e[type=item] if score @s sulstalk_pickup_delay matches ..20 positioned as @s run kill @s
##Failsafe to remove custom data UUID stored in items to be picked up by an entity if a player is able to pick it up beforehand
execute as @e[type=item] positioned as @s if data entity @s {PickupDelay:1s} if data entity @s Item.components.minecraft:custom_data.UUID if entity @e[type=player,distance=..5,limit=1] run data remove entity @s Item.components.minecraft:custom_data.UUID
execute as @e[type=item] positioned as @s if data entity @s {PickupDelay:1s} unless data entity @s Item.components.minecraft:custom_data[0] if entity @e[type=player,distance=..5,limit=1] run data remove entity @s Item.components.minecraft:custom_data
execute as @e[type=item] positioned as @s if data entity @s {PickupDelay:0s} if data entity @s Item.components.minecraft:custom_data.UUID if entity @e[type=player,distance=..5,limit=1] run data remove entity @s Item.components.minecraft:custom_data.UUID
execute as @e[type=item] positioned as @s if data entity @s {PickupDelay:0s} unless data entity @s Item.components.minecraft:custom_data[0] if entity @e[type=player,distance=..5,limit=1] run data remove entity @s Item.components.minecraft:custom_data

##Also failsafe for entity hitbox objects
execute as @e[tag=sulstalk_hitbox] positioned as @s unless entity @e[tag=sulstalk_spawned,distance=..10,limit=1] run kill @s

##Failsafe for blaze fireball special ability display not disappearing
execute as @e[tag=sulstalk_special_ability] positioned as @s unless entity @e[tag=sulstalk_spawned,distance=..5,limit=1] run kill @s