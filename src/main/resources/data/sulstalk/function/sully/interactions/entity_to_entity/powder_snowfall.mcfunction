scoreboard objectives add sulstalk_powder_snowfall_max dummy ""
execute unless score @s sulstalk_powder_snowfall_max matches -1.. store result entity @s data.powder_snowfall_max int 1 run random value 30..100
execute store result score @s sulstalk_powder_snowfall_max run data get entity @s data.powder_snowfall_max

scoreboard objectives add sulstalk_powder_snowfall_score dummy ""
execute unless entity @e[type=falling_block,distance=..1,limit=1] store result entity @s data.random_number.x double 0.1 run random value -5..5
execute unless entity @e[type=falling_block,distance=..1,limit=1] store result entity @s data.random_number.y double 0.1 run random value -5..5

execute unless entity @e[type=falling_block,distance=..1,limit=1] run scoreboard players remove @s sulstalk_powder_snowfall_max 1
execute unless entity @e[type=falling_block,distance=..1,limit=1] run summon falling_block ~ ~ ~ {Tags:["sulstalk_falling_block"],BlockState:{Name:"minecraft:powder_snow"},Motion:[0.0d,0.1d,0.0d]}
execute if entity @e[tag=sulstalk_falling_block,type=falling_block,distance=..1,limit=1] run execute as @e[tag=sulstalk_falling_block,type=falling_block,distance=..1,limit=1] run data modify entity @s Motion[0] set from entity @e[tag=sulstalk_spawned,distance=..0.1,limit=1] data.random_number.x
execute if entity @e[tag=sulstalk_falling_block,type=falling_block,distance=..1,limit=1] run execute as @e[tag=sulstalk_falling_block,type=falling_block,distance=..1,limit=1] run data modify entity @s Motion[2] set from entity @e[tag=sulstalk_spawned,distance=..0.1,limit=1] data.random_number.y
execute store result entity @s data.powder_snowfall_max int 1 run scoreboard players get @s sulstalk_powder_snowfall_max
data remove entity @s data.random_number.x
data remove entity @s data.random_number.y

execute store result score @s sulstalk_powder_snowfall_max run data get entity @s data.powder_snowfall_max
execute if score @s sulstalk_powder_snowfall_max matches ..0 run scoreboard players set @s sulstalk_following_entity_anger 0
execute if score @s sulstalk_powder_snowfall_max matches ..0 run scoreboard objectives remove sulstalk_powder_snowfall_max