# ####################################################################

#  Created by Encounter(R) RTL Compiler RC9.1.203 - v09.10-s242_1 on Wed Jun 10 13:54:23 EEST 2015

# ####################################################################

set sdc_version 1.7

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design multiplier

create_clock -name "clk" -add -period 20.0 -waveform {0.0 10.0} [get_ports clock]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports enable]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports reset]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports clock]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {y[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {y[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {y[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {y[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {x[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {x[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {x[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.1 [get_ports {x[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {z[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {z[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {z[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {z[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {z[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {z[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {z[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.4 [get_ports {z[7]}]
set_wire_load_mode "enclosed"
set_wire_load_selection_group "DEFAULT" -library "fsd0a_a_generic_core_1d2vtc"
set_dont_use [get_lib_cells fsd0a_a_generic_core_1d2vtc/BHD1]
set_dont_use [get_lib_cells fsd0a_a_generic_core_1d2vtc/CKLD]
set_clock_latency -max 0.45 [get_clocks clk]
set_clock_latency -source -min 0.4 [get_clocks clk]
set_clock_uncertainty -setup 0.475 [get_clocks clk]
set_clock_uncertainty -hold 0.27 [get_clocks clk]
