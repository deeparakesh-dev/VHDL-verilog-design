-- Testbench for logic gates
`timescale 1ns/1ps

module logic_gates_tb;
    reg a;
    reg b;
    wire and_out, or_out, xor_out, nand_out, nor_out;

    logic_gates dut(
        .a(a),
        .b(b),
        .and_out(and_out),
        .or_out(or_out),
        .xor_out(xor_out),
        .nand_out(nand_out),
        .nor_out(nor_out)
    );

    initial begin
        // for waveforms
        $dumpfile("waves.vcd");
        $dumpvars(0, logic_gates_tb);

        $monitor("t=%0dns | a=%b b=%b | AND=%b OR=%b XOR=%b NAND=%b NOR=%b",
                 $time, a, b, and_out, or_out, xor_out, nand_out, nor_out);
        // testcases
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        #10 $finish;
    end
endmodule
