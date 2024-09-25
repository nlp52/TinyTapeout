/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

//========================================================================
// PairTripleDetector_GL
//========================================================================

`ifndef PAIR_TRIPLE_DETECTOR_GL_V
`define PAIR_TRIPLE_DETECTOR_GL_V

module PairTripleDetector_GL
(
  input  wire in0,
  input  wire in1,
  input  wire in2,
  output wire out

);

  wire w;
  wire y;
  wire x; 
  or top_or (w, in0, in1);
  and middle_and (y, w, in2);
  and bottom_and (x, in0, in1);
  or last_or (out, y, x);


endmodule

`endif /* PAIR_TRIPLE_DETECTOR_GL_V */
