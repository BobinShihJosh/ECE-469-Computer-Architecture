onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /alustim/A
add wave -noupdate -radix hexadecimal /alustim/B
add wave -noupdate /alustim/cntrl
add wave -noupdate /alustim/result
add wave -noupdate /alustim/negative
add wave -noupdate /alustim/zero
add wave -noupdate /alustim/overflow
add wave -noupdate /alustim/carry_out
add wave -noupdate /alustim/dut/tmp_Alu
add wave -noupdate /alustim/dut/zf/alu
add wave -noupdate /alustim/dut/zf/out
add wave -noupdate /alustim/dut/zf/tmp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {600000000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 82
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2331014747 ps}
