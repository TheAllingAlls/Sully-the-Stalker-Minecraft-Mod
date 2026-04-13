data merge entity @s {Radius:0.0f}
data modify entity @s Pos set from entity @r Pos
execute store result score @s sulstalk_time_storage run time query gametime
