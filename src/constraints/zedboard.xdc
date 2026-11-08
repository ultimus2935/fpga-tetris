# ----------------------------------------------------------------------------
# Clock Source - 100 MHz Oscillator on ZedBoard
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
# Optional: Define the clock timing constraint for Vivado implementation
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

# ----------------------------------------------------------------------------
# System Reset - Switch 7 (SW7)
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN M15 [get_ports rst]
set_property IOSTANDARD LVCMOS18 [get_ports rst]

# ----------------------------------------------------------------------------
# VGA Output - 12-bit Color (4 Red, 4 Green, 4 Blue)
# ----------------------------------------------------------------------------
# Red
set_property PACKAGE_PIN V20 [get_ports {vga_red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[0]}]
set_property PACKAGE_PIN U20 [get_ports {vga_red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[1]}]
set_property PACKAGE_PIN V19 [get_ports {vga_red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[2]}]
set_property PACKAGE_PIN V18 [get_ports {vga_red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[3]}]

# Green
set_property PACKAGE_PIN AB22 [get_ports {vga_green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[0]}]
set_property PACKAGE_PIN AA22 [get_ports {vga_green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[1]}]
set_property PACKAGE_PIN AB21 [get_ports {vga_green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[2]}]
set_property PACKAGE_PIN AA21 [get_ports {vga_green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[3]}]

# Blue
set_property PACKAGE_PIN Y21 [get_ports {vga_blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[0]}]
set_property PACKAGE_PIN Y20 [get_ports {vga_blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[1]}]
set_property PACKAGE_PIN AB20 [get_ports {vga_blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[2]}]
set_property PACKAGE_PIN AB19 [get_ports {vga_blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[3]}]

# ----------------------------------------------------------------------------
# VGA Sync Signals
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN AA19 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property PACKAGE_PIN Y19 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]