transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/sasuk/Desktop/coisas academicas/Terceiro ano/Lab Dig/exp_7/temporizador.vhd}

