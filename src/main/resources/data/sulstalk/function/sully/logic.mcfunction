#scoreboard objectives add sulstalk_position_x trigger ""
#scoreboard objectives add sulstalk_position_y trigger ""
#scoreboard objectives add sulstalk_position_z trigger ""
scoreboard objectives add sulstalk_is_in_block trigger ""
scoreboard objectives add sulstalk_will_be_in_block trigger ""
scoreboard objectives add sulstalk_should_move trigger ""
scoreboard objectives add sulstalk_move_timer trigger ""
scoreboard objectives add sulstalk_should_rotate trigger ""
scoreboard objectives add sulstalk_can_rotate_up trigger ""
scoreboard objectives add sulstalk_is_following_entity trigger ""
scoreboard objectives add sulstalk_following_entity_id trigger ""
#execute unless score @s sulstalk_position_x matches -999999999..999999999 run scoreboard players set @s sulstalk_position_x 0
#execute unless score @s sulstalk_position_y matches -999999999..999999999 run scoreboard players set @s sulstalk_position_y 0
#execute unless score @s sulstalk_position_z matches -999999999..999999999 run scoreboard players set @s sulstalk_position_z 0
execute unless score @s sulstalk_is_in_block matches -9999..9999 run scoreboard players set @s sulstalk_is_in_block 0
execute unless score @s sulstalk_will_be_in_block matches -1..1 run scoreboard players set @s sulstalk_will_be_in_block 0
execute unless score @s sulstalk_should_move matches -1.. run scoreboard players set @s sulstalk_should_move -1
execute unless score @s sulstalk_move_timer matches -1.. run scoreboard players set @s sulstalk_move_timer -1
execute unless score @s sulstalk_should_rotate matches -1..1 run scoreboard players set @s sulstalk_should_rotate 0
execute unless score @s sulstalk_can_rotate_up matches -1..1 run scoreboard players set @s sulstalk_can_rotate_up 0
execute unless score @s sulstalk_is_following_entity matches 0.. run scoreboard players set @s sulstalk_is_following_entity 0
execute unless score @s sulstalk_following_entity_id matches -999999999..999999999 run scoreboard players set @s sulstalk_following_entity_id 0

#execute store result score @s sulstalk_position_x run data get entity @s Pos[0] 10000
#execute store result score @s sulstalk_position_y run data get entity @s Pos[1] 10000
#execute store result score @s sulstalk_position_z run data get entity @s Pos[2] 10000

execute positioned ~ ~-2.1 ~ unless score @s sulstalk_is_in_block matches 2 unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 1
execute positioned ~ ~0.5 ~ if score @s sulstalk_is_in_block matches 1 unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 2
execute positioned ~ ~-2.5 ~ unless score @s sulstalk_is_in_block matches -2 if block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block -1
execute positioned ~ ~0.5 ~ if score @s sulstalk_is_in_block matches -1 if block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block -1
execute positioned ~ ~-3.5 ~ if score @s sulstalk_is_in_block matches -1 if block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block -2
execute positioned ~ ~-2 ~ positioned ^ ^ ^1.5 unless block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~1 ~ if block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_will_be_in_block 1
execute positioned ~ ~-2 ~ positioned ^ ^ ^1.5 unless block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~-1 ~ if block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_will_be_in_block -1
execute positioned ~ ~-2 ~ positioned ^ ^ ^1.5 if block ~ ~ ~ #sulstalk:can_pass_through positioned ^ ^ ^1.5 if block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_will_be_in_block 0
execute if score @s sulstalk_is_following_entity matches 1 run scoreboard players set @s sulstalk_is_in_block 0
execute if score @s sulstalk_is_following_entity matches 1 run scoreboard players set @s sulstalk_will_be_in_block 0

execute if score @s sulstalk_is_in_block matches 1 at @s run tp ~0.0 ~0.05 ~0.0
execute if score @s sulstalk_is_in_block matches 2 at @s run tp ~0.0 ~0.5 ~0.0
execute if score @s sulstalk_is_in_block matches -1 at @s run tp ~0.0 ~-0.05 ~0.0
execute if score @s sulstalk_is_in_block matches -2 at @s run tp ~0.0 ~-0.2 ~0.0
execute if score @s sulstalk_will_be_in_block matches 1 at @s run tp ~0.0 ~0.1 ~0.0
execute if score @s sulstalk_will_be_in_block matches 2 at @s run tp ~0.0 ~0.25 ~0.0
execute if score @s sulstalk_will_be_in_block matches -1 at @s run tp ~0.0 ~-0.1 ~0.0
execute if score @s sulstalk_will_be_in_block matches -2 at @s run tp ~0.0 ~-0.25 ~0.0
#execute if score @s sulstalk_is_in_block matches 1 run scoreboard players add @s sulstalk_position_y 000500
#execute if score @s sulstalk_is_in_block matches 2 run scoreboard players add @s sulstalk_position_y 005000
#execute if score @s sulstalk_is_in_block matches -1 run scoreboard players remove @s sulstalk_position_y 000500
#execute if score @s sulstalk_is_in_block matches -2 run scoreboard players remove @s sulstalk_position_y 002000

execute if score @s sulstalk_should_move matches -1 store result score @s sulstalk_move_timer run random value 0..100
execute if score @s sulstalk_move_timer matches -9999.. run scoreboard players remove @s sulstalk_move_timer 1
execute if score @s sulstalk_move_timer matches 1.. run scoreboard players set @s sulstalk_should_move 1

execute unless score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_should_move matches 1 at @s run tp ^0.0 ^0.0 ^0.05
execute if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_should_move matches 1 at @s run tp ^0.0 ^0.0 ^0.1
execute if score @s sulstalk_move_timer matches 0..1 at @s run tp ^0.0 ^0.0 ^0.025
execute if score @s sulstalk_move_timer matches ..-10 run scoreboard players set @s sulstalk_should_move 0
execute if score @s sulstalk_should_move matches 0 at @s run tp ^0.0 ^0.0 ^0.01
execute if score @s sulstalk_move_timer matches ..-10 run scoreboard players set @s sulstalk_should_move -1

execute if score @s sulstalk_should_rotate matches 0 store result score @s sulstalk_should_rotate run random value -200..200
execute if score @s sulstalk_should_rotate matches 0..49 store result score @s sulstalk_should_rotate run random value 0..200
execute if score @s sulstalk_should_rotate matches -200..-50 store result score @s sulstalk_should_rotate run random value 0..200
execute if score @s sulstalk_should_rotate matches -49..0 store result score @s sulstalk_should_rotate run random value -200..0
execute if score @s sulstalk_should_rotate matches 50..200 store result score @s sulstalk_should_rotate run random value 0..200
execute if score @s sulstalk_can_rotate_up matches 0 run rotate @s ~0.0 0.0
execute if score @s sulstalk_should_rotate matches -1 run rotate @s ~-1 ~0.0
execute if score @s sulstalk_should_rotate matches -2 run rotate @s ~-5 ~0.0
execute if score @s sulstalk_should_rotate matches -200 run rotate @s ~-45 ~0.0
execute if score @s sulstalk_should_rotate matches 1 run rotate @s ~1 ~0.0
execute if score @s sulstalk_should_rotate matches 2 run rotate @s ~5 ~0.0
execute if score @s sulstalk_should_rotate matches 200 run rotate @s ~45 ~0.0

#execute store result entity @s Pos[0] double 0.0001 run scoreboard players get @s sulstalk_position_x
#execute store result entity @s Pos[1] double 0.0001 run scoreboard players get @s sulstalk_position_y
#execute store result entity @s Pos[2] double 0.0001 run scoreboard players get @s sulstalk_position_z

execute positioned ~ ~-2 ~ run function sulstalk:sully/interactions

##Teleport duration is in ticks per second (20tps -> 1sec)
data modify entity @s teleport_duration set value 5
data merge entity @s {item_display:"head",billboard:"vertical"}
##Temporary model is Rue
data merge entity @s {item:{count:1,id:"minecraft:azalea_leaves",components:{"minecraft:item_model":"rue:rue"}}}