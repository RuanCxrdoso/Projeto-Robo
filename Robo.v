module robo (clock, reset, head, left, avancar, girar);

	input clock, reset, head, left;
	output reg avancar, girar;
	
	reg [1:0] estado_atual, estado_futuro;

	parameter procurando_muro = 2'b00,
				 rotacionando = 2'b01,
				 acompanhando_muro = 2'b10;
	initial begin
		estado_atual <= procurando_muro;
	end
	
	always @(negedge clock, posedge reset) begin
		if (reset == 1'b1) begin
			case({head, left})
				2'b00: estado_atual = procurando_muro;
				2'b01: estado_atual = acompanhando_muro;
				2'b10: estado_atual = rotacionando;
				2'b11: estado_atual = rotacionando;
			endcase
		end
		
		else begin
			estado_atual = estado_futuro;
		end
	end

	always @(estado_atual, head, left) begin
		case (estado_atual)
			procurando_muro: begin
				if (head == 1'b0 && left == 1'b0) begin
					avancar = 1'b1;
					girar = 1'b0;
					estado_futuro = procurando_muro;
				end
				
				else if (head == 1'b0 && left == 1'b1) begin
					avancar = 1'b1;
					girar = 1'b0;
					estado_futuro = acompanhando_muro;
				end
				
				else if (head == 1'b1 && left == 1'b0) begin
					avancar = 1'b0;
					girar = 1'b1;
					estado_futuro = rotacionando;
				end
				
				else if (head == 1'b1 && left == 1'b1) begin
					avancar = 1'b0;
					girar = 1'b1;
					estado_futuro = rotacionando;
				end
			end
			
			rotacionando: begin
				if (head == 1'b0 && left == 1'b0) begin
					avancar = 1'b0;
					girar = 1'b1;
					estado_futuro = rotacionando;
				end
				
				else if (head == 1'b0 && left == 1'b1) begin
					avancar = 1'b1;
					girar = 1'b0;
					estado_futuro = acompanhando_muro;
				end
				
				else if (head == 1'b1 && left == 1'b0) begin
					avancar = 1'b0;
					girar = 1'b1;
					estado_futuro = rotacionando;
				end
				
				else if (head == 1'b1 && left == 1'b1) begin
					avancar = 1'b0;
					girar = 1'b1;
					estado_futuro = rotacionando;
				end
			end
	
			acompanhando_muro: begin
				if (head == 1'b0 && left == 1'b0) begin
					avancar = 1'b0;
					girar = 1'b1;
					estado_futuro = procurando_muro;
				end
				
				else if (head == 1'b0 && left == 1'b1) begin
					avancar = 1'b1;
					girar = 1'b0;
					estado_futuro = acompanhando_muro;
				end
				
				else if (head == 1'b1 && left == 1'b0) begin
					avancar = 1'b0;
					girar = 1'b1;
					estado_futuro = procurando_muro;
				end
				
				else if (head == 1'b1 && left == 1'b1) begin
					avancar = 1'b0;
					girar = 1'b1;
					estado_futuro = rotacionando;
				end
			end
		endcase
	end

endmodule
