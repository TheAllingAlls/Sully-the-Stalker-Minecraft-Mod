scoreboard objectives add sulstalk_powder_snowfall_max dummy ""
execute unless score @s sulstalk_powder_snowfall_max matches -1.. store result entity @s data.powder_snowfall_max int 1 run random value 30..100
execute store result score @s sulstalk_powder_snowfall_max run data get entity @s data.powder_snowfall_max

execute unless data entity @s data.random_number run data merge entity @s {data:{random_number:[0.0d,0.0d,0.0d]}}
execute unless entity @e[type=falling_block,distance=..0.2,limit=1] store result entity @s data.random_number[0] double 0.1 run random value -10..10
execute unless data entity @s data.random_number[1] run data modify entity @s data.random_number[1] set value 0.5d
execute unless entity @e[type=falling_block,distance=..0.2,limit=1] store result entity @s data.random_number[2] double 0.1 run random value -10..10

execute unless entity @e[type=falling_block,distance=..5,limit=1] run scoreboard players remove @s sulstalk_powder_snowfall_max 1
execute unless entity @e[type=falling_block,distance=..5,limit=1] run playsound minecraft:block.powder_snow.break block @s ~ ~ ~ 100 1 0
execute unless entity @e[type=falling_block,distance=..5,limit=1] run playsound minecraft:entity.witch.throw block @s ~ ~ ~ 80 0.5 0
execute unless entity @e[type=falling_block,distance=..5,limit=1] run summon falling_block ~ ~ ~ {Tags:["sulstalk_falling_block"],BlockState:{Name:"minecraft:powder_snow"},Motion:[0.0d,0.0d,0.0d]}
execute if entity @e[tag=sulstalk_falling_block,type=falling_block,distance=..0.2,limit=1] run execute as @e[tag=sulstalk_falling_block,type=falling_block,distance=..0.2,limit=1] store result entity @s Motion[0] double 1 run data get entity @e[tag=sulstalk_spawned,distance=..0.1,limit=1] data.random_number[0]
execute if entity @e[tag=sulstalk_falling_block,type=falling_block,distance=..0.2,limit=1] run execute as @e[tag=sulstalk_falling_block,type=falling_block,distance=..0.2,limit=1] store result entity @s Motion[1] double 1 run data get entity @e[tag=sulstalk_spawned,distance=..0.1,limit=1] data.random_number[1]
execute if entity @e[tag=sulstalk_falling_block,type=falling_block,distance=..0.2,limit=1] run execute as @e[tag=sulstalk_falling_block,type=falling_block,distance=..0.2,limit=1] store result entity @s Motion[2] double 1 run data get entity @e[tag=sulstalk_spawned,distance=..0.1,limit=1] data.random_number[2]
execute store result entity @s data.powder_snowfall_max int 1 run scoreboard players get @s sulstalk_powder_snowfall_max

execute store result score @s sulstalk_powder_snowfall_max run data get entity @s data.powder_snowfall_max
execute if score @s sulstalk_powder_snowfall_max matches ..0 run scoreboard players set @s sulstalk_following_entity_anger 0
execute if score @s sulstalk_powder_snowfall_max matches ..0 run scoreboard players reset @s sulstalk_powder_snowfall_max
execute if score @s sulstalk_powder_snowfall_max matches ..0 run data remove entity @s data.powder_snowfall_max
execute if score @s sulstalk_powder_snowfall_max matches ..0 run data remove entity @s data.random_number