module pixel_gen (
    input wire x, // Current pixel's x-coordinate
    input wire y, // Current pixel's y-coordinate

    input wire video_on, // Indicates whether the current pixel is within the visible area

    output wire [3:0] vga_red,   // 4-bit red color signal
    output wire [3:0] vga_green, // 4-bit green color signal
    output wire [3:0] vga_blue   // 4-bit blue color signal
);
    localparam GRID_SPACING = 20; // Spacing between grid lines in pixels
    localparam GRIDLINE_WIDTH = 2; // Color of the grid lines (light gray)

    localparam BOX_WIDTH = 200,  // Width of the rectangle
               BOX_HEIGHT = 400; // Height of the rectangle

    localparam BOX_X = 220,      // X-coordinate of the rectangle's top-left corner
               BOX_Y = 40;       // Y-coordinate of the rectangle's top-left corner

    localparam BOX_X_END = BOX_X + BOX_WIDTH,   // X-coordinate of the rectangle's bottom-right corner
               BOX_Y_END = BOX_Y + BOX_HEIGHT;  // Y-coordinate of the rectangle's bottom-right corner


    // Drawing FSM with color values
    localparam BLANKING = 12'h000, // Blankin when video_on is low (black)
               GRIDLINE = 12'hDDD, // Grid lines every 20 pixels (light gray)
               PLAYAREA = 12'h314, // Area between grid lines (dark purple)
               OUTER = 12'h666;    // Area outside the rectangle (dark gray)

    reg [11:0] state = OUTER; // Current state of the FSM

    reg [4:0] local_x = 0; // Local x-coordinate within the rectangle
    reg [4:0] local_y = 0; // Local y-coordinate within the rectangle 

    always @(x) local_x <= local_x + 1;
    always @(y) local_y <= local_y + 1;

    always @(*) begin
        case (state)
            BLANKING: if (video_on) state <= OUTER;

            GRIDLINE: begin
                if (local_x == GRID_SPACING && local_y == GRIDLINE_WIDTH) state <= PLAYAREA;
            end

            PLAYAREA: begin
                if (x == BOX_X_END || y == BOX_Y_END) state <= OUTER;
            
                else if (local_x == GRID_SPACING || local_y == GRID_SPACING) begin
                    local_x <= 0;
                    local_y <= 0;

                    state <= GRIDLINE;
                end
            end
            OUTER: begin
                if (!video_on) state <= BLANKING;

                else if (x >= BOX_X && y >= BOX_Y) begin
                    local_x <= 0;
                    local_y <= 0;

                    state <= GRIDLINE;
                end
            end
        endcase
    end

    assign {vga_red, vga_green, vga_blue} = state;   // Red color for the rectangle

endmodule