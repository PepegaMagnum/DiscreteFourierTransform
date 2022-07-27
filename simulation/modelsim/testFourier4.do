restart -nowave -force
add wave -radix decimal x0
add wave -radix decimal x2
add wave -radix decimal x4
add wave -radix decimal x6

add wave -radix decimal cona0
add wave -radix decimal cona1
add wave -radix decimal cona2
add wave -radix decimal cona3

add wave -radix decimal b0r
add wave -radix decimal b0i

add wave -radix decimal b1r
add wave -radix decimal b1i

add wave -radix decimal b2r
add wave -radix decimal b2i

add wave -radix decimal b3r
add wave -radix decimal b3i

add wave -radix decimal temp0
add wave -radix decimal temp1

add wave -radix decimal w14


force x0 0 0, 00010000 20
force x2 0 0, 00010000 20
force x4 0 0, 11110000 20
force x6 0 0, 11110000 20

run 50
