scoreboard objectives add sulstalk_model_type trigger ""
scoreboard objectives add sulstalk_model_framerate trigger ""
scoreboard objectives add sulstalk_model trigger ""

execute unless score @s sulstalk_model_type matches 0.. run scoreboard players set @s sulstalk_model_type 0
execute unless score @s sulstalk_model_framerate matches 1.. run scoreboard players set @s sulstalk_model_framerate 60
execute unless score @s sulstalk_model matches -1.. run scoreboard players set @s sulstalk_model -1

##Teleport duration is in ticks per second (20tps -> 1sec)
data modify entity @s teleport_duration set value 5
data merge entity @s {item_display:"head",billboard:"vertical"}
data merge entity @s {item:{count:1,id:"minecraft:azalea_leaves"}}
data merge entity @s {item:{components:{"minecraft:item_model":"rue:rue"}}}