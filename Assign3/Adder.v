// Adder.v, 137 Verilog Programming Assignment #3
// Adding Number, 5 bits maximum
// Ali Iqbal
module TestMod;                     // the "main" thing
   parameter STDIN = 32'h8000_0000; // I/O address of keyboard input channel

   reg [7:0] str [1:3]; // typing in 2 chars at a time (decimal # and Enter key)
   reg [4:0] X, Y;      // 5-bit X, Y to sum
   wire [4:0] S;        // 5-bit Sum to see as result
   wire C5;             // like to know this as well from result of Adder

   //instantiate the big adder module (giving X and Y as input, getting S and C5 as output)
	BigAdder bigAdder(X, Y, S, C5);
	
   initial begin
      $display("Enter X (Two digits 00-15): ");
      str[1] = $fgetc(STDIN); // 1st 
      str[2] = $fgetc(STDIN); // 2nd 
      str[3] = $fgetc(STDIN); // enter key
      
	  //convert str to value for X:
       X = (str[1] - 48) * 10 + (str[2] - 48);  

      //do the above to get input and convert it to Y
	  $display("Enter Y (Two digits 00-15): ");
      str[1] = $fgetc(STDIN); // 1st 
      str[2] = $fgetc(STDIN); // 2nd
      str[3] = $fgetc(STDIN); // enter key 
	  
	  Y = (str[1] - 48) * 10 + (str[2] - 48);
	  
      #1; // wait until Adder gets them processed
      //$display X and Y (run demo to see display format)
      //and
      //$display S and C5 (run demo to see display format)
	  $display("X =%d (%b) Y =%d (%b)", X, X, Y, Y);
	  $display("Result =%d (%b) C5 =%b", S, S, C5);
   end
endmodule

module BigAdder(X, Y, S, C5);
   input [4:0] X, Y;   // two 5-bit input items
   output [4:0] S;     // S should be similar
   output C5;          // another output for a different size

   wire C1, C2, C3, C4;   // declare temporary wires

   FullAdderMod FA0(X[0], Y[0], 0, S[0], C1);
   FullAdderMod FA1(X[1], Y[1], C1, S[1], C2);
   FullAdderMod FA2(X[2], Y[2], C2, S[2], C3);
   FullAdderMod FA3(X[3], Y[3], C3, S[3], C4);
   FullAdderMod FA4(X[4], Y[4], C4, S[4], C5);
endmodule

module FullAdderMod(X, Y, Cin, S, Cout); // single-bit adder module
   input X, Y, Cin;
   output S, Cout;
   
   wire AND2, AND3, XOR0;

   and(AND2, X, Y);
   and(AND3, Cin, XOR0);
   xor(XOR0, X, Y);
   xor(S, XOR0, Cin); // S
   or(Cout, AND3, AND2); // cout
 
endmodule
