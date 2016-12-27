module blinker(
    input 	clk,
    input 	rst,
    output 	LED1,
	output 	LED2,
	output 	LED3,
	output 	LED4
);

	reg [24:0] counter_d, counter_q; // 25-bit counters representing the D and Q of a flipflop

	assign LED1 = counter_q[24]; // 2^25 / 50,000,000 = 0.67 seconds
	assign LED2 = counter_q[23]; // 2^24 / 50,000,000 = 0.34 seconds
	assign LED3 = counter_q[22]; // 2^23 / 50,000,000 = 0.17 seconds
	assign LED4 = counter_q[21]; // 2^22 / 50,000,000 = 0.08 seconds

	always @ (counter_q) begin
		counter_d = counter_q + 1'b1; // Everytime q changes increment d by (q + 1'b1)
	end

	always @ (posedge clk) begin
		if (rst) begin
			counter_q <= 25'b0;
		end else begin
			counter_q <= counter_d; // Flipflop behaviour
		end
	end
endmodule
