scoreboard objectives add sulstalk_spawn_chance trigger ""
scoreboard objectives add sulstalk_spawned_number trigger ""
execute as @e[tag=sulstalk_storage] if score @s sulstalk_spawn matches 10.. run scoreboard players set @s sulstalk_can_spawn 0
execute as @e[tag=sulstalk_storage] if score @s sulstalk_spawn matches ..9 run scoreboard players set @s sulstalk_can_spawn 1
execute if score @e[tag=sulstalk_storage,limit=1] sulstalk_can_spawn matches 1 unless entity @e[tag=sulstalk_spawning] at @r run summon item_display ~ ~ ~ {Tags:["sulstalk_spawning"]}
execute as @e[tag=sulstalk_spawning] unless score @s sulstalk_spawn_chance matches -1..1 run scoreboard players set @s sulstalk_spawn_chance -1

#RANDOM VALUE FOR SPAWN CHANCE IS IN THIS COMMAND
execute as @e[tag=sulstalk_spawning] if score @s sulstalk_spawn_chance matches -1 store result score @s sulstalk_spawn_chance run random value 0..100

execute as @e[tag=sulstalk_spawning] unless score @s sulstalk_spawn_chance matches 1 run kill @s
execute as @e[tag=sulstalk_spawning] if score @s sulstalk_spawn_chance matches 1 run data merge entity @s {Tags:["sulstalk_spawned"]}

execute as @e[tag=sulstalk_spawned] unless score @s sulstalk_spawned_number matches 1.. run scoreboard players set @s sulstalk_spawned_number -1
execute as @e[tag=sulstalk_spawned] if score @s sulstalk_spawned_number matches -1 run scoreboard players add @e[tag=sulstalk_storage] sulstalk_spawn 1
execute as @e[tag=sulstalk_spawned] unless score @s sulstalk_spawned_number matches 1.. store result score @s sulstalk_spawned_number as @e[tag=sulstalk_storage] run scoreboard players get @s sulstalk_spawn


# Temporary name set as Rue until I make an original character
execute as @e[tag=sulstalk_spawning] run data merge entity @s {CustomName:"Unbridled Rue"}
execute as @e[tag=sulstalk_spawned] run data merge entity @s {CustomName:"Rue"}