// Ali Iqbal 
// decoder2x4.v, 2x4 decoder, gate synthesis
//
// how to compile: ~changw/ivl/bin/iverilog decoder1x2.v
// how to run: ./a.out

/*
   old-style comments starts with "slash-star"
   why didn't I do this: x=y*z;
   all comments until "star-slash"
*/

module DecoderMod(s, o); // module definition
   input [0:1] s;
   output [3:0] o;

   wire [2:0] t; //aditional needed wires

   not(t[1], s[1]);
   not(t[2], s[0]);
   and(o[0], t[1], t[2]);  // 0 0
   and(o[1], t[1], s[0]);  // 0 1
   and(o[2], s[1], t[2]);  // 1 0
   and(o[3], s[1], s[0]);  // 1 1
   
endmodule

module TestMod;  // or call it main, it tests DecoderMod
   reg [0:1] s;
   wire [3:0] o; // 4 additional wires      

   DecoderMod my_decoder(s, o); // create instance

   initial begin
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b", $time, s[1], s[0], o[0], o[1], o[2], o[3]);
      $display("Time\ts1\ts2\to0\to1\to2\to3");
      $display("-----------------------------------------");
   end

   initial begin
      s[1] = 0; s[0]= 0;          // initially 00
      #1;					  // wait 1 simulation time unit/cycle
      s[1] = 0; s[0]= 1;          // initially 01
      #1;					  // wait 1 simulation time unit/cycle
      s[1] = 1; s[0]= 0;          // initially 10
      #1;					  // wait 1 simulation time unit/cycle
      s[1] = 1; s[0]= 1;          // initially 11
      #1;					  // wait 1 simulation time unit/cycle
   end
endmodule
