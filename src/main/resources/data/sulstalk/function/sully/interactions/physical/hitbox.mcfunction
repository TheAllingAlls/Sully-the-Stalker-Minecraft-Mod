data merge entity @s {width:0.65f,height:2.4f}
#data modify entity @s Pos set from entity @e[tag=sulstalk_spawned,limit=1,sort=nearest] Pos
#ride @s mount @e[tag=sulstalk_hitbox_offset,limit=1,sort=nearest]
execute at @e[tag=sulstalk_spawned,limit=1,sort=nearest] positioned ~ ~-1 ~ positioned ^ ^ ^-0.25 run tp ~ ~ ~

execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches -1 run scoreboard players set @s sulstalk_damaged 0

execute if data entity @s attack.player as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged_delay matches -1 run scoreboard players set @s sulstalk_damaged 1
execute if data entity @s attack.player store result score @e[tag=sulstalk_spawned,limit=1,sort=nearest] sulstalk_attack on attacker run attribute @s minecraft:attack_damage get
execute if data entity @s attack.player as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged_delay matches -1 if score @s sulstalk_attack matches 1.. run scoreboard players operation @s sulstalk_health -= @s sulstalk_attack
execute if data entity @s attack.player positioned as @s on attacker rotated as @s positioned ^ ^ ^5 positioned ~ ~3 ~ as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged_delay matches -1 run tp ~ ~ ~

execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] unless score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 run summon item ~ ~-0.5 ~ {Tags:["sulstalk_stolen","sulstalk_dropped"],Item:{count:1,id:"minecraft:stick",components:{"item_model":"minecraft:air"}},PickupDelay:1s}
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] unless score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 as @e[tag=sulstalk_stolen,tag=sulstalk_dropped,type=item,limit=1,sort=nearest] run data modify entity @s Item set from entity @e[tag=sulstalk_spawned,limit=1,sort=nearest] item.components.minecraft:bundle_contents[-1]
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] unless score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 run data remove entity @s item.components.minecraft:bundle_contents[-1]

##From sulstalk:sully/interactions/entity_to_entity/target_entity_logic
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_following_entity_forget matches 100.. if score @s sulstalk_damaged matches 1 run scoreboard players remove @s sulstalk_following_entity_forget 100

execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_should_die matches 1 run summon item ~ ~1.5 ~ {Motion:[0.0d,0.15d,0.0d],Tags:["sulstalk_stolen","sulstalk_dropped"],Item:{count:1,id:"minecraft:stick",components:{"minecraft:item_model":"minecraft:air"}},PickupDelay:1s}
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_should_die matches 1 as @e[tag=sulstalk_stolen,tag=sulstalk_dropped,type=item,limit=1,sort=nearest] run data modify entity @s Item.id set from entity @e[tag=sulstalk_spawned,limit=1,sort=nearest] item.components.minecraft:bundle_contents[-1].
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_should_die matches 1 as @e[tag=sulstalk_stolen,tag=sulstalk_dropped,type=item,limit=1,sort=nearest] run data modify entity @s Item.components.minecraft:item_model set from entity @e[tag=sulstalk_spawned,limit=1,sort=nearest] item.components.minecraft:bundle_contents[-1].components.minecraft:item_model
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_should_die matches 1 as @e[tag=sulstalk_stolen,tag=sulstalk_dropped,type=item] run data remove entity @s Item.components.minecraft:custom_data
# execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_should_die matches 1 as @e[tag=sulstalk_stolen,type=item,limit=1,sort=nearest] run data modify entity @s Item.id set from entity @e[tag=sulstalk_spawned,limit=1,sort=nearest] item.components.minecraft:bundle_contents[-1].id
# execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_should_die matches 1 as @e[tag=sulstalk_stolen,type=item,limit=1,sort=nearest] run data modify entity @s Item.components.minecraft:item_model set from entity @e[tag=sulstalk_spawned,limit=1,sort=nearest] item.components.minecraft:bundle_contents[-1].components.minecraft:item_model
# execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_should_die matches 1 as @e[tag=sulstalk_stolen,type=item,limit=1,sort=nearest] run data merge entity @s {Tags:["sulstalk_stolen","sulstalk_dropped"]}
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_should_die matches 1 run data remove entity @s item.components.minecraft:bundle_contents[-1]
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_should_die matches 1.. as @e[type=item,sort=nearest,distance=..5] if data entity @s {Item:{components:{"minecraft:item_model":"minecraft:air"}}} run kill @s
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_should_die matches 1 unless data entity @s item.components.minecraft:bundle_contents[-1] run scoreboard players set @s sulstalk_should_die 2

execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches 0 if score @s sulstalk_damaged_delay matches 0.. run scoreboard players remove @s sulstalk_damaged_delay 1
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches 1 if score @s sulstalk_damaged_delay matches -1 run scoreboard players set @s sulstalk_damaged_delay 10
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged_delay matches 10 if score @s sulstalk_damaged matches 1 run scoreboard players set @s sulstalk_damaged 2
execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] unless score @s sulstalk_damaged_delay matches -1 as @e[tag=sulstalk_hitbox,limit=1,sort=nearest,distance=..2] run data remove entity @s attack.player

execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] store result score @s sulstalk_damaged_by as @e[tag=sulstalk_hitbox,limit=1,sort=nearest] on attacker run data get entity @s UUID[0]
execute if data entity @s attack.player if score @e[tag=sulstalk_spawned,limit=1,sort=nearest] sulstalk_damaged matches 2 run data remove entity @s attack.player
execute unless data entity @s attack.player as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches 2 run scoreboard players set @s sulstalk_attack 0
execute unless data entity @s attack.player as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_damaged matches 2 run scoreboard players set @s sulstalk_damaged 0

execute as @e[tag=sulstalk_spawned,limit=1,sort=nearest] if score @s sulstalk_health matches ..0 if score @s sulstalk_should_die matches ..0 run scoreboard players set @s sulstalk_should_die 1
execute if score @e[tag=sulstalk_spawned,limit=1,sort=nearest] sulstalk_should_die matches 2 run kill @s