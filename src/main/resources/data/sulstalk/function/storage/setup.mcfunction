execute positioned 0 0 0 unless entity @e[tag=sulstalk_storage,limit=1,sort=furthest] positioned as @s run function sulstalk:storage/entity/spawn
execute positioned 0 0 0 as @e[tag=sulstalk_storage,limit=1,sort=furthest] positioned as @s run function sulstalk:storage/entity/control

execute positioned 0 0 0 as @e[tag=sulstalk_storage,sort=furthest,limit=1] positioned as @s run function sulstalk:failsafe
execute positioned 0 0 0 as @e[tag=sulstalk_storage,sort=furthest,limit=1] positioned as @s run function sulstalk:sully/spawn