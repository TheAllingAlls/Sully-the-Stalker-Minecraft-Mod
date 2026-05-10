##This is a failsafe for items in progress of being modified but fall short - It is assumed the items will be transformed when near an entity
execute as @e[type=item] if data entity @s {Item:{components:{"minecraft:item_model":"minecraft:air"}}} positioned as @s unless entity @e[tag=sulstalk_spawned,limit=1,distance=..5] run kill @s
##Also failsafe for entity hitbox objects
execute as @e[tag=sulstalk_hitbox,limit=1] positioned as @s unless entity @e[tag=sulstalk_spawned,distance=..100] run kill @s