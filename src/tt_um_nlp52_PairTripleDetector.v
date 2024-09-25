/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

//========================================================================
// PairTripleDetector_GL
//========================================================================

`ifndef TT_UM_NLP52_PAIRTRIPLEDETECTOR_V
`define TT_UM_NLP52_PAIRTRIPLEDETECTOR_V

module tt_um_nlp52_PairTripleDetector #(parameter MAX_COUNT = 10_000_000)
(
  input  wire [7:0] ui_in,   //Dedicated inputs- connected to the input switches
  output  wire [7:0] uo_out, //Dedicated outputs- connected to the seven segment display
  input  wire [7:0] uio_in,   //IOs: Bidirectional Input Path
  output wire [7:0] uio_out,  //IOs: Bidirectional Output Path
  output wire [7:0] uio_oe,  //IOs: Bidirectional Enable Path (active high: 0=input, 1=output)
  input wire ena,            //goes high when design enabled
  input wire clk,            //clock
  input wire rst_n           //reset n- low to reset

);
  assign uo_out[7:1] = 7'b0;
  assign uio_out[7:0] = 8'b0;
  assign uio_oe[7:0] = 8'b0;

  wire w;
  wire y;
  wire x; 
  or top_or (w, ui_in[0], ui_in[1]);
  and middle_and (y, w, ui_in[2]);
  and bottom_and (x, ui_in[0], ui_in[1]);
  or last_or (uo_out[0], y, x);


endmodule

`endif /* PAIR_TRIPLE_DETECTOR_GL_V */
