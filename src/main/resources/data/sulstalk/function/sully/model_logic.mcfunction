scoreboard objectives add sulstalk_model_type trigger ""
scoreboard objectives add sulstalk_model trigger ""

##Teleport duration is in ticks per second (20tps -> 1sec)
data modify entity @s teleport_duration set value 5
data merge entity @s {item_display:"head",billboard:"vertical"}
data merge entity @s {item:{count:1,id:"minecraft:azalea_leaves"}}
#Temporary model is Rue
#data merge entity @s {item:{count:1,id:"minecraft:azalea_leaves",components:{"minecraft:item_model":"rue:rue"}}}