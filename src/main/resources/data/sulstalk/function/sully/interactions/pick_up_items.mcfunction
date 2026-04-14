scoreboard objectives add sulstalk_item_id trigger ""

execute positioned as @s as @e[type=item,tag=!sulstalk_stolen,distance=..10] run data merge entity @s {Tags:["sulstalk_stolen"],Item:{components:{"minecraft:custom_data":{"UUID":-1}}}}

execute positioned as @s as @e[tag=sulstalk_stolen,distance=..2] store result entity @s Item.components.minecraft:custom_data.UUID int 1 as @e[tag=sulstalk_spawned,distance=0..1] run scoreboard players get @s sulstalk_spawned_number
execute positioned as @s as @e[tag=sulstalk_stolen,distance=..2] store result score @s sulstalk_item_id run data get entity @s Item.components.minecraft:custom_data.UUID 1

execute positioned as @s as @e[tag=sulstalk_stolen,distance=..2] if score @s sulstalk_item_id = @e[tag=sulstalk_spawned,distance=0..1,limit=1] sulstalk_spawned_number run tp ~ ~ ~