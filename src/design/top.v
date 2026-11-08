module top (
    input wire clk, // 100MHz system clock
    input wire rst, // System reset

    // VGA timing signals
    output wire hsync,  // Horizontal sync signal
    output wire vsync,  // Vertical sync signal

    // VGA color signals
    output wire [3:0] vga_red,   // 4-bit red color signal
    output wire [3:0] vga_green, // 4-bit green color signal
    output wire [3:0] vga_blue   // 4-bit blue color signal
);
    wire clk_vga; // 25.175MHz clock for VGA timing

    clk_wiz_0 clk_wiz_inst (
        .clk_in1(clk),
        .clk_out1(clk_vga)
    );

    wire video_on; // Indicates whether the current pixel is within the visible area
    wire [9:0] vga_x; // Current pixel's x-coordinate
    wire [9:0] vga_y; // Current pixel's y-coordinate

    vga_timer vga_timer_inst (
        .clk(clk_vga),
        .rst(rst),

        .hsync(hsync),
        .vsync(vsync),

        .video_on(video_on),
        .h_count(vga_x),
        .v_count(vga_y)
    );

endmodule