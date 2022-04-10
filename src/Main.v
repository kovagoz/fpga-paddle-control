`include "Vga.v"
`include "Paddle.v"

module Main(
  input  i_Clk,

  input  io_PMOD_1,
  output io_PMOD_2,

  output o_VGA_HSync,
  output o_VGA_VSync,

  output o_VGA_Red_0,
  output o_VGA_Red_1,
  output o_VGA_Red_2,

  output o_VGA_Grn_0,
  output o_VGA_Grn_1,
  output o_VGA_Grn_2,

  output o_VGA_Blu_0,
  output o_VGA_Blu_1,
  output o_VGA_Blu_2);

  wire w_Video;
  wire w_HReset;
  wire w_VReset;
  wire w_PaddleVideo;

  Paddle left(
    .i_Clk(i_Clk),
    .i_VSync(o_VGA_VSync),
    .i_HReset(w_HReset),
    .i_VReset(w_VReset),
    .i_555_Output(io_PMOD_1),
    .o_555_Trigger(io_PMOD_2),
    .o_Video(w_PaddleVideo)
  );

  Vga vga(
    .i_Clk(i_Clk),
    .i_Video(w_PaddleVideo),
    .o_HSync(o_VGA_HSync),
    .o_VSync(o_VGA_VSync),
    .o_HReset(w_HReset),
    .o_VReset(w_VReset),
    .o_Video(w_Video)
  );

  // Send 1-bit video signal to all VGA outputs => B/W image.

  assign o_VGA_Red_0 = w_Video;
  assign o_VGA_Red_1 = w_Video;
  assign o_VGA_Red_2 = w_Video;

  assign o_VGA_Grn_0 = w_Video;
  assign o_VGA_Grn_1 = w_Video;
  assign o_VGA_Grn_2 = w_Video;

  assign o_VGA_Blu_0 = w_Video;
  assign o_VGA_Blu_1 = w_Video;
  assign o_VGA_Blu_2 = w_Video;

endmodule
