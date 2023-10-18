module fifo_buffer (
    input clk_write, // Clock for writing data
    input clk_read,  // Clock for reading data
    input rst,       // Reset input
    input wr_en,     // Write enable
    input [7:0] wr_data, // Data to be written
    input rd_en,     // Read enable
    output reg [7:0] rd_data, // Data to be read
    output reg empty,
    output reg full
);

parameter DEPTH = 4;
reg [7:0] mem [0:DEPTH-1];
reg [2:0] wr_ptr, rd_ptr;
reg [2:0] count;

always @(posedge clk_write or posedge rst) begin
    if (rst) begin
        wr_ptr <= 3'b000;
        count <= 3'b000;
        empty <= 1'b1;
        full <= 1'b0;
    end else begin
        if (wr_en && !full) begin
            mem[wr_ptr] <= wr_data;
            wr_ptr <= wr_ptr + 1;
            count <= count + 1;
            if (count == DEPTH-1)
                full <= 1'b1;
        end
    end
end

always @(posedge clk_read or posedge rst) begin
    if (rst) begin
        rd_ptr <= 3'b000;
    end else begin
        if (rd_en && !empty) begin
            rd_data <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            count <= count - 1;
            if (count == 1)
                empty <= 1'b1;
        end
    end
end

endmodule
