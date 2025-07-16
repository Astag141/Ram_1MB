
module tb_odd_data_even_addr;
    reg clk = 0;
    reg we;
    reg [19:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    ram_1mb uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk;
    integer i;

    initial begin
        we = 1;
        for (i = 0; i < 25; i = i + 2) begin
            addr = i;
            data_in = (i + 1); #10;
        end

        we = 0;
        for (i = 0; i < 25; i = i + 2) begin
            addr = i; #10;
            $display("Read @ %0d: %0d", addr, data_out);
        end

        $finish;
    end
endmodule