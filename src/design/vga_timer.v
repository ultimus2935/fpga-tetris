module vga_timer (
    input wire clk,
    input wire rst,

    // VGA timing signals
    output wire hsync,
    output wire vsync,

    // State signals for pixel generation
    output wire video_on,
    output reg [9:0] h_count, 
    output reg [9:0] v_count
);
    localparam H_MAX = 800, V_MAX = 525;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            h_count <= 0;
            v_count <= 0;
        end else begin
            if (h_count < H_MAX - 1) begin
                h_count <= h_count + 1;
            end else begin
                h_count <= 0;
                if (v_count < V_MAX - 1) begin
                    v_count <= v_count + 1;
                end else begin
                    v_count <= 0;
                end
            end
        end
    end

    assign hsync = (h_count >= 656 && h_count <= 751) ? 0 : 1;
    assign vsync = (v_count >= 490 && v_count <= 491) ? 0 : 1;
    assign video_on = (h_count < 640 && v_count < 480) ? 1 : 0;

endmodule