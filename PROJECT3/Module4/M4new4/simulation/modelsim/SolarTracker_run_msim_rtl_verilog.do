transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/Homework/PSOC/Project3/M4new4 {F:/Homework/PSOC/Project3/M4new4/SolarTracker.v}

