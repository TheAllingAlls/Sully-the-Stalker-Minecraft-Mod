scoreboard objectives add sulstalk_hello_world_speak_gametime trigger ""
execute as @r run scoreboard players set @s sulstalk_hello_world_speak_gametime 0
execute as @e if score @s sulstalk_hello_world_speak_gametime matches 0 store result score @s sulstalk_hello_world_speak_gametime run time query gametime
execute as @e if score @s sulstalk_hello_world_speak_gametime matches 0..50 run tellraw @a "It's almost time."
scoreboard objectives remove sulstalk_hello_world_speak_gametime