# ####################################################################

#  Created by Encounter(R) RTL Compiler RC12.22 - v12.20-s014_1 on Mon Mar 30 08:34:31 +0300 2015

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design shift_adder

create_clock -name "clk" -add -period 2.0 -waveform {0.0 1.0} [get_ports clock]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {righthand[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {righthand[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {righthand[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {righthand[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {righthand[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {righthand[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {righthand[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {righthand[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {lefthand[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {lefthand[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {lefthand[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {lefthand[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {lefthand[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {lefthand[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {lefthand[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {lefthand[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports reset]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports clock]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {result[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {result[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {result[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {result[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {result[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {result[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {result[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {result[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {result[8]}]
set_wire_load_mode "enclosed"
set_wire_load_selection_group "DEFAULT" -library "fsd0a_a_generic_core_1d2vtc"
set_dont_use [get_lib_cells fsd0a_a_generic_core_1d2vtc/BHD1]
set_dont_use [get_lib_cells fsd0a_a_generic_core_1d2vtc/CKLD]
set_clock_latency -max 0.45 [get_clocks clk]
set_clock_latency -source -min 0.4 [get_clocks clk]
set_clock_uncertainty -setup 0.475 [get_clocks clk]
set_clock_uncertainty -hold 0.27 [get_clocks clk]
