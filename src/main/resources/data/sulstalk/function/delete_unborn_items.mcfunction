##This is a failsafe for items in progress of being modified but fall short - It is assumed the items will be transformed when near an entity
execute as @e[type=item] if data entity @s {Item:{components:{"minecraft:item_model":"minecraft:air"}},PickupDelay:0s} positioned as @s if entity @e[type=player,distance=..2] run kill @s
##Also failsafe for entity hitbox objects
execute as @e[tag=sulstalk_hitbox] positioned as @s unless entity @e[tag=sulstalk_spawned,distance=..10] run kill @s