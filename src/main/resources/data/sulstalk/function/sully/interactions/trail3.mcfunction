scoreboard objectives add sulstalk_defiled_block_delay trigger ""
execute unless score @s sulstalk_defiled_block_delay matches 0.. positioned ~ ~-0.4 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_defiled_block_delay 19

execute if score @s sulstalk_defiled_block_delay matches 0.. run scoreboard players remove @s sulstalk_defiled_block_delay 1

execute if score @s sulstalk_defiled_block_delay matches 0 positioned ~ ~-0.4 ~ if block ~ ~ ~ black_concrete_powder run setblock ~ ~ ~ air
execute if score @s sulstalk_defiled_block_delay matches 0 positioned ~ ~-0.4 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run setblock ~ ~ ~ black_concrete_powder