/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

//========================================================================
// PairTripleDetector_GL
//========================================================================

`ifndef PAIR_TRIPLE_DETECTOR_GL_V
`define PAIR_TRIPLE_DETECTOR_GL_V

module PairTripleDetector_GL #(parameter MAX_COUNT = 10_000_000)
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

  wire w;
  wire y;
  wire x; 
  or top_or (w, ui_in[0], ui_in[1]);
  and middle_and (y, w, ui_in[2]);
  and bottom_and (x, ui_in[0], ui_in[1]);
  or last_or (uo_out[0], y, x);


endmodule

`endif /* PAIR_TRIPLE_DETECTOR_GL_V */
