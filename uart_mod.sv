module uart_module (
    input logic s0, s1, run,
    input logic [7:0] din,
    input logic rx,
    output logic tx,
    output logic [7:0] dout,
    output logic done,
    output logic err
);
    logic clk = 0;

    // Baud Clock (just a free-running clock here)
    always #10 clk = ~clk;

    uart ucore (
        .clk(clk),
        .run(run),
        .rx(rx),
        .din(din),
        .tx(tx),
        .dout(dout),
        .done(done),
        .err(err)
    );
endmodule
