#scoreboard objectives add sulstalk_position_x trigger ""
#scoreboard objectives add sulstalk_position_y trigger ""
#scoreboard objectives add sulstalk_position_z trigger ""
scoreboard objectives add sulstalk_is_in_block trigger ""
scoreboard objectives add sulstalk_should_move trigger ""
scoreboard objectives add sulstalk_travel_timer trigger ""
scoreboard objectives add sulstalk_travel_timer_enabled trigger ""
scoreboard objectives add sulstalk_should_rotate trigger ""
scoreboard objectives add sulstalk_can_rotate_up trigger ""
#execute unless score @s sulstalk_position_x matches -1999999999..1999999999 run scoreboard players set @s sulstalk_position_x 0
#execute unless score @s sulstalk_position_y matches -1999999999..1999999999 run scoreboard players set @s sulstalk_position_y 0
#execute unless score @s sulstalk_position_z matches -1999999999..1999999999 run scoreboard players set @s sulstalk_position_z 0

execute unless score @s sulstalk_is_in_block matches -9999..9999 run scoreboard players set @s sulstalk_is_in_block 0
execute unless score @s sulstalk_should_move matches -1.. run scoreboard players set @s sulstalk_should_move -1
execute unless score @s sulstalk_travel_timer matches -1.. run scoreboard players set @s sulstalk_travel_timer -1
execute unless score @s sulstalk_travel_timer_enabled matches 0.. run scoreboard players set @s sulstalk_travel_timer_enabled 1
execute unless score @s sulstalk_should_rotate matches -1..1 run scoreboard players set @s sulstalk_should_rotate 0
execute unless score @s sulstalk_can_rotate_up matches -1..1 run scoreboard players set @s sulstalk_can_rotate_up 0

#execute store result score @s sulstalk_position_x run data get entity @s Pos[0] 10000
#execute store result score @s sulstalk_position_y run data get entity @s Pos[1] 10000
#execute store result score @s sulstalk_position_z run data get entity @s Pos[2] 10000

execute if score @s sulstalk_travel_timer_enabled matches 1 if score @s sulstalk_travel_timer matches -1 store result score @s sulstalk_travel_timer run random value 200..4000
execute if score @s sulstalk_travel_timer_enabled matches 1 if score @s sulstalk_travel_timer matches 0.. run scoreboard players remove @s sulstalk_travel_timer 1
#execute if score @s sulstalk_travel_timer_enabled matches 1 if score @s sulstalk_travel_timer matches 0..20 if score @s sulstalk_should_move matches 1 run scoreboard players set @s sulstalk_should_move 0
#execute if score @s sulstalk_travel_timer_enabled matches 1 if score @s sulstalk_travel_timer matches 20.. if score @s sulstalk_should_move matches 0 run scoreboard players set @s sulstalk_should_move 1

execute positioned ~ ~ ~ if block ~ ~ ~ #sulstalk:can_pass_through if block ~ ~-1 ~ #sulstalk:can_pass_through if block ~ ~-2 ~ #sulstalk:can_pass_through if block ~ ~1 ~ #sulstalk:can_pass_through if block ~ ~2 ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 0
execute positioned ~ ~-2 ~ if block ~ ~ ~ #sulstalk:can_pass_through positioned as @s positioned ~ ~2 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block -1
execute positioned ~ ~-2 ~ if block ~ ~ ~ #sulstalk:can_pass_through positioned as @s positioned ~ ~1 ~ if block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~1 ~ if block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block -1
execute positioned ~ ~-4 ~ if block ~ ~ ~ #sulstalk:can_pass_through positioned as @s positioned ~ ~ ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block -2
execute positioned ~ ~-4 ~ if block ~ ~ ~ #sulstalk:can_pass_through positioned as @s positioned ~ ~ ~ if block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block -2
execute positioned ~ ~-2 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 1
execute positioned ^ ^ ^1 positioned ~ ~-2 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned ^ ^ ^1 unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 1
execute positioned ~ ~-2 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned as @s positioned ~ ~2 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 2
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~-2 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned as @s positioned ~ ~2 ~ if block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 2
execute positioned ~ ~ ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned as @s positioned ~ ~-1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~-1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~-1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~-1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through positioned ~ ~-1 ~ unless block ~ ~ ~ #sulstalk:can_pass_through run scoreboard players set @s sulstalk_is_in_block 3


execute positioned ^ ^ ^0.1 positioned ~ ~ ~ unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~ ~1 ~ unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~ ~-1 ~ unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~ ~2 ~ unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~0.1 ~ ~ unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~0.1 ~ ~0.1 unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~0.1 ~ ~-0.1 unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~-0.1 ~ ~ unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~-0.1 ~ ~0.1 unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~-0.1 ~ ~-0.1 unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~ ~ ~0.1 unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~ ~ ~-0.1 unless score @s sulstalk_is_in_block matches -1..2 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy

execute positioned ^ ^ ^0.1 positioned ~ ~ ~ if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~ ~1 ~ if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~ ~-1 ~ if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~ ~2 ~ if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~0.1 ~ ~ if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~0.1 ~ ~0.1 if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~0.1 ~ ~-0.1 if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~-0.1 ~ ~ if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~-0.1 ~ ~0.1 if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~-0.1 ~ ~-0.1 if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~ ~ ~0.1 if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy
execute positioned ^ ^ ^0.1 positioned ~ ~ ~-0.1 if score @s sulstalk_travel_timer matches 3600..4000 unless block ~ ~ ~ #sulstalk:can_interact_with run setblock ~ ~ ~ air destroy


execute if score @s sulstalk_is_following_entity matches 1 run scoreboard players set @s sulstalk_is_in_block 0
execute if score @s sulstalk_is_following_entity matches 1 run scoreboard players set @s sulstalk_will_be_in_block 0
execute if score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_travel_timer_enabled matches 1 run scoreboard players set @s sulstalk_travel_timer_enabled 2
execute if score @s sulstalk_is_following_entity matches 0 if score @s sulstalk_travel_timer_enabled matches 2 run scoreboard players set @s sulstalk_travel_timer_enabled 1
execute if score @s sulstalk_travel_timer matches 0..100 if score @s sulstalk_is_in_block matches ..-1 run scoreboard players set @s sulstalk_is_in_block 1
execute if score @s sulstalk_travel_timer matches 0..50 if score @s sulstalk_is_in_block matches 1 run scoreboard players set @s sulstalk_is_in_block 0
execute if score @s sulstalk_travel_timer matches 0..100 if score @s sulstalk_will_be_in_block matches ..-1 run scoreboard players set @s sulstalk_will_be_in_block 1
execute if score @s sulstalk_travel_timer matches 0..50 if score @s sulstalk_will_be_in_block matches 1 run scoreboard players set @s sulstalk_will_be_in_block 0
execute if score @s sulstalk_underwater matches 1..2 if score @s sulstalk_is_in_block matches 1.. run scoreboard players set @s sulstalk_is_in_block -1
execute if score @s sulstalk_underwater matches -2..-1 run scoreboard players set @s sulstalk_is_in_block 1
execute if score @s sulstalk_travel_timer matches 3900..4000 if score @s sulstalk_is_in_block matches -9999.. run scoreboard players set @s sulstalk_is_in_block -2
execute if score @s sulstalk_travel_timer matches 3900 if score @s sulstalk_is_in_block matches -2 run scoreboard players set @s sulstalk_travel_timer 0
execute if score @s sulstalk_travel_timer matches 3600..3900 if score @s sulstalk_is_in_block matches -9999.. run scoreboard players set @s sulstalk_is_in_block -1
execute if score @s sulstalk_travel_timer matches 3600 if score @s sulstalk_is_in_block matches -1 run scoreboard players set @s sulstalk_travel_timer 0
execute if score @s sulstalk_travel_timer matches 3300..3600 unless score @s sulstalk_is_in_block matches 0 run scoreboard players set @s sulstalk_is_in_block 0
execute if score @s sulstalk_travel_timer matches 3300 if score @s sulstalk_is_in_block matches 0 run scoreboard players set @s sulstalk_travel_timer 0
execute if score @s sulstalk_damaged matches 1 run scoreboard players set @s sulstalk_is_in_block 0
execute if score @s sulstalk_should_die matches 1.. run scoreboard players set @s sulstalk_should_move 0

execute if score @s sulstalk_is_in_block matches 1 at @s run tp ~0.0 ~0.05 ~0.0
execute if score @s sulstalk_is_in_block matches 2..3 at @s run tp ~0.0 ~0.5 ~0.0
execute if score @s sulstalk_is_in_block matches -1 at @s run tp ~0.0 ~-0.05 ~0.0
execute if score @s sulstalk_is_in_block matches -2 at @s run tp ~0.0 ~-0.2 ~0.0
#execute if score @s sulstalk_is_in_block matches 1 run scoreboard players add @s sulstalk_position_y 000500
#execute if score @s sulstalk_is_in_block matches 2 run scoreboard players add @s sulstalk_position_y 005000
#execute if score @s sulstalk_is_in_block matches -1 run scoreboard players remove @s sulstalk_position_y 000500
#execute if score @s sulstalk_is_in_block matches -2 run scoreboard players remove @s sulstalk_position_y 002000

execute if score @s sulstalk_should_move matches -1 run scoreboard players set @s sulstalk_should_move 1
execute unless score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_should_move matches 1 at @s run tp ^0.0 ^0.0 ^0.05
execute unless score @s sulstalk_is_following_entity matches 1 if score @s sulstalk_should_move matches 0 at @s run tp ^0.0 ^0.0 ^0.01

execute if score @s sulstalk_should_rotate matches 0 store result score @s sulstalk_should_rotate run random value -200..200
execute if score @s sulstalk_should_rotate matches 0..49 store result score @s sulstalk_should_rotate run random value 0..200
execute if score @s sulstalk_should_rotate matches -200..-50 store result score @s sulstalk_should_rotate run random value 0..200
execute if score @s sulstalk_should_rotate matches -49..0 store result score @s sulstalk_should_rotate run random value -200..0
execute if score @s sulstalk_should_rotate matches 50..200 store result score @s sulstalk_should_rotate run random value 0..200
execute if score @s sulstalk_is_following_entity matches 1 run scoreboard players set @s sulstalk_should_rotate 0
execute if score @s sulstalk_should_rotate matches -1 at @s run rotate @s ~-1 ~0.0
execute if score @s sulstalk_should_rotate matches -2 at @s run rotate @s ~-5 ~0.0
execute if score @s sulstalk_should_rotate matches -200 at @s run rotate @s ~-45 ~0.0
execute if score @s sulstalk_should_rotate matches 1 at @s run rotate @s ~1 ~0.0
execute if score @s sulstalk_should_rotate matches 2 at @s run rotate @s ~5 ~0.0
execute if score @s sulstalk_should_rotate matches 200 at @s run rotate @s ~45 ~0.0
execute if score @s sulstalk_can_rotate_up matches 0 at @s run rotate @s ~0.0 0.0

#execute store result entity @s Pos[0] double 0.0001 run scoreboard players get @s sulstalk_position_x
#execute store result entity @s Pos[1] double 0.0001 run scoreboard players get @s sulstalk_position_y
#execute store result entity @s Pos[2] double 0.0001 run scoreboard players get @s sulstalk_position_z

execute positioned as @s positioned ~ ~-2 ~ rotated as @s rotated ~ ~ run function sulstalk:sully/interactions

##Trigger for this is separately defined for the hitbox in sulstalk:sully/interactions/physical/hitbox
execute if score @s sulstalk_should_die matches 2 run kill @s

##Teleport duration is in ticks per second (20tps -> 1sec)
data modify entity @s teleport_duration set value 5
data merge entity @s {item_display:"head",billboard:"vertical"}
##Temporary model is Rue
data merge entity @s {item:{count:1,id:"minecraft:azalea_leaves",components:{"minecraft:item_model":"rue:rue"}}}