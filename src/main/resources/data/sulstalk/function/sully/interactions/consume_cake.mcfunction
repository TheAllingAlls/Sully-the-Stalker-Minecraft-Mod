execute positioned ~ ~ ~ if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~1 ~ ~1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~ ~ ~1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~ ~ ~-1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~1 ~ ~ if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~-1 ~ ~ if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #sulstalk:is_cake unless entity @e[tag=sulstalk_cake_consumer,distance=..2] run summon marker ~ ~ ~ {Tags:["sulstalk_cake_consumer"]}

scoreboard objectives add sulstalk_cake_consume_delay trigger ""
execute as @e[tag=sulstalk_cake_consumer] unless score @s sulstalk_cake_consume_delay matches 0.. run scoreboard players set @s sulstalk_cake_consume_delay 100
execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 0.. run scoreboard players remove @s sulstalk_cake_consume_delay 1

execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 100 positioned as @s positioned ~ ~-0.3 ~ run setblock ~ ~ ~ cake[bites=0]
execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 80 positioned as @s positioned ~ ~-0.3 ~ run setblock ~ ~ ~ cake[bites=1]
execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 50 positioned as @s positioned ~ ~-0.3 ~ run setblock ~ ~ ~ cake[bites=2]
execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 30 positioned as @s positioned ~ ~-0.3 ~ run setblock ~ ~ ~ cake[bites=3]
execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 10 positioned as @s positioned ~ ~-0.3 ~ run setblock ~ ~ ~ cake[bites=4]
execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 5 positioned as @s positioned ~ ~-0.3 ~ run setblock ~ ~ ~ cake[bites=5]
execute as @e[tag=sulstalk_cake_consumer] if score @s sulstalk_cake_consume_delay matches 0 positioned as @s positioned ~ ~-0.3 ~ run setblock ~ ~ ~ cake[bites=6]

execute as @e[tag=sulstalk_cake_consumer] if score @s susltalk_cake_consume_delay matches -1 run kill @s