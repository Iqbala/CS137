// Addsub.v, 137 Verilog Programming Assignment #4
// Adder/Subtractor
// Ali Iqbal
module TestMod;			// main
	parameter STDIN = 32'h8000_0000; // I/O of the keyboard input
	
   reg [7:0] str [1:3]; // typing in 2 chars at a time (decimal # and Enter key)
   reg [4:0] X, Y;      // 5-bit X, Y to sum
   wire [4:0] S;        // 5-bit Sum to see as result
   wire C5;             // like to know this as well from result of Adder
   reg C0;
   wire E;
	
	
	BigAdder bigAdder(X, Y, C0, S, C5, E);
	
	initial begin
	  $display("Enter X (range 00-15): ");
      str[1] = $fgetc(STDIN); // 1st 
      str[2] = $fgetc(STDIN); // 2nd 
      str[3] = $fgetc(STDIN); // input
	  
	  // convert str to value for X:
      X = (str[1] - 48) * 10 + (str[2] - 48);
	  
	  //do the above to get input and convert it to Y
      $display("Enter Y (range 00-15): ");
      str[1] = $fgetc(STDIN); // 1st 
      str[2] = $fgetc(STDIN); // 2nd
      str[3] = $fgetc(STDIN); // input
	  
	  // convert str to value for Y:
      Y = (str[1] - 48) * 10 + (str[2] - 48);
	  
	  $display("Enter either ( + or - ): ");
      if ($fgetc(STDIN) == "+") 
         C0 = 0;
      else
         C0 = 1;
	  
	  #1; // wait until Adder gets them processed
      // $display X and Y (run demo to see display format)
      $display("X =%d (%b) Y =%d (%b)", X, X, Y, Y);
      // and
      // $display S and C5 (run demo to see display format)
      $display("Result =%d (%b) C5 =%b E =%b", S, S, C5, E);
	  
	end
endmodule

module BigAdder(X, Y, C0, S, C5, E);
   input [4:0] X, Y;   // 5-bit, 2 input
   input C0;
   output [4:0] S;     
   output C5;          // Different output size
   output E;           // For error
   
   wire C1, C2, C3, C4;         // Temp wires
   wire XORY0, XORY1, XORY2, XORY3, XORY4;
   
   xor(XORY0, Y[0], C0);
   xor(XORY1, Y[1], C0);
   xor(XORY2, Y[2], C0);
   xor(XORY3, Y[3], C0);
   xor(XORY4, Y[4], C0);
   
   FullAdderMod FA0(X[0], XORY0, C0, S[0], C1);
   FullAdderMod FA1(X[1], XORY1, C1, S[1], C2);
   FullAdderMod FA2(X[2], XORY2, C2, S[2], C3);
   FullAdderMod FA3(X[3], XORY3, C3, S[3], C4);
   FullAdderMod FA4(X[4], XORY4, C4, S[4], C5);
   
   xor(E, C5, C4);
  endmodule
  
  module FullAdderMod(X, Y, Cin, S, Cout); // single-bit adder module
	input X, Y, Cin;
    output S, Cout;
	
	wire AND0, AND1, XOR0;
	
	and(AND0, X, Y);
    and(AND1, Cin, XOR0);
    xor(XOR0, X, Y);
	
	xor(S, XOR0, Cin); 
    or(Cout, AND1, AND0); 
	
endmodule
