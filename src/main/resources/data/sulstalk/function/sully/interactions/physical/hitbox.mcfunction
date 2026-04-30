data merge entity @s {width:0.65f,height:2.4f}
#data modify entity @s Pos set from entity @e[tag=sulstalk_spawned,limit=1,sort=nearest] Pos
#ride @s mount @e[tag=sulstalk_hitbox_offset,limit=1,sort=nearest]
execute at @e[tag=sulstalk_spawned,limit=1,sort=nearest] positioned ~ ~-1 ~ positioned ^ ^ ^-0.25 run tp ~ ~ ~

execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches 1 run tellraw @a "sulstalk_damaged 1"
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches 0 run tellraw @a "sulstalk_damaged 0"

execute if data entity @s attack.player if score @s sulstalk_damaged_delay matches -1 run scoreboard players set @e[tag=sulstalk_spawned,limit=1,sort=nearest] sulstalk_damaged 1
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] sulstalk_damaged matches 1 run scoreboard players set @s sulstalk_damaged_delay 10
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] store result score @s sulstalk_damaged_by as @e[tag=sulstalk_hitbox,limit=1,sort=nearest] on attacker run data get entity @s UUID[0]

#execute positioned as @s on attacker rotated as @s positioned ^ ^ ^5 as @e[tag=sulstalk_spawned,limit=1,sort=nearest] run tp ~ ~ ~
#execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches 1 run summon item ~ ~-0.5 ~ {Tags:["sulstalk_stolen","sulstalk_dropped"],Item:{count:1,id:"minecraft:stick",components:{"item_model":"minecraft:air"}},PickupDelay:1s}
#execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches 1 as @e[tag=sulstalk_stolen,tag=sulstalk_dropped,type=item,limit=1,sort=nearest] run data modify entity @s Item set from entity @e[tag=sulstalk_spawned,limit=1,sort=nearest] item.components.minecraft:bundle_contents[-1]
#execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches 1 run tellraw @a "a"
#execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches 1 run data remove entity @s item.components.minecraft:bundle_contents[-1]