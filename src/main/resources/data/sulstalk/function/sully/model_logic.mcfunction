scoreboard objectives add sulstalk_model_type_number trigger ""
scoreboard objectives add sulstalk_model_framerate trigger ""
scoreboard objectives add sulstalk_model_number trigger ""

execute unless score @s sulstalk_model_type_number matches 0.. run scoreboard players set @s sulstalk_model_type_number 0
execute unless score @s sulstalk_model_framerate matches 0.. run scoreboard players set @s sulstalk_model_framerate 0
execute unless score @s sulstalk_model_number matches 0..143 run scoreboard players set @s sulstalk_model_number 0

##Teleport duration is in ticks per second (20tps -> 1sec)
data modify entity @s teleport_duration set value 5
data merge entity @s {item_display:"head",billboard:"vertical"}
data merge entity @s {item:{count:1,id:"minecraft:azalea_leaves"}}

execute if score @s sulstalk_model_framerate matches 0 run scoreboard players add @s sulstalk_model_number 1
execute unless score @s sulstalk_model_number matches ..143 run scoreboard players set @s sulstalk_model_number 0
execute unless score @s sulstalk_model_number matches ..143 run data modify entity @s data.model_number set value 0
execute if score @s sulstalk_model_framerate matches 0 store result entity @s data.model_number int 1 run scoreboard players get @s sulstalk_model_number
execute if score @s sulstalk_model_framerate matches 0 store result entity @s data.model_type_number int 1 run scoreboard players get @s sulstalk_model_type_number
$execute if score @s sulstalk_model_framerate matches 0 run scoreboard players set @s sulstalk_model_number $(model_number)
$execute if score @s sulstalk_model_framerate matches 0 run data modify entity @s data.model_type set from entity @s data.model_types[$(model_type_number)]
$execute if score @s sulstalk_model_framerate matches 0 run data modify entity @s data.model_name set value "$(model_prefix)_$(model_type)_"
$execute if score @s sulstalk_model_framerate matches 0 if score @s sulstalk_model_number matches 100..999 run data modify entity @s data.model_file set value "$(model_name)0$(model_number)"
$execute if score @s sulstalk_model_framerate matches 0 if score @s sulstalk_model_number matches 10..99 run data modify entity @s data.model_file set value "$(model_name)00$(model_number)"
$execute if score @s sulstalk_model_framerate matches 0 if score @s sulstalk_model_number matches 0..9 run data modify entity @s data.model_file set value "$(model_name)000$(model_number)"

$execute if score @s sulstalk_model_framerate matches 0 run data modify entity @s item.components.minecraft:item_model set value "$(model_file)"

##Repeated for double frames
execute if score @s sulstalk_model_framerate matches 0 run scoreboard players add @s sulstalk_model_number 1
execute unless score @s sulstalk_model_number matches ..143 run scoreboard players set @s sulstalk_model_number 0
execute unless score @s sulstalk_model_number matches ..143 run data modify entity @s data.model_number set value 0
execute if score @s sulstalk_model_framerate matches 0 store result entity @s data.model_number int 1 run scoreboard players get @s sulstalk_model_number
execute if score @s sulstalk_model_framerate matches 0 store result entity @s data.model_type_number int 1 run scoreboard players get @s sulstalk_model_type_number
$execute if score @s sulstalk_model_framerate matches 0 run scoreboard players set @s sulstalk_model_number $(model_number)
$execute if score @s sulstalk_model_framerate matches 0 run data modify entity @s data.model_type set from entity @s data.model_types[$(model_type_number)]
$execute if score @s sulstalk_model_framerate matches 0 run data modify entity @s data.model_name set value "$(model_prefix)_$(model_type)_"
$execute if score @s sulstalk_model_framerate matches 0 if score @s sulstalk_model_number matches 100..999 run data modify entity @s data.model_file set value "$(model_name)0$(model_number)"
$execute if score @s sulstalk_model_framerate matches 0 if score @s sulstalk_model_number matches 10..99 run data modify entity @s data.model_file set value "$(model_name)00$(model_number)"
$execute if score @s sulstalk_model_framerate matches 0 if score @s sulstalk_model_number matches 0..9 run data modify entity @s data.model_file set value "$(model_name)000$(model_number)"

$execute if score @s sulstalk_model_framerate matches 0 run data modify entity @s item.components.minecraft:item_model set value "$(model_file)"

execute if score @s sulstalk_model_framerate matches 0 run scoreboard players set @s sulstalk_model_framerate -1
execute if score @s sulstalk_model_framerate matches 1.. run scoreboard players remove @s sulstalk_model_framerate 1