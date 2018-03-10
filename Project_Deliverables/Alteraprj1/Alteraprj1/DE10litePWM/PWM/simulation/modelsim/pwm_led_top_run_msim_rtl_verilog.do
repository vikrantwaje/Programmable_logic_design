transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Alteraprj1/DE10litePWM/PWM/source {C:/Alteraprj1/DE10litePWM/PWM/source/pwm_led_top.v}
vlog -vlog01compat -work work +incdir+C:/Alteraprj1/DE10litePWM/PWM/source {C:/Alteraprj1/DE10litePWM/PWM/source/pwm_gen.v}
vlog -vlog01compat -work work +incdir+C:/Alteraprj1/DE10litePWM/PWM/source {C:/Alteraprj1/DE10litePWM/PWM/source/debouncer.v}
vlog -vlog01compat -work work +incdir+C:/Alteraprj1/DE10litePWM/PWM {C:/Alteraprj1/DE10litePWM/PWM/pwm_pll.v}
vlog -vlog01compat -work work +incdir+C:/Alteraprj1/DE10litePWM/PWM/db {C:/Alteraprj1/DE10litePWM/PWM/db/pwm_pll_altpll.v}

