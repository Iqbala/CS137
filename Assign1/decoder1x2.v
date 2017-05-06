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

module DecoderMod(s1, s0, o0, o1, o2, o3); // module definition
   input s1, s0;
   output o0, o1, o2, o3;

   wire t1, t2; //aditional needed wires

   not(t1, s1);
   not(t2, s0);
   and(o0, t1, t2);  //0 0
   and(o1, t1, s0);  // 0 1
   and(o2, s1, t2);  // 1 0
   and(o3, s1, s0);  // 1 1
   
endmodule

module TestMod;  // or call it main, it tests DecoderMod
   reg s1, s0;
   wire o0, o1, o2, o3; // 4 additional wires      

   DecoderMod my_decoder(s1, s0, o0, o1, o2, o3); // create instance

   initial begin
      $monitor("%0d\t%b\t%b\t%b\t%b\t%b\t%b", $time, s1, s0, o0, o1, o2, o3);
      $display("Time\ts1\ts2\to0\to1\to2\to3");
      $display("--------------------------------------------------");
   end

   initial begin
      s1 = 0; s0= 0;          // initially 00
      #1;					  // wait 1 simulation time unit/cycle
      s1 = 0; s0= 1;          // initially 01
      #1;					  // wait 1 simulation time unit/cycle
      s1 = 1; s0= 0;          // initially 10
      #1;					  // wait 1 simulation time unit/cycle
      s1 = 1; s0= 1;          // initially 11
      #1;					  // wait 1 simulation time unit/cycle
   end
endmodule
