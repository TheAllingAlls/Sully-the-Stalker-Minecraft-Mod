scoreboard objectives add sulstalk_is_in_block trigger ""
scoreboard objectives add sulstalk_should_move trigger ""
scoreboard objectives add sulstalk_move_timer trigger ""
scoreboard objectives add sulstalk_should_rotate trigger ""
scoreboard objectives add sulstalk_is_following_entity trigger ""
scoreboard objectives add sulstalk_following_entity_id trigger ""
execute unless score @s sulstalk_is_in_block matches -9999..9999 run scoreboard players set @s sulstalk_is_in_block 0
execute unless score @s sulstalk_should_move matches -1.. run scoreboard players set @s sulstalk_should_move -1
execute unless score @s sulstalk_move_timer matches -1.. run scoreboard players set @s sulstalk_move_timer -1
execute unless score @s sulstalk_should_rotate matches -1..1 run scoreboard players set @s sulstalk_should_rotate 0
execute unless score @s sulstalk_is_following_entity matches 0.. run scoreboard players set @s sulstalk_is_following_entity 0
execute unless score @s sulstalk_following_entity_id matches -999999999..999999999 run scoreboard players set @s sulstalk_following_entity_id 0

execute unless score @s sulstalk_is_in_block matches 1 positioned ~ ~-2.1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 1
execute if score @s sulstalk_is_in_block matches 1 positioned ~ ~2 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 2
execute unless score @s sulstalk_is_in_block matches ..1 positioned ~ ~1.5 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block -1
execute if block ~ ~2 ~ #sulstalk:can_pass_through if block ~ ~-2.1 ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 0
execute if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_is_in_block matches 1 run scoreboard players set @s sulstalk_is_in_block 0

execute if score @s sulstalk_is_in_block matches 1 run tp ~ ~0.05 ~
execute if score @s sulstalk_is_in_block matches 2.. run tp ~ ~0.2 ~
execute if score @s sulstalk_is_in_block matches -1 run tp ~ ~0.05 ~
execute if score @s sulstalk_is_in_block matches ..-2 run tp ~ ~0.2 ~
execute if score @s sulstalk_should_move matches 1 run tp ^ ^ ^0.05

execute if score @s sulstalk_should_move matches -1 store result score @s sulstalk_move_timer run random value 0..100

execute if score @s sulstalk_should_rotate matches 0 store result score @s sulstalk_should_rotate run random value -200..200
execute if score @s sulstalk_should_rotate matches 0..49 store result score @s sulstalk_should_rotate run random value 0..200
execute if score @s sulstalk_should_rotate matches -200..-50 store result score @s sulstalk_should_rotate run random value 0..200
execute if score @s sulstalk_should_rotate matches -49..0 store result score @s sulstalk_should_rotate run random value -200..0
execute if score @s sulstalk_should_rotate matches 50..200 store result score @s sulstalk_should_rotate run random value 0..200
execute if score @s sulstalk_should_rotate matches -1 run rotate @s ~-1 ~
execute if score @s sulstalk_should_rotate matches -2 run rotate @s ~-5 ~
execute if score @s sulstalk_should_rotate matches -200 run rotate @s ~-45 ~
execute if score @s sulstalk_should_rotate matches 1 run rotate @s ~1 ~
execute if score @s sulstalk_should_rotate matches 2 run rotate @s ~5 ~
execute if score @s sulstalk_should_rotate matches 200 run rotate @s ~45 ~

#Teleport duration is in ticks per second (20tps -> 1sec)
data modify entity @s teleport_duration set value 5
data merge entity @s {item_display:"head",billboard:"vertical"}
#Temporary model is Rue
data merge entity @s {item:{count:1,id:"minecraft:azalea_leaves",components:{"minecraft:item_model":"rue:rue"}}}