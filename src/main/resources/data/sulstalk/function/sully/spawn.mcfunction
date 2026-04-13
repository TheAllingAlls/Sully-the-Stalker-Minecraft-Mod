scoreboard objectives add sulstalk_spawn_chance trigger ""
scoreboard objectives add sulstalk_spawn_max trigger ""
execute unless entity @e[tag=sulstalk_spawning] at @r run summon item_display ~ ~ ~ {Tags:["sulstalk_spawning"]}
execute as @e[tag=sulstalk_spawning] unless score @s sulstalk_spawn_chance matches -1..1 run scoreboard players set @s sulstalk_spawn_chance -1
execute as @e[tag=sulstalk_spawning] if score @s sulstalk_spawn_chance matches -1 store result score @s sulstalk_spawn_chance run random value 0..1
execute as @e[tag=sulstalk_spawning] if score @s sulstalk_spawn_chance matches 0 run kill @s
execute as @e[tag=sulstalk_spawning] if score @s sulstalk_spawn_chance matches 1 run data merge entity @s {Tags:["sulstalk_spawned"]}

# Temporary name set as Rue until I make an original character
execute as @e[tag=sulstalk_spawning] run data merge entity @s {CustomName:"Unbridled Rue"}
execute as @e[tag=sulstalk_spawned] run data merge entity @s {CustomName:"Rue"}