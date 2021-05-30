transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/sasuk/Desktop/coisas academicas/Terceiro ano/Lab Dig/exp 5/comparador.vhd}

vcom -93 -work work {C:/Users/sasuk/Desktop/coisas academicas/Terceiro ano/Lab Dig/exp 5/quarts/../tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
