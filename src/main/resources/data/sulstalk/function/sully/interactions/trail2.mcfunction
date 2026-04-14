scoreboard objectives add sulstalk_defiled_block_age trigger ""
execute positioned ~ ~-0.25 ~ unless entity @e[tag=sulstalk_defiled_block,distance=..1] unless block ~ ~ ~ #sulstalk:can_interact_with run summon marker ~ ~ ~ {Tags:["sulstalk_defiled_block"]}

execute as @e[tag=sulstalk_defiled_block] positioned as @s run setblock ~ ~ ~ black_concrete

execute as @e[tag=sulstalk_defiled_block] unless score @s sulstalk_defiled_block_age matches -1.. run scoreboard players set @s sulstalk_defiled_block_age 2000
execute as @e[tag=sulstalk_defiled_block] if score @s sulstalk_defiled_block_age matches 1.. run scoreboard players remove @s sulstalk_defiled_block_age 1
execute as @e[tag=sulstalk_defiled_block] if score @s sulstalk_defiled_block_age matches 0 positioned as @s run setblock ~ ~ ~ air

execute as @e[tag=sulstalk_defiled_block] positioned as @s unless block ~ ~ ~ black_concrete run kill @s