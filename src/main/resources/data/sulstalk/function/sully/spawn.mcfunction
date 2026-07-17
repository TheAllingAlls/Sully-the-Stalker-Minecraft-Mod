scoreboard objectives add sulstalk_spawn_chance trigger ""
scoreboard objectives add sulstalk_spawned_number trigger ""
execute as @e[tag=sulstalk_storage] if entity @e[tag=sulstalk_spawned,limit=1] store result score @s sulstalk_spawn run execute if entity @e[tag=sulstalk_spawned]
execute as @e[tag=sulstalk_storage] unless entity @e[tag=sulstalk_spawned] run scoreboard players set @s sulstalk_spawn 0
execute as @e[tag=sulstalk_storage] if score @s sulstalk_spawn >= @s sulstalk_spawn_max run scoreboard players set @s sulstalk_can_spawn 0
execute as @e[tag=sulstalk_storage] if score @s sulstalk_spawn < @s sulstalk_spawn_max run scoreboard players set @s sulstalk_can_spawn 1
execute as @e[tag=sulstalk_storage] if score @s sulstalk_spawn > @s sulstalk_spawn_max run kill @e[limit=1,sort=furthest,tag=sulstalk_spawned]
execute as @e[tag=sulstalk_storage] if score @s sulstalk_can_spawn matches 1 unless entity @e[tag=sulstalk_spawning] at @r run summon item_display ~ ~ ~ {Tags:["sulstalk_spawning"]}
execute as @e[tag=sulstalk_spawning] unless score @s sulstalk_spawn_chance matches -1..1 run scoreboard players set @s sulstalk_spawn_chance -1

##RANDOM VALUE FOR SPAWN CHANCE IS IN THIS COMMAND#
execute as @e[tag=sulstalk_spawning] if score @s sulstalk_spawn_chance matches -1 store result score @s sulstalk_spawn_chance run random value 0..100
###

execute as @e[tag=sulstalk_spawning] unless score @s sulstalk_spawn_chance matches 1 run kill @s
execute as @e[tag=sulstalk_spawning] if score @s sulstalk_spawn_chance matches 1 run data merge entity @s {Tags:["sulstalk_spawned","sulstalk_unpositioned"]}
execute as @e[tag=sulstalk_spawned] store result score @s sulstalk_spawned_number run data get entity @s UUID[0]
execute as @e[tag=sulstalk_spawned] store result entity @s data.id int 1 run data get entity @s UUID[0]

execute as @e[tag=sulstalk_spawned,tag=sulstalk_unpositioned] positioned as @s run spreadplayers ~ ~ 20 100 false @s
execute as @e[tag=sulstalk_spawned,tag=sulstalk_unpositioned] run data modify entity @s Tags[1] set value "sulstalk_positioned"

execute as @e[tag=sulstalk_positioned] positioned as @s rotated as @s if loaded ~ ~ ~ run function sulstalk:sully/logic

execute as @e[tag=sulstalk_spawning] run data merge entity @s {CustomName:"Unbridled Sully"}
execute as @e[tag=sulstalk_spawned] run data merge entity @s {CustomName:"Sully"}

execute as @e[type=player,limit=1,sort=random] run function sulstalk:sully/interactions/suspicious_stew