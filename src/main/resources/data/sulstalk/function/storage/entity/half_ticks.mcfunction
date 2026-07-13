execute if score @s sulstalk_ticks_half matches ..-1 run scoreboard players set @s sulstalk_ticks_half 10
scoreboard players remove @s sulstalk_ticks_half 1
execute if score @s sulstalk_ticks_half matches 0 run scoreboard players set @s sulstalk_half_tick 1
execute unless score @s sulstalk_ticks_half matches 0 run scoreboard players set @s sulstalk_half_tick 0