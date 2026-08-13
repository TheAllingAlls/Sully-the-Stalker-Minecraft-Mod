execute if score @s sulstalk_ticks_quarter matches ..-1 run scoreboard players set @s sulstalk_ticks_quarter 5
scoreboard players remove @s sulstalk_ticks_quarter 1
execute if score @s sulstalk_ticks_quarter matches 0 run scoreboard players set @s sulstalk_quarter_tick 1
execute unless score @s sulstalk_ticks_quarter matches 0 run scoreboard players set @s sulstalk_quarter_tick 0