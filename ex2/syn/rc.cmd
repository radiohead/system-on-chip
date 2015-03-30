# Cadence Encounter(R) RTL Compiler
#   version RC12.22 - v12.20-s014_1 (64-bit) built Aug  2 2013
#
# Run with the following arguments:
#   -logfile rc.log
#   -cmdfile rc.cmd

set_attribute lib_search_path /tech/umc/faraday/Core/fsd0a_a/2007Q1v1.7
;5Aset_attribute lib_search_path /tech/umc/faraday/Core/fsd0a_a/2007Q1v1.7 /GENERIC_CORE_1D2V/FrontEnd/synopsys/ /
clear
set_attribute lib_search_path /tech/umc/faraday/Core/fsd0a_a/2007Q1v1.7/GENERIC_CORE_1D2V/FrontEnd/synopsys/ /
set_attribute library fsd0a_a_generic_core_1d2vtc.lib
set_attribute hdl_vhdl_environment common
set_attribute hdl_vhdl_read_version 1993
set_attribute hdl_language vhdl
read_hdl shift_adder.vhd
elaborate
define_clock -period 2000 -name clk [clock]
define_clock -period 2000 -name clk clock
set_attribute clock_network_late_latency 450 clk
set_attribute clock_source_early_latency 400 clk
set_attribute clock_setup_uncertainty 475 clk
set_attribute clock_hold_uncertainty 270 clk
external_delay -clock clk -input 100 [find /des* -port ports_in/*]
external_delay -clock clk -output 400 [find /des* -port ports_out/*]
synthesize -to_mapped
write_hdl > netlist_syn.v
write_sdc > design.sdc
write_sdf design.sdf
write_sdf > design.sdf
exit
