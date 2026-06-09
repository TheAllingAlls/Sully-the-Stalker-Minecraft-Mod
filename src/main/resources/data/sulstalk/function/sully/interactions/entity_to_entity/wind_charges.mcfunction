scoreboard objectives add sulstalk_forward_position dummy ""
scoreboard objectives add sulstalk_position dummy ""
scoreboard objectives add sulstalk_wind_charges_max dummy ""
scoreboard objectives add sulstalk_wind_charges_delay dummy ""
scoreboard objectives add sulstalk_wind_charges_direction dummy ""
execute unless score @s sulstalk_wind_charges_max matches -1.. store result score @s sulstalk_wind_charges_max run random value 10..150
execute unless score @s sulstalk_wind_charges_delay matches -1.. run scoreboard players set @s sulstalk_wind_charges_delay -1

execute if score @s sulstalk_wind_charges_delay matches -1 run execute unless entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] run scoreboard players remove @s sulstalk_wind_charges_max 1
execute if score @s sulstalk_wind_charges_delay matches -1 run execute unless entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] run summon breeze_wind_charge ~ ~ ~ {Tags:["sulstalk_wind_charge","sulstalk_special_ability"],Motion:[0.0d,0.0d,0.0d]}
execute if entity @e[tag=sulstalk_wind_charge,tag=sulstalk_special_ability,distance=2.5..,limit=1] as @e[tag=sulstalk_wind_charge,tag=sulstalk_special_ability,distance=2.5..,limit=1] run tag @s remove sulstalk_special_ability

execute unless data entity @s data.wind_charges run data merge entity @s {data:{wind_charges:{forward_position:[0.0d,0.0d,0.0d],original_position:[0.0d,0.0d,0.0d],motion:[0.0d,0.0d,0.0d]}}}

execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result score @s sulstalk_wind_charges_direction run random value -2..2
execute if score @s sulstalk_wind_charges_direction matches -2 run execute if entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] positioned as @s rotated as @s rotated ~ ~-1.0 positioned ^0.25 ^ ^1 run summon marker ~ ~ ~ {Tags:["sulstalk_wind_charge_marker"]}
execute if score @s sulstalk_wind_charges_direction matches -1 run execute if entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] positioned as @s rotated as @s rotated ~ ~-1.0 positioned ^0.1 ^ ^1 run summon marker ~ ~ ~ {Tags:["sulstalk_wind_charge_marker"]}
execute if score @s sulstalk_wind_charges_direction matches 0 run execute if entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] positioned as @s rotated as @s rotated ~ ~-1.0 positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["sulstalk_wind_charge_marker"]}
execute if score @s sulstalk_wind_charges_direction matches 1 run execute if entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] positioned as @s rotated as @s rotated ~ ~-1.0 positioned ^-0.1 ^ ^1 run summon marker ~ ~ ~ {Tags:["sulstalk_wind_charge_marker"]}
execute if score @s sulstalk_wind_charges_direction matches 2 run execute if entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] positioned as @s rotated as @s rotated ~ ~-1.0 positioned ^-0.25 ^ ^1 run summon marker ~ ~ ~ {Tags:["sulstalk_wind_charge_marker"]}
execute if entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] store result entity @s data.wind_charges.forward_position[0] int 1 as @e[tag=sulstalk_wind_charge_marker,distance=..2,limit=1] run data get entity @s Pos[0] 100
execute if entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] store result entity @s data.wind_charges.forward_position[1] int 1 as @e[tag=sulstalk_wind_charge_marker,distance=..2,limit=1] run data get entity @s Pos[1] 100
execute if entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] store result entity @s data.wind_charges.forward_position[2] int 1 as @e[tag=sulstalk_wind_charge_marker,distance=..2,limit=1] run data get entity @s Pos[2] 100
execute as @e[tag=sulstalk_wind_charge_marker,distance=..2,limit=1] run kill @s

execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result entity @s data.wind_charges.original_position[0] int 1 run data get entity @s Pos[0] 100
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result entity @s data.wind_charges.original_position[1] int 1 run data get entity @s Pos[1] 100
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result entity @s data.wind_charges.original_position[2] int 1 run data get entity @s Pos[2] 100

execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result score @s sulstalk_forward_position run data get entity @s data.wind_charges.forward_position[0]
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result score @s sulstalk_position run data get entity @s data.wind_charges.original_position[0]
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result entity @s data.wind_charges.motion[0] int 1 run scoreboard players operation @s sulstalk_forward_position -= @s sulstalk_position
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result score @s sulstalk_forward_position run data get entity @s data.wind_charges.forward_position[1]
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result score @s sulstalk_position run data get entity @s data.wind_charges.original_position[1]
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result entity @s data.wind_charges.motion[1] int 1 run scoreboard players operation @s sulstalk_forward_position -= @s sulstalk_position
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result score @s sulstalk_forward_position run data get entity @s data.wind_charges.forward_position[2]
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result score @s sulstalk_position run data get entity @s data.wind_charges.original_position[2]
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result entity @s data.wind_charges.motion[2] int 1 run scoreboard players operation @s sulstalk_forward_position -= @s sulstalk_position

execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] Motion[0] double 0.001 run data get entity @s data.wind_charges.motion[0]
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] Motion[1] double 0.001 run data get entity @s data.wind_charges.motion[1]
execute if score @s sulstalk_wind_charges_delay matches -1 run execute store result entity @e[tag=sulstalk_wind_charge,distance=..1,limit=1] Motion[2] double 0.001 run data get entity @s data.wind_charges.motion[2]

execute if score @s sulstalk_wind_charges_max matches 10.. if score @s sulstalk_wind_charges_delay matches -1 store result score @s sulstalk_wind_charges_delay run random value 5..15
execute if score @s sulstalk_wind_charges_max matches ..9 if score @s sulstalk_wind_charges_delay matches -1 store result score @s sulstalk_wind_charges_delay run random value 10..30
execute if score @s sulstalk_wind_charges_max matches 1.. if score @s sulstalk_wind_charges_delay matches 0.. run scoreboard players remove @s sulstalk_wind_charges_delay 1

execute if score @s sulstalk_wind_charges_max matches ..0 run scoreboard players set @s sulstalk_following_entity_anger 0
execute if score @s sulstalk_wind_charges_max matches ..0 run scoreboard players reset @s sulstalk_wind_charges_max
execute if score @s sulstalk_wind_charges_max matches ..0 run scoreboard players reset @s sulstalk_wind_charges_delay
execute if score @s sulstalk_wind_charges_max matches ..0 run scoreboard players reset @s sulstalk_wind_charges_direction
execute if score @s sulstalk_wind_charges_max matches ..0 run scoreboard players reset @s sulstalk_forward_position
execute if score @s sulstalk_wind_charges_max matches ..0 run scoreboard players reset @s sulstalk_position
execute if score @s sulstalk_wind_charges_max matches ..0 run data remove entity @s data.wind_charges

#execute if score @s sulstalk_wind_charges_delay matches -1 run execute if predicate {condition:entity_scores,entity:this,scores:{sulstalk_forward_position:{}}}