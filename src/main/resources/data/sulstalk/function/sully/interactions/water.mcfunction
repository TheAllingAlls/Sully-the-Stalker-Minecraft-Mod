scoreboard objectives add sulstalk_underwater trigger ""
scoreboard objectives add sulstalk_underwater_rotate trigger ""
execute unless score @s sulstalk_underwater matches -1.. run scoreboard players set @s sulstalk_underwater 0
execute unless score @s sulstalk_underwater_rotate matches 1..4 run scoreboard players set @s sulstalk_underwater_rotate 0

execute positioned as @s unless block ~ ~ ~ #sulstalk:can_be_trapped_under positioned ~ ~1 ~ unless block ~ ~ ~ #sulstalk:can_be_trapped_under positioned ~ ~-2 ~ unless block ~ ~ ~ #sulstalk:can_be_trapped_under run scoreboard players set @s sulstalk_underwater 0
execute if score @s sulstalk_underwater matches 0 run scoreboard players set @s sulstalk_underwater_rotate 0
execute positioned as @s if block ~ ~ ~ #sulstalk:can_be_trapped_under positioned ~ ~2 ~ if block ~ ~ ~ #sulstalk:can_be_trapped_under positioned as @s positioned ~ ~-2 ~ if block ~ ~ ~ #sulstalk:can_be_trapped_under run scoreboard players set @s sulstalk_underwater 3
execute if score @s sulstalk_underwater matches 1..3 positioned as @s positioned ^ ^ ^1 positioned ~ ~1 ~ unless block ~ ~ ~ #sulstalk:can_be_trapped_under positioned as @s positioned ~ ~-1 ~ unless block ~ ~ ~ #sulstalk:can_be_trapped_under run scoreboard players set @s sulstalk_underwater 2
execute if score @s sulstalk_underwater matches 2..3 positioned as @s positioned ^ ^ ^1 positioned ~ ~2 ~ unless block ~ ~ ~ #sulstalk:can_be_trapped_under positioned as @s positioned ~ ~-1 ~ unless block ~ ~ ~ #sulstalk:can_be_trapped_under run scoreboard players set @s sulstalk_underwater 1
execute if score @s sulstalk_underwater matches 3 positioned as @s positioned ^ ^ ^1 positioned ~ ~-2 ~ if block ~ ~ ~ #sulstalk:can_be_trapped_under positioned as @s positioned ~ ~-2 ~ if block ~ ~ ~ #sulstalk:can_be_trapped_under positioned ~ ~1 ~ unless block ~ ~ ~ #sulstalk:can_be_trapped_under run scoreboard players set @s sulstalk_underwater 1
execute if score @s sulstalk_underwater matches 0..3 positioned as @s if block ~ ~ ~ #sulstalk:water_trap[waterlogged=true] run scoreboard players set @s sulstalk_underwater 4
execute if score @s sulstalk_underwater matches 0..3 positioned as @s if block ~ ~-1 ~ #sulstalk:water_trap[waterlogged=true] run scoreboard players set @s sulstalk_underwater 4
execute if score @s sulstalk_underwater matches 0..3 positioned as @s if block ~ ~1 ~ #sulstalk:water_trap[waterlogged=true] run scoreboard players set @s sulstalk_underwater 4
execute if score @s sulstalk_underwater matches 4 positioned as @s unless block ~ ~ ~ #sulstalk:water_trap[waterlogged=true] unless block ~ ~-1 ~ #sulstalk:water_trap[waterlogged=true] unless block ~ ~1 ~ #sulstalk:water_trap[waterlogged=true] unless block ~1 ~ ~ #sulstalk:water_trap[waterlogged=true] unless block ~-1 ~ ~ #sulstalk:water_trap[waterlogged=true] unless block ~ ~ ~1 #sulstalk:water_trap[waterlogged=true] unless block ~ ~ ~-1 #sulstalk:water_trap[waterlogged=true] run scoreboard players set @s sulstalk_underwater 0

execute if score @s sulstalk_underwater matches 1..3 positioned as @s rotated as @s if block ^ ^ ^1.15 #sulstalk:can_pass_through run scoreboard players set @s sulstalk_underwater_rotate 0
execute if score @s sulstalk_underwater matches 1..3 positioned as @s rotated as @s positioned ^ ^ ^1.15 unless block ~ ~ ~ #sulstalk:can_pass_through unless block ^-0.5 ^ ^ #sulstalk:can_pass_through unless block ^0.5 ^ ^ #sulstalk:can_pass_through if score @s sulstalk_underwater_rotate matches 0 store result score @s sulstalk_underwater_rotate run random value 1..2

execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s if block ^ ^ ^0.5 #sulstalk:water_trap[waterlogged=true] run scoreboard players set @s sulstalk_underwater_rotate 0
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s positioned ~ ~-1 ~ if block ^ ^ ^0.5 #sulstalk:water_trap[waterlogged=true] run scoreboard players set @s sulstalk_underwater_rotate 0
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s unless score @s sulstalk_underwater_rotate matches 4 unless block ^ ^ ^0.5 #sulstalk:water_trap[waterlogged=true] if block ^0.5 ^ ^ #sulstalk:water_trap[waterlogged=true] run scoreboard players set @s sulstalk_underwater_rotate 3
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s unless score @s sulstalk_underwater_rotate matches 3 unless block ^ ^ ^0.5 #sulstalk:water_trap[waterlogged=true] if block ^-0.5 ^ ^ #sulstalk:water_trap[waterlogged=true] run scoreboard players set @s sulstalk_underwater_rotate 4
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s if score @s sulstalk_underwater_rotate matches 4 if block ^1 ^ ^ #sulstalk:water_trap[waterlogged=true] run scoreboard players set @s sulstalk_underwater_rotate 3
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s if score @s sulstalk_underwater_rotate matches 3 if block ^-1 ^ ^ #sulstalk:water_trap[waterlogged=true] run scoreboard players set @s sulstalk_underwater_rotate 4

execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s if block ~ ~ ~ #sulstalk:water_trap[waterlogged=true] positioned ~ ~-1 ~ if block ^ ^ ^0.6 #sulstalk:water_trap[waterlogged=true] positioned as @s run tp ~ ~-0.05 ~
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s if block ~ ~ ~ #sulstalk:water_trap[waterlogged=true] positioned ~ ~1 ~ if block ^ ^ ^0.6 #sulstalk:water_trap[waterlogged=true] positioned as @s run tp ~ ~0.05 ~

execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s if score @s sulstalk_underwater_rotate matches 0 if block ^ ^ ^0.5 #sulstalk:water_trap[waterlogged=true] run tp ^ ^ ^0.06
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s if score @s sulstalk_underwater_rotate matches 0 unless block ^ ^ ^0.5 #sulstalk:water_trap[waterlogged=true] positioned ~ ~-0.5 ~ if block ^ ^ ^0.5 #sulstalk:water_trap[waterlogged=true] run tp ^ ^ ^0.06
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s if score @s sulstalk_underwater_rotate matches 0 unless block ^ ^ ^0.5 #sulstalk:water_trap[waterlogged=true] positioned ~ ~0.5 ~ if block ^ ^ ^0.5 #sulstalk:water_trap[waterlogged=true] run tp ^ ^ ^0.06
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s unless block ~ ~ ~ #sulstalk:water_trap[waterlogged=true] if block ~ ~-1 ~ #sulstalk:water_trap[waterlogged=true] run tp ~ ~-0.5 ~
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s unless block ~ ~ ~ #sulstalk:water_trap[waterlogged=true] if block ~ ~1 ~ #sulstalk:water_trap[waterlogged=true] run tp ~ ~0.5 ~
execute if score @s sulstalk_underwater matches 4 rotated as @s positioned as @s if score @s sulstalk_underwater_rotate matches 3..4 if block ^ ^ ^-0.5 #sulstalk:water_trap[waterlogged=true] run tp ^ ^ ^-0.01

execute if score @s sulstalk_underwater matches 4 run scoreboard players reset @s sulstalk_health

execute if score @s sulstalk_underwater_rotate matches 1 rotated as @s run rotate @s ~-45 ~0.0
execute if score @s sulstalk_underwater_rotate matches 2 rotated as @s run rotate @s ~45 ~0.0
execute if score @s sulstalk_underwater_rotate matches 3 rotated as @s run rotate @s ~-15 ~0.0
execute if score @s sulstalk_underwater_rotate matches 4 rotated as @s run rotate @s ~15 ~0.0
execute if score @s sulstalk_underwater_rotate matches 5 rotated as @s run rotate @s ~90 ~0.0
