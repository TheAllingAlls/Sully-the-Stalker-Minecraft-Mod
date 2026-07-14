scoreboard objectives add sulstalk_hitbox_id trigger ""
scoreboard objectives add sulstalk_has_hitbox trigger ""
scoreboard objectives add sulstalk_health trigger ""
scoreboard objectives add sulstalk_attack trigger ""
scoreboard objectives add sulstalk_damaged trigger ""
scoreboard objectives add sulstalk_has_attacker trigger ""
scoreboard objectives add sulstalk_has_projectile trigger ""
scoreboard objectives add sulstalk_projectile_durability trigger ""
scoreboard objectives add sulstalk_projectile_rotation_x trigger ""
scoreboard objectives add sulstalk_projectile_rotation_y trigger ""
scoreboard objectives add sulstalk_attacker_id trigger ""
scoreboard objectives add sulstalk_attacker_motion_y trigger ""
scoreboard objectives add sulstalk_damaged_delay trigger ""
scoreboard objectives add sulstalk_interaction_delay trigger ""
scoreboard objectives add sulstalk_should_die trigger ""

execute unless score @s sulstalk_has_hitbox matches 0..1 run scoreboard players set @s sulstalk_has_hitbox 0
execute positioned as @s unless entity @e[tag=sulstalk_hitbox,distance=..8,limit=1] run scoreboard players set @s sulstalk_has_hitbox 0
##Unless I feel like changing it, entity will have 10 hearts (20 hp)
execute unless score @s sulstalk_health matches -1..20 run scoreboard players set @s sulstalk_health 20
execute unless score @s sulstalk_attack matches -1.. run scoreboard players set @s sulstalk_attack -1
execute unless score @s sulstalk_damaged matches -1..2 run scoreboard players set @s sulstalk_damaged -1
execute unless score @s sulstalk_has_attacker matches -1.. run scoreboard players set @s sulstalk_has_attacker -1
execute unless score @s sulstalk_has_projectile matches -1.. run scoreboard players set @s sulstalk_has_projectile -1
execute unless score @s sulstalk_attacker_id matches -2147483647.. run scoreboard players set @s sulstalk_attacker_id -1
execute unless score @s sulstalk_damaged_delay matches -1..10 run scoreboard players set @s sulstalk_damaged_delay -1
execute unless score @s sulstalk_interaction_delay matches -1.. run scoreboard players set @s sulstalk_interaction_delay -1
execute unless score @s sulstalk_should_die matches -1..2 run scoreboard players set @s sulstalk_should_die -1

execute positioned as @s rotated as @s unless entity @e[type=interaction,tag=sulstalk_hitbox,distance=..2] unless score @s sulstalk_has_hitbox matches 1 run summon interaction ~ ~ ~ {Tags:["sulstalk_hitbox"],OnGround:0b}
execute positioned as @s as @e[tag=sulstalk_hitbox,distance=..1] unless score @s sulstalk_hitbox_id matches -2147483647.. store result score @s sulstalk_hitbox_id as @e[tag=sulstalk_spawned,distance=..0.1] unless score @s sulstalk_has_hitbox matches 1 run scoreboard players get @s sulstalk_spawned_number
$execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] as @e[tag=sulstalk_spawned,distance=..0.1,limit=1] run scoreboard players set @s sulstalk_has_hitbox 0
$execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] as @e[tag=sulstalk_spawned,distance=..0.1,limit=1] unless score @s sulstalk_has_hitbox matches 1 run scoreboard players set @s sulstalk_has_hitbox 1

$execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,scores={sulstalk_hitbox_id=$(id)}] if data entity @s attack as @e[tag=sulstalk_spawned,distance=..0.1,limit=1] if score @s sulstalk_damaged_delay matches -1 run scoreboard players set @s sulstalk_has_attacker 1
$execute positioned as @s store result score @s sulstalk_attacker_id as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,scores={sulstalk_hitbox_id=$(id)}] if data entity @s attack on attacker run data get entity @s UUID[0]
execute if predicate {condition:entity_scores,entity:this,scores:{sulstalk_attacker_id:{}}} store result entity @s data.attacker_id int 1 run scoreboard players get @s sulstalk_attacker_id
execute unless predicate {condition:entity_scores,entity:this,scores:{sulstalk_attacker_id:{}}} run data modify entity @s data.attacker_id set value -1
$execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,scores={sulstalk_hitbox_id=$(id)}] if data entity @s attack on attacker unless score @s sulstalk_attacker_id matches -2147483647.. store result score @s sulstalk_attacker_id run data get entity @s UUID[0]
execute positioned as @s if score @s sulstalk_interaction_delay matches ..0 as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10] run data merge entity @s {width:1.1f,height:3.05f}
$execute positioned as @s as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,scores={sulstalk_hitbox_id=$(id)}] positioned ~ ~-1.75 ~ run tp ~ ~ ~

##Attempt to allow right-clicking entity

$execute positioned as @s if score @s sulstalk_interaction_delay matches 0 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,scores={sulstalk_hitbox_id=$(id)}] if data entity @s interaction run data merge entity @s {width:0.0f,height:0.0f}
$execute positioned as @s if score @s sulstalk_interaction_delay matches 0 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,scores={sulstalk_hitbox_id=$(id)}] if data entity @s interaction run scoreboard players set @e[tag=sulstalk_spawned,distance=..0.1,limit=1] sulstalk_interaction_delay -1
$execute positioned as @s unless score @s sulstalk_interaction_delay matches 0 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,scores={sulstalk_hitbox_id=$(id)}] if data entity @s interaction run data remove entity @s interaction

execute if score @s sulstalk_interaction_delay matches -1 run scoreboard players set @s sulstalk_interaction_delay 4
execute if score @s sulstalk_interaction_delay matches 1.. run scoreboard players remove @s sulstalk_interaction_delay 1
####

execute positioned as @s if score @s sulstalk_damaged matches -1 run scoreboard players set @s sulstalk_damaged 0
execute positioned as @s if score @s sulstalk_should_die matches -1 run scoreboard players set @s sulstalk_should_die 0
$execute positioned as @s if score @s sulstalk_damaged_delay matches -1 if score @s sulstalk_has_attacker matches 1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] as @e[tag=sulstalk_spawned,distance=..0.1,limit=1] run scoreboard players set @s sulstalk_damaged 1
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 store result score @s sulstalk_attack as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker run attribute @s minecraft:attack_damage get
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_attack matches 2.. run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if data entity @s {abilities:{invulnerable:0b}} run item modify entity @s weapon.mainhand [{function:set_damage,damage:-0.005,add:true}]
execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 if score @s sulstalk_attack matches 1.. run scoreboard players operation @s sulstalk_health -= @s sulstalk_attack

##Projectile detection and damage
execute positioned as @s as @e[type=#minecraft:impact_projectiles,sort=nearest] unless score @s sulstalk_projectile_rotation_x matches -2147483647.. store result score @s sulstalk_projectile_rotation_x on origin run data get entity @s Rotation[0] 10000
execute positioned as @s as @e[type=#minecraft:impact_projectiles,sort=nearest] unless score @s sulstalk_projectile_rotation_y matches -2147483647.. store result score @s sulstalk_projectile_rotation_y on origin run data get entity @s Rotation[1] 10000

execute positioned as @s positioned ~ ~ ~ if score @s sulstalk_has_hitbox matches 1 run execute as @e[type=#minecraft:impact_projectiles,type=!firework_rocket,tag=!sulstalk_special_ability,sort=nearest,limit=1,distance=..1] unless data entity @s {Motion:[0.0d,0.0d,0.0d]} run tag @s add sulstalk_projectile
execute positioned as @s positioned ~ ~1 ~ if score @s sulstalk_has_hitbox matches 1 run execute as @e[type=#minecraft:impact_projectiles,type=!firework_rocket,tag=!sulstalk_special_ability,sort=nearest,limit=1,distance=..1] unless data entity @s {Motion:[0.0d,0.0d,0.0d]} run tag @s add sulstalk_projectile
execute positioned as @s positioned ~ ~-1 ~ if score @s sulstalk_has_hitbox matches 1 run execute as @e[type=#minecraft:impact_projectiles,type=!firework_rocket,tag=!sulstalk_special_ability,sort=nearest,limit=1,distance=..1] unless data entity @s {Motion:[0.0d,0.0d,0.0d]} run tag @s add sulstalk_projectile
execute positioned as @s positioned ~1 ~ ~ if score @s sulstalk_has_hitbox matches 1 run execute as @e[type=#minecraft:impact_projectiles,type=!firework_rocket,tag=!sulstalk_special_ability,sort=nearest,limit=1,distance=..1] unless data entity @s {Motion:[0.0d,0.0d,0.0d]} run tag @s add sulstalk_projectile
execute positioned as @s positioned ~-1 ~ ~ if score @s sulstalk_has_hitbox matches 1 run execute as @e[type=#minecraft:impact_projectiles,type=!firework_rocket,tag=!sulstalk_special_ability,sort=nearest,limit=1,distance=..1] unless data entity @s {Motion:[0.0d,0.0d,0.0d]} run tag @s add sulstalk_projectile
execute positioned as @s positioned ~ ~ ~1 if score @s sulstalk_has_hitbox matches 1 run execute as @e[type=#minecraft:impact_projectiles,type=!firework_rocket,tag=!sulstalk_special_ability,sort=nearest,limit=1,distance=..1] unless data entity @s {Motion:[0.0d,0.0d,0.0d]} run tag @s add sulstalk_projectile
execute positioned as @s positioned ~ ~ ~-1 if score @s sulstalk_has_hitbox matches 1 run execute as @e[type=#minecraft:impact_projectiles,type=!firework_rocket,tag=!sulstalk_special_ability,sort=nearest,limit=1,distance=..1] unless data entity @s {Motion:[0.0d,0.0d,0.0d]} run tag @s add sulstalk_projectile

execute positioned as @s if score @s sulstalk_has_hitbox matches 1 if score @s sulstalk_damaged_delay matches -1 if score @s sulstalk_has_attacker matches ..0 run execute if entity @e[tag=sulstalk_projectile,distance=..2.25] run scoreboard players set @s sulstalk_has_projectile 1
execute positioned as @s unless entity @e[tag=sulstalk_projectile,distance=..2.25] run scoreboard players set @s sulstalk_has_projectile 0

execute positioned as @s if score @s sulstalk_has_projectile matches 1 run execute store result score @s sulstalk_attack as @e[tag=sulstalk_projectile,distance=..2.25] run data get entity @s damage 2
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged_delay matches -1 run scoreboard players set @s sulstalk_damaged 1

execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,distance=..2.25] if data entity @s item.components.minecraft:damage unless score @s sulstalk_projectile_durability matches -2147483647.. store result score @s sulstalk_projectile_durability run data get entity @s item.components.minecraft:damage
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,distance=..2.25] if score @s sulstalk_projectile_durability matches -2147483647.. run scoreboard players add @s sulstalk_projectile_durability 1
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,distance=..2.25] if score @s sulstalk_projectile_durability matches -2147483647.. store result entity @s item.components.minecraft:damage int 1 run scoreboard players get @s sulstalk_projectile_durability
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,distance=..2.25] if score @s sulstalk_projectile_durability matches -2147483647.. run scoreboard players reset @s sulstalk_projectile_durability
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute if score @s sulstalk_attack matches 1.. run scoreboard players operation @s sulstalk_health -= @s sulstalk_attack

execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,distance=..2.25] store result entity @s Rotation[0] float 0.0001 run scoreboard players get @s sulstalk_projectile_rotation_x
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,distance=..2.25] store result entity @s Rotation[1] float 0.0001 run scoreboard players get @s sulstalk_projectile_rotation_y
$execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,distance=..2.25] if score @s sulstalk_projectile_rotation_x matches -2147483647.. if score @s sulstalk_projectile_rotation_y matches -2147483647.. rotated as @s as @e[limit=1,distance=..0.5,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] positioned ^ ^-1 ^4 run tp ~ ~ ~
$execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,distance=..2.25] unless score @s sulstalk_projectile_rotation_x matches -2147483647.. unless score @s sulstalk_projectile_rotation_y matches -2147483647.. as @e[limit=1,distance=..0.5,tag=sulstalk_spawned,scores={sulstalk_spawned_number=$(id)}] facing entity @e[tag=sulstalk_projectile,distance=..2.25] feet positioned ^ ^-1 ^-4 run tp ~ ~ ~
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,type=#minecraft:arrows,distance=..6,sort=nearest] if data entity @s {PierceLevel:0b} run kill @s
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,type=!#minecraft:arrows,distance=..6,sort=nearest] if data entity @s {PierceLevel:0b} store result entity @s Motion[0] double 0.00001 run data get entity @s Motion[0] -10000
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,type=!#minecraft:arrows,distance=..6,sort=nearest] if data entity @s {PierceLevel:0b} store result entity @s Motion[1] double 0.00001 run data get entity @s Motion[1] -10000
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,type=!#minecraft:arrows,distance=..6,sort=nearest] if data entity @s {PierceLevel:0b} store result entity @s Motion[2] double 0.00001 run data get entity @s Motion[2] -10000
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,type=!#minecraft:arrows,distance=..6,sort=nearest] unless data entity @s PierceLevel store result entity @s Motion[0] double 0.00001 run data get entity @s Motion[0] -10000
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,type=!#minecraft:arrows,distance=..6,sort=nearest] unless data entity @s PierceLevel store result entity @s Motion[1] double 0.00001 run data get entity @s Motion[1] -10000
execute positioned as @s if score @s sulstalk_has_projectile matches 1 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_projectile,type=!#minecraft:arrows,distance=..6,sort=nearest] unless data entity @s PierceLevel store result entity @s Motion[2] double 0.00001 run data get entity @s Motion[2] -10000
execute positioned as @s as @e[tag=sulstalk_projectile,distance=..6,sort=nearest] if data entity @s {Motion:[0.0d,0.0d,0.0d]} run tag @s remove sulstalk_projectile
####

execute if score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 run scoreboard players set @s sulstalk_can_pick_up_items 0
execute positioned as @s if score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 run summon item ~ ~-0.5 ~ {Tags:["sulstalk_dropped"],Item:{count:1,id:"minecraft:stick",components:{"minecraft:item_model":"minecraft:air"}},PickupDelay:20s}
execute positioned as @s if score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 run execute as @e[tag=sulstalk_dropped,type=item,limit=1,distance=..0.5] run data modify entity @s Item set from entity @e[tag=sulstalk_spawned,distance=..0.1,limit=1] item.components.minecraft:bundle_contents[-1]
execute positioned as @s if score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 run execute as @e[tag=!sulstalk_dropped,type=item,limit=1,distance=..0.5] run data remove entity @s Item.components.minecraft:custom_data
execute positioned as @s if score @s sulstalk_should_die matches 0 if score @s sulstalk_damaged matches 1 run data remove entity @s item.components.minecraft:bundle_contents[-1]

$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 unless score @s sulstalk_is_following_entity matches 1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker rotated as @s positioned ^ ^ ^5 positioned ~ ~3 ~ as @e[tag=sulstalk_spawned,distance=..100,scores={sulstalk_spawned_number=$(id)}] run tp ~ ~ ~
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 if score @s sulstalk_is_following_entity matches 1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker rotated as @s positioned ^ ^ ^2 positioned ~ ~1 ~ as @e[tag=sulstalk_spawned,distance=..100,scores={sulstalk_spawned_number=$(id)}] run tp ~ ~ ~

##Mace functionality
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace store result score @s sulstalk_attacker_motion_y run data get entity @s Motion[1] 10000
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run effect give @s resistance 1 255 true
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace[enchantments={wind_burst:1}] if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run effect give @s resistance 2 255 true
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace[enchantments={wind_burst:2}] if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run effect give @s resistance 3 255 true
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace[enchantments={wind_burst:3}] if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run effect give @s resistance 5 255 true
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace if score @s sulstalk_attacker_motion_y matches ..-5000 run damage @s 1 cramming
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run summon wind_charge ~ ~-0.001 ~ {Motion:[0.0d,10.0d,0.0d]}
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace[enchantments={wind_burst:1}] if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run summon breeze_wind_charge ~ ~-0.001 ~ {Motion:[0.0d,10.0d,0.0d]}
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace[enchantments={wind_burst:2}] if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run summon breeze_wind_charge ~ ~-0.001 ~ {Motion:[0.0d,10.0d,0.0d]}
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace[enchantments={wind_burst:2}] if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run summon breeze_wind_charge ~ ~-0.001 ~ {Motion:[0.0d,10.0d,0.0d]}
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace[enchantments={wind_burst:3}] if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run summon breeze_wind_charge ~ ~-0.001 ~ {Motion:[0.0d,10.0d,0.0d]}
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace[enchantments={wind_burst:3}] if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run summon breeze_wind_charge ~ ~-0.001 ~ {Motion:[0.0d,10.0d,0.0d]}
$execute positioned as @s if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] on attacker if items entity @s weapon.mainhand minecraft:mace[enchantments={wind_burst:3}] if score @s sulstalk_attacker_motion_y matches ..-5000 positioned as @s run summon breeze_wind_charge ~ ~-0.001 ~ {Motion:[0.0d,10.0d,0.0d]}
####

##Related to sulstalk:sully/interactions/entity_to_entity/entity_logic
execute positioned as @s if score @s sulstalk_damaged matches 1 if score @s sulstalk_attack matches ..4 run scoreboard players set @s sulstalk_follow_priority 6
execute positioned as @s if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_following_entity_forget matches 100.. if score @s sulstalk_damaged matches 1 if score @s sulstalk_attack matches 1..4 run scoreboard players remove @s sulstalk_following_entity_forget 100
execute positioned as @s if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_following_entity_forget matches 1.. if score @s sulstalk_damaged matches 1 if score @s sulstalk_attack matches 5.. run scoreboard players remove @s sulstalk_following_entity_forget 200
execute positioned as @s if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_following_entity_forget matches 1.. if score @s sulstalk_damaged matches 1 if score @s sulstalk_attack matches 7.. run scoreboard players remove @s sulstalk_following_entity_forget 200
####

execute if score @s sulstalk_should_die matches 1.. run scoreboard players set @s sulstalk_can_pick_up_items 0
execute positioned as @s if score @s sulstalk_should_die matches 1 run summon item ~ ~1.5 ~ {Motion:[0.0d,0.15d,0.0d],Tags:["sulstalk_dropped"],Item:{count:1,id:"minecraft:stick",components:{"minecraft:item_model":"minecraft:air"}},PickupDelay:40s}
execute positioned as @s if score @s sulstalk_should_die matches 1 run execute as @e[tag=sulstalk_dropped,type=item,limit=1,distance=..1.5] run data modify entity @s Item set from entity @e[tag=sulstalk_spawned,distance=..0.1,limit=1] item.components.minecraft:bundle_contents[-1]
execute positioned as @s if score @s sulstalk_should_die matches 1 run execute as @e[tag=!sulstalk_dropped,type=item,limit=1,distance=..1.5] run data remove entity @s Item.components.minecraft:custom_data
execute positioned as @s if score @s sulstalk_should_die matches 1 run data remove entity @s item.components.minecraft:bundle_contents[-1]
execute positioned as @s if score @s sulstalk_should_die matches 1 unless data entity @s item.components.minecraft:bundle_contents[-1] run scoreboard players set @s sulstalk_should_die 2

execute if score @s sulstalk_should_die matches 1.. run scoreboard players set @s sulstalk_following_entity_forget 0

execute if score @s sulstalk_damaged matches 0 if score @s sulstalk_damaged_delay matches 0.. run scoreboard players remove @s sulstalk_damaged_delay 1
execute if score @s sulstalk_damaged matches 1 if score @s sulstalk_damaged_delay matches -1 run scoreboard players set @s sulstalk_damaged_delay 10
execute if score @s sulstalk_damaged_delay matches 10 if score @s sulstalk_damaged matches 1 run scoreboard players set @s sulstalk_damaged 2
$execute positioned as @s unless score @s sulstalk_damaged_delay matches -1 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] run data remove entity @s attack

execute if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged matches 2 run data remove entity @s attack
execute if score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged matches 2 run scoreboard players set @s sulstalk_has_attacker 0
execute unless score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged matches 2 run scoreboard players set @s sulstalk_attacker_id -1
execute unless score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged matches 2 run scoreboard players set @s sulstalk_attack 0
execute if score @s sulstalk_damaged matches 2 if score @s sulstalk_has_projectile matches 1 run scoreboard players set @s sulstalk_has_projectile 0
execute unless score @s sulstalk_has_attacker matches 1 if score @s sulstalk_damaged matches 2 run scoreboard players set @s sulstalk_damaged 0

execute if score @s sulstalk_should_die matches ..0 unless score @s sulstalk_damaged matches 1 run scoreboard players set @s sulstalk_can_pick_up_items 1

execute if score @s sulstalk_health matches ..0 if score @s sulstalk_should_die matches ..0 run scoreboard players set @s sulstalk_should_die 1
$execute positioned as @s if score @s sulstalk_should_die matches 2 run execute as @e[tag=sulstalk_hitbox,sort=nearest,distance=..10,limit=1,scores={sulstalk_hitbox_id=$(id)}] run kill @s

execute if score @s sulstalk_health matches ..0 if score @s sulstalk_should_die matches ..0 run scoreboard players set @s sulstalk_should_die 1
execute if score @s sulstalk_should_die matches 2 run kill @s