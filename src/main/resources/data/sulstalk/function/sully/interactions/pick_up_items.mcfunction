scoreboard objectives add sulstalk_can_pick_up_items trigger ""
scoreboard objectives add sulstalk_item_id trigger ""

execute unless score @s sulstalk_can_pick_up_items matches 0..1 run scoreboard players set @s sulstalk_can_pick_up_items 1
execute if score @s sulstalk_can_pick_up_items matches 0 unless score @s sulstalk_should_die matches 1.. run scoreboard players set @s sulstalk_can_pick_up_items 1
execute if score @s sulstalk_can_pick_up_items matches 1 if score @s sulstalk_should_die matches 1.. run scoreboard players set @s sulstalk_can_pick_up_items 0

execute if score @s sulstalk_can_pick_up_items matches 1 positioned as @s as @e[type=item,tag=!sulstalk_stolen,tag=!sulstalk_dropped,distance=..10] run data merge entity @s {Tags:["sulstalk_stolen"],Item:{components:{"minecraft:custom_data":{"UUID":-1}}}}

##Extra addition to remove custom data when item is near a player (quality of life for players)
execute positioned as @s as @e[tag=sulstalk_stolen] if entity @e[type=player,distance=..2] run data remove entity @s Item.components.minecraft:custom_data

execute if score @s sulstalk_can_pick_up_items matches 1 positioned as @s as @e[tag=sulstalk_stolen,distance=..2] unless score @s sulstalk_item_id matches -999999999..999999999 store result entity @s Item.components.minecraft:custom_data.UUID int 1 as @e[tag=sulstalk_spawned,distance=0..1] run scoreboard players get @s sulstalk_spawned_number
execute if score @s sulstalk_can_pick_up_items matches 1 positioned as @s as @e[tag=sulstalk_stolen,distance=..2] store result score @s sulstalk_item_id run data get entity @s Item.components.minecraft:custom_data.UUID 1

execute if score @s sulstalk_can_pick_up_items matches 1 positioned as @s as @e[tag=sulstalk_stolen,distance=..2] if score @s sulstalk_item_id = @e[tag=sulstalk_spawned,distance=0..1,limit=1,sort=nearest] sulstalk_spawned_number run tp ~ ~ ~
execute if score @s sulstalk_can_pick_up_items matches 1 positioned as @s if score @e[tag=sulstalk_stolen,distance=0..1,limit=1,sort=nearest] sulstalk_item_id = @s sulstalk_spawned_number run data modify entity @s item.components.minecraft:bundle_contents append from entity @e[tag=sulstalk_stolen,distance=0..1,limit=1,sort=nearest] Item
execute if score @s sulstalk_can_pick_up_items matches 1 positioned as @s as @s if score @e[tag=sulstalk_stolen,distance=0..1,limit=1,sort=nearest] sulstalk_item_id = @s sulstalk_spawned_number run kill @e[tag=sulstalk_stolen,distance=0..1,limit=1,sort=nearest]