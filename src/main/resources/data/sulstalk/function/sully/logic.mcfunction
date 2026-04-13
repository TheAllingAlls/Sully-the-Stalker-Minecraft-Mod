scoreboard objectives add sulstalk_is_in_block trigger ""
scoreboard objectives add sulstalk_should_move trigger ""
execute unless score @s sulstalk_is_in_block matches -1.. run scoreboard players set @s sulstalk_is_in_block -1
execute unless score @s sulstalk_should_move matches 0.. run scoreboard players set @s sulstalk_should_move 0

execute positioned as @s unless block ~ ~-2.1 ~ #minecraft:replaceable run tp ~ ~0.05 ~
execute positioned as @s if block ~ ~-2.0 ~ #minecraft:replaceable run tp ~ ~-0.05 ~
execute positioned as @s if score @s sulstalk_is_in_block matches 1 run tp ~ ~0.05 ~
execute positioned as @s if score @s sulstalk_is_in_block matches 2 run tp ~ ~0.2 ~
execute positioned as @s if score @s sulstalk_should_move matches 1 run tp ^ ^ ^0.05

data merge entity @s {item_display:"head",billboard:"vertical"}
#Temporary model is Rue
data merge entity @s {item:{count:1,id:"minecraft:azalea_leaves",components:{"minecraft:item_model":"rue:rue"}}}