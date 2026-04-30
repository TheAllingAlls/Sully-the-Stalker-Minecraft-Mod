scoreboard objectives add sulstalk_hitbox_id trigger ""
scoreboard objectives add sulstalk_has_hitbox trigger ""
scoreboard objectives add sulstalk_health trigger ""
scoreboard objectives add sulstalk_damaged trigger ""
scoreboard objectives add sulstalk_damaged_by trigger ""
scoreboard objectives add sulstalk_damaged_delay trigger ""
scoreboard objectives add sulstalk_should_die trigger ""

execute unless score @s sulstalk_has_hitbox matches 0..1 run scoreboard players set @s sulstalk_has_hitbox 0
execute positioned as @s unless score @e[tag=sulstalk_hitbox,distance=..1,limit=1] sulstalk_hitbox_id = @s sulstalk_spawned_number run scoreboard players set @s sulstalk_has_hitbox 0
##Unless I feel like changing it, entity will have 10 hearts (20 hp)
execute unless score @s sulstalk_health matches -1..20 run scoreboard players set @s sulstalk_health 20
execute unless score @s sulstalk_damaged matches -1..1 run scoreboard players set @s sulstalk_damaged -1
execute unless score @s sulstalk_damaged_by matches -999999999.. run scoreboard players set @s sulstalk_damaged_by -1
execute unless score @s sulstalk_damaged_delay matches -1..10 run scoreboard players set @s sulstalk_damaged_delay -1
execute unless score @s sulstalk_should_die matches 0..1 run scoreboard players set @s sulstalk_should_die 0

# execute positioned as @s unless entity @e[type=marker,tag=sulstalk_hitbox_offset,distance=..3] run summon marker ~ ~ ~ {Tags:["sulstalk_hitbox_offset"],OnGround:0b}
# execute positioned as @s as @e[tag=sulstalk_hitbox_offset,limit=1,sort=nearest] run tp ~ ~-2 ~

execute positioned as @s rotated as @s unless entity @e[type=interaction,tag=sulstalk_hitbox,distance=..2] unless score @s sulstalk_has_hitbox matches 1 run summon interaction ~ ~ ~ {Tags:["sulstalk_hitbox"],OnGround:0b}
execute positioned as @s as @e[tag=sulstalk_hitbox,distance=..2,limit=1] unless score @s sulstalk_hitbox_id matches -999999999.. store result score @s sulstalk_hitbox_id as @e[tag=sulstalk_spawned,distance=..1] run scoreboard players get @s sulstalk_spawned_number
execute positioned as @s as @e[tag=sulstalk_hitbox,distance=..2] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,distance=..1,limit=1] sulstalk_spawned_number as @e[tag=sulstalk_spawned,distance=..1] run scoreboard players set @s sulstalk_has_hitbox 1
execute positioned as @s rotated as @s as @e[tag=sulstalk_hitbox,sort=nearest] if score @s sulstalk_hitbox_id = @e[tag=sulstalk_spawned,limit=1,sort=nearest] sulstalk_spawned_number run function sulstalk:sully/interactions/physical/hitbox