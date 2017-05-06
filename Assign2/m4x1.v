// Ali Iqbal 
// m4x1.v
//
// how to compile: ~changw/ivl/bin/iverilog decoder1x2.v
// how to run: ./a.out

module MuxMod(s, d, o); // module definition
   input [1:0] s; 
   input [3:0] d;
   output o;

   wire [1:0] s_inv; 
   wire [3:0] and_out;

   not(s_inv[1], s[1]);
   not(s_inv[0], s[0]);
   and(and_out[0], d[0], s_inv[0], s_inv[1]);
   and(and_out[1], d[1], s[0], s_inv[1]);
   and(and_out[2], d[2], s_inv[0], s[1]);
   and(and_out[3], d[3], s[0], s[1]);
   or(o, and_out[0], and_out[1], and_out[2], and_out[3]);

endmodule

module TestMod; 
   reg [1:0] s; 
   reg [3:0] d;       
   wire o;                          

   MuxMod my_mux(s, d, o); // create instance

   initial begin
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, s[1], s[0], d[0], d[1], d[2], d[3], o);
      $display("Time\ts1\ts0\td0\td1\td2\td3\to");
      $display("---------------------------------------------------------");
   end

   initial begin
      s[1] = 0; s[0] = 0; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 0; // initially 000000
      #1;											  // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 1; // initially 000001
      #1;											  // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 0; // initially 000010
      #1;											  // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 1; // initially 000011
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 0; // initially 000100
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 1; // initially 000101
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 0; // initially 000110
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 1; // initially 000111
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 0; // initially 001000
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 1; // initially 001001
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 0; // initially 001010
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 1; // initially 001011
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 0; // initially 001100
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 1; // initially 001101
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 0; // initially 001110
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 0; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 1; // initially 001111
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 0; // initially 010000
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 1; // initially 010001
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 0; // initially 010010
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 1; // initially 010011
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 0; // initially 010100
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 1; // initially 010101
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 0; // initially 010110
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 1; // initially 010111
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 0; // initially 011000
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 1; // initially 011001
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 0; // initially 011010
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 1; // initially 011011
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 0; // initially 011100
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 1; // initially 011101
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 0; // initially 011110
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 0; s[0] = 1; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 1; // initially 011111
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 0; // initially 100000
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 1; // initially 100001
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 0; // initially 100010
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 1; // initially 100011
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 0; // initially 100100
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 1; // initially 100101
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 0; // initially 100110
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 1; // initially 100111
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 0; // initially 101000
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 1; // initially 101001
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 0; // initially 101010
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 1; // initially 101011
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 0; // initially 101100
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 1; // initially 101101
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 0; // initially 101110
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 0; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 1; // initially 101111
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 0; // initially 110000
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 0; d[1] = 0; d[2] = 0; d[3] = 1; // initially 110001
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 0; // initially 110010
      #1;                                             // wait 1 simulation time unit/cycle   
      s[1] = 1; s[0] = 1; d[0] = 0; d[1] = 0; d[2] = 1; d[3] = 1; // initially 110011
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 0; // initially 110100
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 0; d[1] = 1; d[2] = 0; d[3] = 1; // initially 110101
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 0; // initially 110110
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 0; d[1] = 1; d[2] = 1; d[3] = 1; // initially 110111
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 0; // initially 111000
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 1; d[1] = 0; d[2] = 0; d[3] = 1; // initially 111001
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 0; // initially 111010
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 1; d[1] = 0; d[2] = 1; d[3] = 1; // initially 111011
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 0; // initially 111100
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 1; d[1] = 1; d[2] = 0; d[3] = 1; // initially 111101
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 0; // initially 000001
      #1;                                             // wait 1 simulation time unit/cycle
      s[1] = 1; s[0] = 1; d[0] = 1; d[1] = 1; d[2] = 1; d[3] = 1; // initially 111111
      #1;                                             // wait 1 simulation time unit/cycle
   end
endmodule
