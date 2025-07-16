
module tb_ram_1mb;
    reg clk = 0;
    reg we = 0;
    reg [19:0] addr = 0;
    reg [7:0] data_in = 0;
    wire [7:0] data_out;

    ram_1mb uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Testbench: Writing then Reading Back");

        // Write phase
        we = 1;
        addr = 20'h00001; data_in = 8'hAA; #10;
        addr = 20'h00002; data_in = 8'h55; #10;

        // Read phase
        we = 0;
        addr = 20'h00001; #10;
        $display("Read Addr %h: %h", addr, data_out);

        addr = 20'h00002; #10;
        $display("Read Addr %h: %h", addr, data_out);

        $finish;
    end
endmodule