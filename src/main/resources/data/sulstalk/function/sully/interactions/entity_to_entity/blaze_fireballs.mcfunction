scoreboard objectives add sulstalk_forward_position dummy ""
scoreboard objectives add sulstalk_position dummy ""
scoreboard objectives add sulstalk_blaze_fireballs_max dummy ""
scoreboard objectives add sulstalk_blaze_fireballs_delay dummy ""
scoreboard objectives add sulstalk_blaze_fireballs_direction dummy ""
execute unless score @s sulstalk_blaze_fireballs_max matches -1.. store result score @s sulstalk_blaze_fireballs_max run random value 10..20
execute unless score @s sulstalk_blaze_fireballs_delay matches -1.. run scoreboard players set @s sulstalk_blaze_fireballs_delay -1

execute if score @s sulstalk_blaze_fireballs_delay matches -1 unless entity @e[tag=sulstalk_blaze_fireball,distance=..3,limit=1] run scoreboard players remove @s sulstalk_blaze_fireballs_max 1
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute if score @s sulstalk_blaze_fireballs_delay matches -1 unless entity @e[tag=sulstalk_blaze_fireball,distance=..3,limit=1] run summon small_fireball ~ ~ ~ {Tags:["sulstalk_blaze_fireball","sulstalk_special_ability"],Motion:[0.0d,0.0d,0.0d]}

execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute positioned ^0.5 ^1.4 ^ unless entity @e[tag=sulstalk_blaze_fireball_1,distance=..1,limit=1] run summon item_display ~ ~ ~ {Tags:["sulstalk_blaze_fireball_1","sulstalk_blaze_fireball_item_display","sulstalk_special_ability"],Motion:[0.0d,0.0d,0.0d],teleport_duration:5}
execute positioned as @s rotated ~ 0.0 positioned ^0.5 ^1.4 ^ unless entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_1,distance=..1,limit=1] run summon small_fireball ~ ~ ~ {Tags:["sulstalk_blaze_fireball_display","sulstalk_special_ability"]}
execute positioned as @s rotated ~ 0.0 positioned ^0.5 ^1.4 ^ as @e[tag=sulstalk_blaze_fireball_1,distance=..1,limit=1] run ride @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1,sort=nearest] mount @s
execute positioned as @s rotated ~ 0.0 positioned ^0.5 ^1.4 ^ as @e[tag=sulstalk_blaze_fireball_1,distance=..1,limit=1] run tp ~ ~ ~
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute positioned ^ ^1.7 ^ unless entity @e[tag=sulstalk_blaze_fireball_2,distance=..1,limit=1] run summon item_display ~ ~ ~ {Tags:["sulstalk_blaze_fireball_2","sulstalk_blaze_fireball_item_display","sulstalk_special_ability"],Motion:[0.0d,0.0d,0.0d],teleport_duration:5}
execute positioned as @s rotated ~ 0.0 positioned ^ ^1.7 ^ unless entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_2,distance=..1,limit=1] run summon small_fireball ~ ~ ~ {Tags:["sulstalk_blaze_fireball_display","sulstalk_special_ability"]}
execute positioned as @s rotated ~ 0.0 positioned ^ ^1.7 ^ if entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_2,distance=..1,limit=1] run ride @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1,sort=nearest] mount @s
execute positioned as @s rotated ~ 0.0 positioned ^ ^1.7 ^ as @e[tag=sulstalk_blaze_fireball_2,distance=..1,limit=1] run tp ~ ~ ~
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute positioned ^-0.5 ^1.4 ^ unless entity @e[tag=sulstalk_blaze_fireball_3,distance=..1,limit=1] run summon item_display ~ ~ ~ {Tags:["sulstalk_blaze_fireball_3","sulstalk_blaze_fireball_item_display","sulstalk_special_ability"],Motion:[0.0d,0.0d,0.0d],teleport_duration:5}
execute positioned as @s rotated ~ 0.0 positioned ^-0.5 ^1.4 ^ unless entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_3,distance=..1,limit=1] run summon small_fireball ~ ~ ~ {Tags:["sulstalk_blaze_fireball_display","sulstalk_special_ability"]}
execute positioned as @s rotated ~ 0.0 positioned ^-0.5 ^1.4 ^ if entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_3,distance=..1,limit=1] run ride @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1,sort=nearest] mount @s
execute positioned as @s rotated ~ 0.0 positioned ^-0.5 ^1.4 ^ as @e[tag=sulstalk_blaze_fireball_3,distance=..1,limit=1] run tp ~ ~ ~
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute positioned ^-1 ^0.5 ^ unless entity @e[tag=sulstalk_blaze_fireball_4,distance=..1,limit=1] run summon item_display ~ ~ ~ {Tags:["sulstalk_blaze_fireball_4","sulstalk_blaze_fireball_item_display","sulstalk_special_ability"],Motion:[0.0d,0.0d,0.0d],teleport_duration:5}
execute positioned as @s rotated ~ 0.0 positioned ^-1 ^0.5 ^ unless entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_4,distance=..1,limit=1] run summon small_fireball ~ ~ ~ {Tags:["sulstalk_blaze_fireball_display","sulstalk_special_ability"]}
execute positioned as @s rotated ~ 0.0 positioned ^-1 ^0.5 ^ if entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_4,distance=..1,limit=1] run ride @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1,sort=nearest] mount @s
execute positioned as @s rotated ~ 0.0 positioned ^-1 ^0.5 ^ as @e[tag=sulstalk_blaze_fireball_4,distance=..1,limit=1] run tp ~ ~ ~
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute positioned ^1 ^0.5 ^ unless entity @e[tag=sulstalk_blaze_fireball_5,distance=..1,limit=1] run summon item_display ~ ~ ~ {Tags:["sulstalk_blaze_fireball_5","sulstalk_blaze_fireball_item_display","sulstalk_special_ability"],Motion:[0.0d,0.0d,0.0d],teleport_duration:5}
execute positioned as @s rotated ~ 0.0 positioned ^1 ^0.5 ^ unless entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_5,distance=..1,limit=1] run summon small_fireball ~ ~ ~ {Tags:["sulstalk_blaze_fireball_display","sulstalk_special_ability"]}
execute positioned as @s rotated ~ 0.0 positioned ^1 ^0.5 ^ if entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_5,distance=..1,limit=1] run ride @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1,sort=nearest] mount @s
execute positioned as @s rotated ~ 0.0 positioned ^1 ^0.5 ^ as @e[tag=sulstalk_blaze_fireball_5,distance=..1,limit=1] run tp ~ ~ ~
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute positioned ^0.9 ^-0.5 ^ unless entity @e[tag=sulstalk_blaze_fireball_6,distance=..1,limit=1] run summon item_display ~ ~ ~ {Tags:["sulstalk_blaze_fireball_6","sulstalk_blaze_fireball_item_display","sulstalk_special_ability"],Motion:[0.0d,0.0d,0.0d],teleport_duration:5}
execute positioned as @s rotated ~ 0.0 positioned ^0.9 ^-0.5 ^ unless entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_6,distance=..1,limit=1] run summon small_fireball ~ ~ ~ {Tags:["sulstalk_blaze_fireball_display","sulstalk_special_ability"]}
execute positioned as @s rotated ~ 0.0 positioned ^0.9 ^-0.5 ^ if entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_6,distance=..1,limit=1] run ride @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1,sort=nearest] mount @s
execute positioned as @s rotated ~ 0.0 positioned ^0.9 ^-0.5 ^ as @e[tag=sulstalk_blaze_fireball_6,distance=..1,limit=1] run tp ~ ~ ~
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute positioned ^-0.9 ^-0.5 ^ unless entity @e[tag=sulstalk_blaze_fireball_7,distance=..1,limit=1] run summon item_display ~ ~ ~ {Tags:["sulstalk_blaze_fireball_7","sulstalk_blaze_fireball_item_display","sulstalk_special_ability"],Motion:[0.0d,0.0d,0.0d],teleport_duration:5}
execute positioned as @s rotated ~ 0.0 positioned ^-0.9 ^-0.5 ^ unless entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_7,distance=..1,limit=1] run summon small_fireball ~ ~ ~ {Tags:["sulstalk_blaze_fireball_display","sulstalk_special_ability"]}
execute positioned as @s rotated ~ 0.0 positioned ^-0.9 ^-0.5 ^ if entity @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1] as @e[tag=sulstalk_blaze_fireball_7,distance=..1,limit=1] run ride @e[tag=sulstalk_blaze_fireball_display,distance=..0.75,limit=1,sort=nearest] mount @s
execute positioned as @s rotated ~ 0.0 positioned ^-0.9 ^-0.5 ^ as @e[tag=sulstalk_blaze_fireball_7,distance=..1,limit=1] run tp ~ ~ ~

execute unless data entity @s data.blaze_fireballs run data merge entity @s {data:{blaze_fireballs:{forward_position:[0.0d,0.0d,0.0d],original_position:[0.0d,0.0d,0.0d],motion:[0.0d,0.0d,0.0d]}}}

execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result score @s sulstalk_blaze_fireballs_direction run random value -2..2
execute if score @s sulstalk_blaze_fireballs_direction matches -2 run execute if entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] positioned as @s rotated as @s rotated ~ ~-1.0 positioned ^0.25 ^ ^1 run summon marker ~ ~ ~ {Tags:["sulstalk_blaze_fireball_marker"]}
execute if score @s sulstalk_blaze_fireballs_direction matches -1 run execute if entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] positioned as @s rotated as @s rotated ~ ~-1.0 positioned ^0.1 ^ ^1 run summon marker ~ ~ ~ {Tags:["sulstalk_blaze_fireball_marker"]}
execute if score @s sulstalk_blaze_fireballs_direction matches 0 run execute if entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] positioned as @s rotated as @s rotated ~ ~-1.0 positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["sulstalk_blaze_fireball_marker"]}
execute if score @s sulstalk_blaze_fireballs_direction matches 1 run execute if entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] positioned as @s rotated as @s rotated ~ ~-1.0 positioned ^-0.1 ^ ^1 run summon marker ~ ~ ~ {Tags:["sulstalk_blaze_fireball_marker"]}
execute if score @s sulstalk_blaze_fireballs_direction matches 2 run execute if entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] positioned as @s rotated as @s rotated ~ ~-1.0 positioned ^-0.25 ^ ^1 run summon marker ~ ~ ~ {Tags:["sulstalk_blaze_fireball_marker"]}
execute if entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] store result entity @s data.blaze_fireballs.forward_position[0] int 1 as @e[tag=sulstalk_blaze_fireball_marker,distance=..2,limit=1] run data get entity @s Pos[0] 100
execute if entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] store result entity @s data.blaze_fireballs.forward_position[1] int 1 as @e[tag=sulstalk_blaze_fireball_marker,distance=..2,limit=1] run data get entity @s Pos[1] 100
execute if entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] store result entity @s data.blaze_fireballs.forward_position[2] int 1 as @e[tag=sulstalk_blaze_fireball_marker,distance=..2,limit=1] run data get entity @s Pos[2] 100
execute as @e[tag=sulstalk_blaze_fireball_marker,distance=..2,limit=1] run kill @s

execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result entity @s data.blaze_fireballs.original_position[0] int 1 run data get entity @s Pos[0] 100
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result entity @s data.blaze_fireballs.original_position[1] int 1 run data get entity @s Pos[1] 100
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result entity @s data.blaze_fireballs.original_position[2] int 1 run data get entity @s Pos[2] 100

execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result score @s sulstalk_forward_position run data get entity @s data.blaze_fireballs.forward_position[0]
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result score @s sulstalk_position run data get entity @s data.blaze_fireballs.original_position[0]
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result entity @s data.blaze_fireballs.motion[0] int 1 run scoreboard players operation @s sulstalk_forward_position -= @s sulstalk_position
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result score @s sulstalk_forward_position run data get entity @s data.blaze_fireballs.forward_position[1]
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result score @s sulstalk_position run data get entity @s data.blaze_fireballs.original_position[1]
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result entity @s data.blaze_fireballs.motion[1] int 1 run scoreboard players operation @s sulstalk_forward_position -= @s sulstalk_position
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result score @s sulstalk_forward_position run data get entity @s data.blaze_fireballs.forward_position[2]
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result score @s sulstalk_position run data get entity @s data.blaze_fireballs.original_position[2]
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result entity @s data.blaze_fireballs.motion[2] int 1 run scoreboard players operation @s sulstalk_forward_position -= @s sulstalk_position

execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] Motion[0] double 0.001 run data get entity @s data.blaze_fireballs.motion[0]
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] Motion[1] double 0.001 run data get entity @s data.blaze_fireballs.motion[1]
execute if score @s sulstalk_blaze_fireballs_delay matches -1 run execute store result entity @e[tag=sulstalk_blaze_fireball,distance=..0.75,limit=1] Motion[2] double 0.001 run data get entity @s data.blaze_fireballs.motion[2]

execute if score @s sulstalk_blaze_fireballs_max matches 1.. if score @s sulstalk_blaze_fireballs_delay matches -1 store result score @s sulstalk_blaze_fireballs_delay run return 1
execute if score @s sulstalk_blaze_fireballs_max matches 1.. if score @s sulstalk_blaze_fireballs_delay matches 0.. run scoreboard players remove @s sulstalk_blaze_fireballs_delay 1

execute if score @s sulstalk_blaze_fireballs_max matches ..0 run scoreboard players set @s sulstalk_following_entity_anger 0
execute if score @s sulstalk_blaze_fireballs_max matches ..0 run scoreboard players reset @s sulstalk_blaze_fireballs_max
execute if score @s sulstalk_blaze_fireballs_max matches ..0 run scoreboard players reset @s sulstalk_blaze_fireballs_delay
execute if score @s sulstalk_blaze_fireballs_max matches ..0 run scoreboard players reset @s sulstalk_blaze_fireballs_direction
execute if score @s sulstalk_blaze_fireballs_max matches ..0 run scoreboard players reset @s sulstalk_forward_position
execute if score @s sulstalk_blaze_fireballs_max matches ..0 run scoreboard players reset @s sulstalk_position
execute if score @s sulstalk_blaze_fireballs_max matches ..0 run data remove entity @s data.blaze_fireballs
execute if score @s sulstalk_blaze_fireballs_max matches ..0 as @e[tag=sulstalk_special_ability,distance=..5] run kill @s