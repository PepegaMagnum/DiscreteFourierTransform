restart -nowave -force
add wave -radix decimal x0
add wave -radix decimal x4
add wave -radix decimal a0
add wave -radix decimal a1

force x0 0 0, 11100000 20
force x4 0 0, 00110000 20


run 400