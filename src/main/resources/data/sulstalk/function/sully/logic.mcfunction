scoreboard objectives add sulstalk_is_in_block trigger ""
scoreboard objectives add sulstalk_should_move trigger ""
scoreboard objectives add sulstalk_should_rotate trigger ""
execute unless score @s sulstalk_is_in_block matches -9999..9999 run scoreboard players set @s sulstalk_is_in_block 0
execute unless score @s sulstalk_should_move matches 0.. run scoreboard players set @s sulstalk_should_move 0
execute unless score @s sulstalk_should_rotate matches -1..1 run scoreboard players set @s sulstalk_should_rotate 0

execute unless score @s sulstalk_is_in_block matches 1 positioned ~ ~-2.1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 1
execute unless score @s sulstalk_is_in_block matches ..1 positioned ~ ~1.5 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block -1

execute if score @s sulstalk_is_in_block matches 1 run tp ~ ~0.05 ~
execute if score @s sulstalk_is_in_block matches 2.. run tp ~ ~0.2 ~
execute if score @s sulstalk_is_in_block matches -1 run tp ~ ~0.05 ~
execute if score @s sulstalk_is_in_block matches ..-2 run tp ~ ~0.2 ~
execute if score @s sulstalk_should_move matches 1 run tp ^ ^ ^0.05

execute if score @s sulstalk_should_rotate matches 0 store result score @s sulstalk_should_rotate run random value -200..200

data merge entity @s {item_display:"head",billboard:"vertical"}
#Temporary model is Rue
data merge entity @s {item:{count:1,id:"minecraft:azalea_leaves",components:{"minecraft:item_model":"rue:rue"}}}