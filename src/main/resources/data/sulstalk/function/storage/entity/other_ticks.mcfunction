execute if score @s sulstalk_ticks_other matches ..-1 run scoreboard players set @s sulstalk_ticks_other 2
scoreboard players remove @s sulstalk_ticks_other 1
execute if score @s sulstalk_ticks_other matches 0 run scoreboard players set @s sulstalk_other_tick 1
execute unless score @s sulstalk_ticks_other matches 0 run scoreboard players set @s sulstalk_other_tick 0