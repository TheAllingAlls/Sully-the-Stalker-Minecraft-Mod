scoreboard objectives add sulstalk_defiled_block_delay trigger ""
scoreboard objectives add sulstalk_defiled_block_age trigger ""
execute unless score @s sulstalk_defiled_block_delay matches -1.. run scoreboard players set @s sulstalk_defiled_block_delay -1
execute if score @s sulstalk_defiled_block_delay matches -1..0 positioned ~ ~-2.25 ~ unless block ~ ~ ~ #sulstalk:can_interact_with run summon item_display ~ ~ ~ {Tags:["sulstalk_block","sulstalk_unaligned","sulstalk_unset"]}
execute positioned as @s as @e[tag=sulstalk_block,limit=1,sort=nearest] run data modify entity @s Tags[0] set value "sulstalk_defiled_block"
execute as @e[tag=sulstalk_defiled_block,tag=sulstalk_unaligned] positioned as @s align xyz positioned ~.5 ~.5 ~.5 run tp ~ ~ ~
execute as @e[tag=sulstalk_defiled_block,tag=sulstalk_unaligned] run data modify entity @s Tags[1] set value "sulstalk_aligned"
kill @e[tag=sulstalk_block]
execute if entity @e[tag=sulstalk_defiled_block,distance=0..10] if score @s sulstalk_defiled_block_delay matches -1..0 run scoreboard players set @s sulstalk_defiled_block_delay 10
execute if score @s sulstalk_defiled_block_delay matches 1.. run scoreboard players remove @s sulstalk_defiled_block_delay 1

execute as @e[tag=sulstalk_defiled_block] unless score @s sulstalk_defiled_block_age matches -1.. run scoreboard players set @s sulstalk_defiled_block_age 2000
execute as @e[tag=sulstalk_defiled_block] if score @s sulstalk_defiled_block_age matches 1.. run scoreboard players remove @s sulstalk_defiled_block_age 1
execute as @e[tag=sulstalk_defiled_block] if score @s sulstalk_defiled_block_age matches 0 run kill @s

execute as @e[tag=sulstalk_defiled_block,tag=sulstalk_unset] run data merge entity @s {transformation:{scale:[1.001f,1.001f,1.001f]},Rotation:[0.0f,90.0f],item_display:"head"}
execute as @e[tag=sulstalk_defiled_block,tag=sulstalk_unset] run data merge entity @s {item:{count:1,id:"minecraft:black_concrete"}}
execute as @e[tag=sulstalk_defiled_block,tag=sulstalk_unset] run data modify entity @s Tags[2] set value "sulstalk_set"
execute as @e[tag=sulstalk_defiled_block] positioned as @s if block ~ ~ ~ #sulstalk:can_interact_with run kill @s