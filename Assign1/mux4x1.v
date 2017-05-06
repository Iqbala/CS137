// Ali Iqbal 
// mux4x1.v, 4x1 multiplexor, gate synthesis
//
// how to compile: ~changw/ivl/bin/iverilog decoder1x2.v
// how to run: ./a.out

module MuxMod(s1, s0, d0, d1, d2, d3, o); // module definition
   input s1, s0, d0, d1, d2, d3;
   output o;

   wire s1_inv, s0_inv, and0, and1, and2, and3;

   not(s1_inv, s1);
   not(s0_inv, s0);
   and(and0, d0, s0_inv, s1_inv);
   and(and1, d1, s0, s1_inv);
   and(and2, d2, s0_inv, s1);
   and(and3, d3, s0, s1);
   or(o, and0, and1, and2, and3);

endmodule

module TestMod; 
   reg s1, s0, d0, d1, d2, d3;       
   wire o;                          

   MuxMod my_mux(s1, s0, d0, d1, d2, d3, o); // create instance

   initial begin
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, s1, s0, d0, d1, d2, d3, o);
      $display("Time\ts1\ts0\td0\td1\td1\td1\to");
      $display("-----------------------------------------------------------------");
   end

   initial begin
      s1 = 0; s0 = 0; d0 = 0; d1 = 0; d2 = 0; d3 = 0; // initially 000000
      #1;											  // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 0; d1 = 0; d2 = 0; d3 = 1; // initially 000001
      #1;											  // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 0; d1 = 0; d2 = 1; d3 = 0; // initially 000010
      #1;											  // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 0; d1 = 0; d2 = 1; d3 = 1; // initially 000011
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 0; d1 = 1; d2 = 0; d3 = 0; // initially 000100
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 0; d1 = 1; d2 = 0; d3 = 1; // initially 000101
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 0; d1 = 1; d2 = 1; d3 = 0; // initially 000110
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 0; d1 = 1; d2 = 1; d3 = 1; // initially 000111
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 1; d1 = 0; d2 = 0; d3 = 0; // initially 001000
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 1; d1 = 0; d2 = 0; d3 = 1; // initially 001001
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 1; d1 = 0; d2 = 1; d3 = 0; // initially 001010
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 1; d1 = 0; d2 = 1; d3 = 1; // initially 001011
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 1; d1 = 1; d2 = 0; d3 = 0; // initially 001100
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 1; d1 = 1; d2 = 0; d3 = 1; // initially 001101
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 1; d1 = 1; d2 = 1; d3 = 0; // initially 001110
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 0; d0 = 1; d1 = 1; d2 = 1; d3 = 1; // initially 001111
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 0; d1 = 0; d2 = 0; d3 = 0; // initially 010000
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 0; d1 = 0; d2 = 0; d3 = 1; // initially 010001
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 0; d1 = 0; d2 = 1; d3 = 0; // initially 010010
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 0; d1 = 0; d2 = 1; d3 = 1; // initially 010011
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 0; d1 = 1; d2 = 0; d3 = 0; // initially 010100
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 0; d1 = 1; d2 = 0; d3 = 1; // initially 010101
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 0; d1 = 1; d2 = 1; d3 = 0; // initially 010110
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 0; d1 = 1; d2 = 1; d3 = 1; // initially 010111
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 1; d1 = 0; d2 = 0; d3 = 0; // initially 011000
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 1; d1 = 0; d2 = 0; d3 = 1; // initially 011001
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 1; d1 = 0; d2 = 1; d3 = 0; // initially 011010
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 1; d1 = 0; d2 = 1; d3 = 1; // initially 011011
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 1; d1 = 1; d2 = 0; d3 = 0; // initially 011100
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 1; d1 = 1; d2 = 0; d3 = 1; // initially 011101
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 1; d1 = 1; d2 = 1; d3 = 0; // initially 011110
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 0; s0 = 1; d0 = 1; d1 = 1; d2 = 1; d3 = 1; // initially 011111
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 0; d1 = 0; d2 = 0; d3 = 0; // initially 100000
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 0; d1 = 0; d2 = 0; d3 = 1; // initially 100001
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 0; d1 = 0; d2 = 1; d3 = 0; // initially 100010
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 0; d1 = 0; d2 = 1; d3 = 1; // initially 100011
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 0; d1 = 1; d2 = 0; d3 = 0; // initially 100100
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 0; d1 = 1; d2 = 0; d3 = 1; // initially 100101
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 0; d1 = 1; d2 = 1; d3 = 0; // initially 100110
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 0; d1 = 1; d2 = 1; d3 = 1; // initially 100111
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 1; d1 = 0; d2 = 0; d3 = 0; // initially 101000
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 1; d1 = 0; d2 = 0; d3 = 1; // initially 101001
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 1; d1 = 0; d2 = 1; d3 = 0; // initially 101010
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 1; d1 = 0; d2 = 1; d3 = 1; // initially 101011
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 1; d1 = 1; d2 = 0; d3 = 0; // initially 101100
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 1; d1 = 1; d2 = 0; d3 = 1; // initially 101101
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 1; d1 = 1; d2 = 1; d3 = 0; // initially 101110
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 0; d0 = 1; d1 = 1; d2 = 1; d3 = 1; // initially 101111
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 0; d1 = 0; d2 = 0; d3 = 0; // initially 110000
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 0; d1 = 0; d2 = 0; d3 = 1; // initially 110001
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 0; d1 = 0; d2 = 1; d3 = 0; // initially 110010
      #1;                                             // wait 1 simulation time unit/cycle   
      s1 = 1; s0 = 1; d0 = 0; d1 = 0; d2 = 1; d3 = 1; // initially 110011
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 0; d1 = 1; d2 = 0; d3 = 0; // initially 110100
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 0; d1 = 1; d2 = 0; d3 = 1; // initially 110101
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 0; d1 = 1; d2 = 1; d3 = 0; // initially 110110
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 0; d1 = 1; d2 = 1; d3 = 1; // initially 110111
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 1; d1 = 0; d2 = 0; d3 = 0; // initially 111000
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 1; d1 = 0; d2 = 0; d3 = 1; // initially 111001
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 1; d1 = 0; d2 = 1; d3 = 0; // initially 111010
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 1; d1 = 0; d2 = 1; d3 = 1; // initially 111011
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 1; d1 = 1; d2 = 0; d3 = 0; // initially 111100
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 1; d1 = 1; d2 = 0; d3 = 1; // initially 111101
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 1; d1 = 1; d2 = 1; d3 = 0; // initially 000001
      #1;                                             // wait 1 simulation time unit/cycle
      s1 = 1; s0 = 1; d0 = 1; d1 = 1; d2 = 1; d3 = 1; // initially 111111
      #1;                                             // wait 1 simulation time unit/cycle
   end
endmodule
