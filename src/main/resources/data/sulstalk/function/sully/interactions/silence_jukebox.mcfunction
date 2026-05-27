execute positioned ~ ~ ~ unless entity @e[tag=sulstalk_defiled_disc,distance=..3.1,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music[has_record=true] run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc","sulstalk_dropped"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~1 ~ ~1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3.1,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music[has_record=true] run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc","sulstalk_dropped"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~1 ~ ~-1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3.1,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music[has_record=true] run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc","sulstalk_dropped"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~ ~ ~1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3.1,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music[has_record=true] run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc","sulstalk_dropped"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~ ~ ~-1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3.1,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music[has_record=true] run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc","sulstalk_dropped"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~1 ~ ~ unless entity @e[tag=sulstalk_defiled_disc,distance=..3.1,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music[has_record=true] run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc","sulstalk_dropped"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~-1 ~ ~ unless entity @e[tag=sulstalk_defiled_disc,distance=..3.1,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music[has_record=true] run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc","sulstalk_dropped"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~-1 ~ ~1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3.1,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music[has_record=true] run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc","sulstalk_dropped"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}
execute positioned ~-1 ~ ~-1 unless entity @e[tag=sulstalk_defiled_disc,distance=..3.1,limit=1,sort=nearest] if block ~ ~ ~ #sulstalk:can_destroy_music[has_record=true] run summon item ~ ~1 ~ {Tags:["sulstalk_defiled_disc","sulstalk_dropped"],Item:{count:1,id:"stick",components:{"item_name":"Defiled Disc","item_model":"air"}}}

execute as @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] positioned as @s run data merge entity @s {PickupDelay:2s}
execute as @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] positioned as @s run data modify entity @s Item.id set from block ~ ~-0.2 ~ RecordItem.id
execute as @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] positioned as @s run data modify entity @s Item.id set from block ~ ~-0.1 ~ RecordItem.id
execute as @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] positioned as @s run data remove entity @s Item.components.minecraft:item_model
# execute as @e[tag=sulstalk_defiled_disc,distance=..3,limit=1,sort=nearest] positioned as @s run data modify entity @s Item.components.minecraft:item_model set from entity @s Item.id

execute positioned ~ ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run data remove block ~ ~ ~ RecordItem
execute positioned ~1 ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run data remove block ~ ~ ~ RecordItem
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run data remove block ~ ~ ~ RecordItem
execute positioned ~ ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run data remove block ~ ~ ~ RecordItem
execute positioned ~ ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run data remove block ~ ~ ~ RecordItem
execute positioned ~1 ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run data remove block ~ ~ ~ RecordItem
execute positioned ~-1 ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run data remove block ~ ~ ~ RecordItem
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run data remove block ~ ~ ~ RecordItem
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run data remove block ~ ~ ~ RecordItem

execute positioned ~ ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~1 ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~ ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~ ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~1 ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~-1 ~ ~ if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #sulstalk:can_destroy_music run setblock ~ ~ ~ jukebox