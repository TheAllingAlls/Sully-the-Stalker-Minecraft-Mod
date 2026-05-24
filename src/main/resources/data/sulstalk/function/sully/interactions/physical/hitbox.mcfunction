scoreboard objectives add sulstalk_hitbox_id trigger ""
scoreboard objectives add sulstalk_has_hitbox trigger ""
scoreboard objectives add sulstalk_health trigger ""
scoreboard objectives add sulstalk_attack trigger ""
scoreboard objectives add sulstalk_damaged trigger ""
scoreboard objectives add sulstalk_has_attacker trigger ""
scoreboard objectives add sulstalk_attacker_id trigger ""
scoreboard objectives add sulstalk_damaged_delay trigger ""
scoreboard objectives add sulstalk_should_die trigger ""

execute unless score @s sulstalk_has_hitbox matches 0..1 run scoreboard players set @s sulstalk_has_hitbox 0
# execute positioned as @s unless score @e[tag=sulstalk_hitbox,sort=nearest,limit=1] sulstalk_hitbox_id = @s sulstalk_spawned_number run scoreboard players set @s sulstalk_has_hitbox 0
execute positioned as @s unless entity @e[tag=sulstalk_hitbox,distance=..8,limit=1] run scoreboard players set @s sulstalk_has_hitbox 0
##Unless I feel like changing it, entity will have 10 hearts (20 hp)
execute unless score @s sulstalk_health matches -1..20 run scoreboard players set @s sulstalk_health 20
execute unless score @s sulstalk_attack matches -1.. run scoreboard players set @s sulstalk_attack -1
execute unless score @s sulstalk_damaged matches -1..2 run scoreboard players set @s sulstalk_damaged -1
execute unless score @s sulstalk_has_attacker matches -1.. run scoreboard players set @s sulstalk_has_attacker -1
execute unless score @s sulstalk_attacker_id matches -1999999999.. run scoreboard players set @s sulstalk_attacker_id -1
execute unless score @s sulstalk_damaged_delay matches -1..10 run scoreboard players set @s sulstalk_damaged_delay -1
execute unless score @s sulstalk_should_die matches -1..2 run scoreboard players set @s sulstalk_should_die -1

# execute positioned as @s unless entity @e[type=marker,tag=sulstalk_hitbox_offset,sort=nearest] run summon marker ~ ~ ~ {Tags:["sulstalk_hitbox_offset"],OnGround:0b}
# execute positioned as @s as @e[tag=sulstalk_hitbox_offset,limit=1,sort=nearest] run tp ~ ~-2 ~

execute positioned as @s rotated as @s unless entity @e[type=interaction,tag=sulstalk_hitbox,distance=..2] unless score @s sulstalk_has_hitbox matches 1 run summon interaction ~ ~ ~ {Tags:["sulstalk_hitbox"],OnGround:0b}
execute positioned as @s as @e[tag=sulstalk_hitbox,distance=..1] unless score @s sulstalk_hitbox_id matches -1999999999.. store result score @s sulstalk_hitbox_id as @e[tag=sulstalk_spawned,sort=nearest] unless score @s sulstalk_has_hitbox matches 1 run scoreboard players get @s sulstalk_spawned_number
execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest] unless score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number as @e[tag=sulstalk_spawned,sort=nearest,limit=1] run scoreboard players set @s sulstalk_has_hitbox 0
execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number as @e[tag=sulstalk_spawned,sort=nearest,limit=1] unless score @s sulstalk_has_hitbox matches 1 run scoreboard players set @s sulstalk_has_hitbox 1
# execute positioned as @s rotated as @s as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,limit=1,sort=nearest] sulstalk_spawned_number run function sulstalk:sully/interactions/physical/hitbox

execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number if data entity @s attack as @e[tag=sulstalk_spawned,sort=nearest,limit=1] if score @s sulstalk_damaged_delay matches -1 run scoreboard players set @s sulstalk_has_attacker 1
execute positioned as @s store result score @s sulstalk_attacker_id as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number if data entity @s attack on attacker run data get entity @s UUID[0]
execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number if data entity @s attack on attacker unless score @s sulstalk_attacker_id matches -1999999999.. store result score @s sulstalk_attacker_id run data get entity @s UUID[0]
# execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number unless data entity @s attack as @e[tag=sulstalk_spawned,sort=nearest,limit=1] run scoreboard players set @s sulstalk_has_attacker 0
# execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number unless data entity @s attack as @e[tag=sulstalk_spawned,sort=nearest,limit=1] run scoreboard players set @s sulstalk_attacker_id -1
execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number if data entity @s interaction run data remove entity @s interaction
execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number run data merge entity @s {width:0.75f,height:2.4f}
execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number positioned ~ ~-1.25 ~ run tp ~ ~ ~
execute positioned as @s if score @s sulstalk_damaged matches -1 run scoreboard players set @s sulstalk_damaged 0
execute positioned as @s if score @s sulstalk_should_die matches -1 run scoreboard players set @s sulstalk_should_die 0
execute positioned as @s if score @s sulstalk_damaged_delay matches -1 if score @s sulstalk_has_attacker matches 1 as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number as @e[tag=sulstalk_spawned,sort=nearest,limit=1] run scoreboard players set @s sulstalk_damaged 1
execute positioned as @s if score @s sulstalk_has_attacker matches 1 store result score @s sulstalk_attack as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number on attacker run attribute @s minecraft:attack_damage get
execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 if score @s sulstalk_attack matches 1.. run scoreboard players operation @s sulstalk_health -= @s sulstalk_attack

execute if score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 run scoreboard players set @s sulstalk_can_pick_up_items 0
execute positioned as @s if score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 run summon item ~ ~-0.5 ~ {Tags:["sulstalk_dropped"],Item:{count:1,id:"minecraft:stick",components:{"minecraft:item_model":"minecraft:air"}},PickupDelay:20s}
execute positioned as @s if score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 as @e[tag=sulstalk_dropped,type=item,limit=1,distance=..0.5] run data modify entity @s Item set from entity @e[tag=sulstalk_spawned,limit=1,sort=nearest] item.components.minecraft:bundle_contents[-1]
execute positioned as @s if score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 as @e[tag=!sulstalk_dropped,type=item,limit=1,distance=..0.5] run data remove entity @s Item.components.minecraft:custom_data
execute positioned as @s if score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 run data remove entity @s item.components.minecraft:bundle_contents[-1]

execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 unless score @s sulstalk_is_following_entity matches 1 as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number on attacker rotated as @s positioned ^ ^ ^5 positioned ~ ~3 ~ as @e[tag=sulstalk_spawned,sort=nearest] if score @s sulstalk_attacker_id = @e[type=player,sort=nearest,limit=1] sulstalk_attacker_id run tp ~ ~ ~
execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 if score @s sulstalk_is_following_entity matches 1 as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number on attacker rotated as @s positioned ^ ^ ^2 positioned ~ ~1 ~ as @e[tag=sulstalk_spawned,sort=nearest] if score @s sulstalk_attacker_id = @e[type=player,sort=nearest,limit=1] sulstalk_attacker_id run tp ~ ~ ~

##Related to sulstalk:sully/interactions/entity_to_entity/entity_logic
execute positioned as @s if score @s sulstalk_damaged matches 1 if score @s sulstalk_attack matches ..4 run scoreboard players set @s sulstalk_follow_priority 6
execute positioned as @s if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_following_entity_forget matches 100.. if score @s sulstalk_damaged matches 1 if score @s sulstalk_attack matches 1..4 run scoreboard players remove @s sulstalk_following_entity_forget 100
execute positioned as @s if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_following_entity_forget matches 1.. if score @s sulstalk_damaged matches 1 if score @s sulstalk_attack matches 5.. run scoreboard players remove @s sulstalk_following_entity_forget 200
execute positioned as @s if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_following_entity_forget matches 1.. if score @s sulstalk_damaged matches 1 if score @s sulstalk_attack matches 7.. run scoreboard players remove @s sulstalk_following_entity_forget 200
####

execute if score @s sulstalk_should_die matches 1.. run scoreboard players set @s sulstalk_can_pick_up_items 0
execute positioned as @s if score @s sulstalk_should_die matches 1 run summon item ~ ~1.5 ~ {Motion:[0.0d,0.15d,0.0d],Tags:["sulstalk_dropped"],Item:{count:1,id:"minecraft:stick",components:{"minecraft:item_model":"minecraft:air"}},PickupDelay:40s}
execute positioned as @s if score @s sulstalk_should_die matches 1 as @e[tag=sulstalk_dropped,type=item,limit=1,distance=..1.5] run data modify entity @s Item set from entity @e[tag=sulstalk_spawned,limit=1,sort=nearest] item.components.minecraft:bundle_contents[-1]
execute positioned as @s if score @s sulstalk_should_die matches 1 as @e[tag=!sulstalk_dropped,type=item,limit=1,distance=..1.5] run data remove entity @s Item.components.minecraft:custom_data
execute positioned as @s if score @s sulstalk_should_die matches 1 run data remove entity @s item.components.minecraft:bundle_contents[-1]
execute positioned as @s if score @s sulstalk_should_die matches 1 unless data entity @s item.components.minecraft:bundle_contents[-1] run scoreboard players set @s sulstalk_should_die 2

execute if score @s sulstalk_should_die matches 1.. run scoreboard players set @s sulstalk_following_entity_forget 0

execute if score @s sulstalk_damaged matches 0 if score @s sulstalk_damaged_delay matches 0.. run scoreboard players remove @s sulstalk_damaged_delay 1
execute if score @s sulstalk_damaged matches 1 if score @s sulstalk_damaged_delay matches -1 run scoreboard players set @s sulstalk_damaged_delay 10
execute if score @s sulstalk_damaged_delay matches 10 if score @s sulstalk_damaged matches 1 run scoreboard players set @s sulstalk_damaged 2
execute positioned as @s unless score @s sulstalk_damaged_delay matches -1 as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number run data remove entity @s attack

execute if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged matches 2 run data remove entity @s attack
execute if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged matches 2 run scoreboard players set @s sulstalk_has_attacker 0
execute unless score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged matches 2 run scoreboard players set @s sulstalk_attacker_id -1
execute unless score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged matches 2 run scoreboard players set @s sulstalk_attack 0
execute unless score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged matches 2 run scoreboard players set @s sulstalk_damaged 0

execute if score @s sulstalk_should_die matches ..0 unless score @s sulstalk_damaged matches 1 run scoreboard players set @s sulstalk_can_pick_up_items 1

execute if score @s sulstalk_health matches ..0 if score @s sulstalk_should_die matches ..0 run scoreboard players set @s sulstalk_should_die 1
execute positioned as @s if score @s sulstalk_should_die matches 2 as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,sort=nearest,limit=1] sulstalk_spawned_number run kill @s

execute if score @s sulstalk_health matches ..0 if score @s sulstalk_should_die matches ..0 run scoreboard players set @s sulstalk_should_die 1
execute if score @s sulstalk_should_die matches 2 run kill @s