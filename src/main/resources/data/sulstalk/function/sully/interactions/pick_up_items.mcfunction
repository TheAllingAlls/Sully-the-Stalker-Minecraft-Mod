scoreboard objectives add sulstalk_can_pick_up_items trigger ""
scoreboard objectives add sulstalk_item_id trigger ""

execute unless score @s sulstalk_can_pick_up_items matches 0..1 run scoreboard players set @s sulstalk_can_pick_up_items 1

##PickupDelay is in ticks, NOT in seconds, s means short (reminder for myself)
execute if score @s sulstalk_can_pick_up_items matches 1 run execute positioned as @s as @e[type=item,tag=!sulstalk_stolen,tag=!sulstalk_dropped,distance=..10] run data merge entity @s {Tags:["sulstalk_stolen"],Item:{components:{"minecraft:custom_data":{"UUID":-1}}},PickupDelay:21s}

execute if score @s sulstalk_can_pick_up_items matches 1 run execute positioned as @s as @e[tag=sulstalk_stolen,distance=..5] unless predicate {condition:entity_scores,entity:this,scores:{sulstalk_item_id:{}}} store result entity @s Item.components.minecraft:custom_data.UUID int 1 as @e[tag=sulstalk_spawned,distance=0..1] run scoreboard players get @s sulstalk_spawned_number
execute if score @s sulstalk_can_pick_up_items matches 1 run execute positioned as @s as @e[tag=sulstalk_stolen,distance=..5] store result score @s sulstalk_item_id run data get entity @s Item.components.minecraft:custom_data.UUID 1

$execute if score @s sulstalk_can_pick_up_items matches 1 run execute positioned as @s positioned ~ ~-1 ~ as @e[tag=sulstalk_stolen,distance=..1,scores={sulstalk_item_id=$(id)}] run tp ~ ~1 ~
$execute if score @s sulstalk_can_pick_up_items matches 1 run execute positioned as @s positioned ~ ~1 ~ as @e[tag=sulstalk_stolen,distance=..1,scores={sulstalk_item_id=$(id)}] run tp ~ ~-1 ~
$execute if score @s sulstalk_can_pick_up_items matches 1 run execute positioned as @s positioned ~ ~-2 ~ as @e[tag=sulstalk_stolen,distance=..1,scores={sulstalk_item_id=$(id)}] run tp ~ ~2 ~
$execute if score @s sulstalk_can_pick_up_items matches 1 run execute positioned as @s run data modify entity @s item.components.minecraft:bundle_contents append from entity @e[tag=sulstalk_stolen,distance=0..1,limit=1,sort=nearest,scores={sulstalk_item_id=$(id)}] Item
$execute if score @s sulstalk_can_pick_up_items matches 1 run execute positioned as @s if entity @e[tag=sulstalk_stolen,distance=0..0.5,limit=1,sort=nearest,scores={sulstalk_item_id=$(id)}] run scoreboard players add @s sulstalk_health 1
$execute if score @s sulstalk_can_pick_up_items matches 1 run execute positioned as @s as @s run kill @e[tag=sulstalk_stolen,distance=0..1,limit=1,sort=nearest,scores={sulstalk_item_id=$(id)}]