scoreboard objectives add sulstalk_item_id trigger ""

execute positioned as @s as @e[type=item,tag=!sulstalk_stolen,distance=..10] run data merge entity @s {Tags:["sulstalk_stolen"],Item:{components:{"minecraft:custom_data":{"UUID":-1}}}}

execute positioned as @s as @e[tag=sulstalk_stolen,distance=..2] unless score @s sulstalk_item_id matches -999999999..999999999 store result entity @s Item.components.minecraft:custom_data.UUID int 1 as @e[tag=sulstalk_spawned,distance=0..1] run scoreboard players get @s sulstalk_spawned_number
execute positioned as @s as @e[tag=sulstalk_stolen,distance=..2] store result score @s sulstalk_item_id run data get entity @s Item.components.minecraft:custom_data.UUID 1

execute positioned as @s as @e[tag=sulstalk_stolen,distance=..2] if score @s sulstalk_item_id = @e[tag=sulstalk_spawned,distance=0..1,limit=1,sort=nearest] sulstalk_spawned_number run tp ~ ~ ~
execute positioned as @s if score @e[tag=sulstalk_stolen,distance=0..1,limit=1,sort=nearest] sulstalk_item_id = @s sulstalk_spawned_number run data modify entity @s item.components.minecraft:bundle_contents append from entity @e[tag=sulstalk_stolen,distance=0..1,limit=1,sort=nearest] Item
execute positioned as @s as @s if score @e[tag=sulstalk_stolen,distance=0..1,limit=1,sort=nearest] sulstalk_item_id = @s sulstalk_spawned_number run kill @e[tag=sulstalk_stolen,distance=0..1,limit=1,sort=nearest]