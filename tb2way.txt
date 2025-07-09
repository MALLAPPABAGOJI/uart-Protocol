`timescale 1ns/1ps
module tb_uart;

    logic [7:0] u1_din = 8'd120;
    logic u1_run = 0, u1_tx, u1_done, u1_err;
    logic [7:0] u1_dout;
    logic u1_s0 = 1, u1_s1 = 0;

    logic [7:0] u2_din = 8'd240;
    logic u2_run = 0, u2_tx, u2_done, u2_err;
    logic [7:0] u2_dout;
    logic u2_s0 = 1, u2_s1 = 0;

    logic u1_rx, u2_rx;
    logic w1, w2;

    assign w1 = u1_tx;
    assign w2 = u2_tx;
    assign u1_rx = w2;
    assign u2_rx = w1;

    uart_module u1 (
        .s0(u1_s0), .s1(u1_s1), .run(u1_run),
        .din(u1_din), .rx(u1_rx), .tx(u1_tx),
        .dout(u1_dout), .done(u1_done), .err(u1_err)
    );

    uart_module u2 (
        .s0(u2_s0), .s1(u2_s1), .run(u2_run),
        .din(u2_din), .rx(u2_rx), .tx(u2_tx),
        .dout(u2_dout), .done(u2_done), .err(u2_err)
    );

    initial begin
        $dumpfile("uart.vcd");
        $dumpvars(0, tb_uart);

        #50;
        u1_run = 1;
        u2_run = 1;

        #2500;
        $display("U1 Received: %0d | Done: %b | Error: %b", u1_dout, u1_done, u1_err);
        $display("U2 Received: %0d | Done: %b | Error: %b", u2_dout, u2_done, u2_err);

        $finish;
    end
endmodule
