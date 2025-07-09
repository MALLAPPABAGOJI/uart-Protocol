module uart (
    input logic clk,
    input logic run,
    input logic rx,
    input logic [7:0] din,
    output logic tx,
    output logic [7:0] dout,
    output logic done,
    output logic err
);

    logic [7:0] tx_reg;
    logic [7:0] rx_reg;
    logic tx_parity;
    logic [3:0] ptr = 0;
    logic sending = 0;

    assign tx = (sending == 0) ? 1 :
                (ptr == 0)     ? 0 :
                (ptr >= 1 && ptr <= 8) ? tx_reg[ptr - 1] :
                (ptr == 9)     ? tx_parity :
                (ptr == 10)    ? 1 : 1;

    always_ff @(posedge clk) begin
        if (run && !sending) begin
            tx_reg <= din;
            tx_parity <= ^din;
            ptr <= 0;
            sending <= 1;
            done <= 0;
            err <= 0;
        end else if (sending) begin
            if (ptr < 10)
                ptr <= ptr + 1;
            else begin
                sending <= 0;
                done <= 1;
                dout <= rx_reg;
            end

            if (ptr >= 1 && ptr <= 8)
                rx_reg[ptr - 1] <= rx;

            if (ptr == 9) begin
                err <= (^rx_reg != rx);
            end
        end
    end
endmodule
