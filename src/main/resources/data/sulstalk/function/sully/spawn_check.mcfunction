execute store result score @s sulstalk_spawn run execute positioned as @s if entity @e[tag=sulstalk_spawned]
execute unless score @s sulstalk_spawn < @s sulstalk_spawn_max run scoreboard players set @s sulstalk_can_spawn 0
execute if score @s sulstalk_spawn < @s sulstalk_spawn_max run scoreboard players set @s sulstalk_can_spawn 1
#execute if score @s sulstalk_spawn > @s sulstalk_spawn_max as @e[limit=1,sort=random,tag=sulstalk_spawned] positioned as @s unless entity @e[type=player,distance=..50] run kill @s
#execute if score @s sulstalk_can_spawn matches 1 unless entity @e[tag=sulstalk_spawning] positioned as @s run summon item_display ~ ~ ~ {Tags:["sulstalk_spawning"]}
execute if score @s sulstalk_can_spawn matches 1 unless entity @e[tag=sulstalk_spawning] run return 1