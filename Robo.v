module robo (clock, reset, head, left, avancar, girar);

	input clock, reset, head, left;
	output reg avancar, girar;
	
	//Registrador de estado
	reg [1:0] estado;

	// Constantes
	parameter procurando_muro = 2'b00,
				 rotacionando = 2'b01,
				 acompanhando_muro = 2'b10;
	initial begin
		estado <= procurando_muro;
	end
	
	// Primeiro procedimento - DPE
	always @(negedge clock, posedge reset) begin
		if (reset == 1'b1) estado <= procurando_muro;
		
		else begin
			case (estado)
				procurando_muro: begin
					if (head == 1'b0 && left == 1'b0) estado <= procurando_muro;
					else if (head == 1'b0 && left == 1'b1) estado <= acompanhando_muro;
					else if (head == 1'b1 && left == 1'b0) estado <= rotacionando;
					else if (head == 1'b1 && left == 1'b1) estado <= rotacionando;
				end
				
				rotacionando: begin
					if (head == 1'b0 && left == 1'b0) estado <= rotacionando;
					else if (head == 1'b0 && left == 1'b1) estado <= acompanhando_muro;
					else if (head == 1'b1 && left == 1'b0) estado <= rotacionando;
					else if (head == 1'b1 && left == 1'b1) estado <= rotacionando;
				end
		
				acompanhando_muro: begin
					if (head == 1'b0 && left == 1'b0) estado <= procurando_muro;
					else if (head == 1'b0 && left == 1'b1) estado <= acompanhando_muro;
					else if (head == 1'b1 && left == 1'b0) estado <= procurando_muro;
					else if (head == 1'b1 && left == 1'b1) estado <= rotacionando;
				end
			endcase
		end
	end
	
	// Segundo procedimento - Saídas
	always @(estado, head, left) begin
		case (estado)
			procurando_muro: begin
				if (head == 1'b0 && left == 1'b0) begin // 0 0 / 1 0
					avancar = 1'b1;
					girar = 1'b0;
				end
				
				else if (head == 1'b0 && left == 1'b1) begin // 0 1 / 1 0
					avancar = 1'b1;
					girar = 1'b0;
				end
				
				else if (head == 1'b1 && left == 1'b0) begin // 1 0 / 0 1
					avancar = 1'b0;
					girar = 1'b1;
				end
				
				else if (head == 1'b1 && left == 1'b1) begin // 1 1 / 0 1
					avancar = 1'b0;
					girar = 1'b1;
				end
			end
			
			rotacionando: begin
				if (head == 1'b0 && left == 1'b0) begin // 0 0 / 0 1
					avancar = 1'b0;
					girar = 1'b1;
				end
				
				else if (head == 1'b0 && left == 1'b1) begin // 0 1 / 1 0
					avancar = 1'b1;
					girar = 1'b0;
				end
				
				else if (head == 1'b1 && left == 1'b0) begin // 1 0 / 0 1
					avancar = 1'b0;
					girar = 1'b1;
				end
				
				else if (head == 1'b1 && left == 1'b1) begin // 1 1 / 0 1
					avancar = 1'b0;
					girar = 1'b1;
				end
			end
	
			acompanhando_muro: begin
				if (head == 1'b0 && left == 1'b0) begin // 0 0 / 0 1
					avancar = 1'b0;
					girar = 1'b1;
				end
				
				else if (head == 1'b0 && left == 1'b1) begin // 0 1 / 1 0
					avancar = 1'b1;
					girar = 1'b0;
				end
				
				else if (head == 1'b1 && left == 1'b0) begin // 1 0 / 0 1
					avancar = 1'b0;
					girar = 1'b1;
				end
				
				else if (head == 1'b1 && left == 1'b1) begin // 1 1 / 0 1
					avancar = 1'b0;
					girar = 1'b1;
				end
			end
		endcase
	end

endmodule
