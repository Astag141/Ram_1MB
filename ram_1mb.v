module ram_1mb (
    input wire clk,
    input wire we,                   // Write enable
    input wire [19:0] addr,          // 20-bit address for 1MB = 2^20
    input wire [7:0] data_in,
    output reg [7:0] data_out
);
    reg [7:0] mem [0:(1<<20)-1];     // 1MB of 8-bit memory

    always @(posedge clk) begin
        if (we)
            mem[addr] <= data_in;
        data_out <= mem[addr];
    end
endmodule