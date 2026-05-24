##This is a failsafe for items in progress of being modified but fall short - It is assumed the items will be transformed when near an entity
scoreboard objectives add sulstalk_pickup_delay dummy ""
execute as @e[type=item] if data entity @s {Item:{components:{"minecraft:item_model":"minecraft:air"}}} store result score @s sulstalk_pickup_delay run data get entity @s PickupDelay 1
execute as @e[type=item,scores={sulstalk_pickup_delay=-1999999999..}] if score @s sulstalk_pickup_delay matches ..1 positioned as @s if entity @e[type=player,distance=..10] run kill @s
##Also failsafe for entity hitbox objects
execute as @e[tag=sulstalk_hitbox] positioned as @s unless entity @e[tag=sulstalk_spawned,distance=..10] run kill @s