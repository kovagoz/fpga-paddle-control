# Pong paddle control with external analog circuit

In this example a single paddle appears on the screen which can be controlled
by a potmeter, part of an external circuit built on a 555 timer IC.

The circuit implements a monostable multivibrator where the width of the pulse
can be adjusted by the potmeter. The timer is started by the VSYNC pulse exposed
by the FPGA board. The generated pulse is fed back to the FPGA and it's
negative edge triggers the drawing of the paddle. The shorter the pulse, the
sooner it starts drawing the paddle on the screen (closer to the top edge).

And here is the circuit:

![foo](https://res.cloudinary.com/kovagoz/image/upload/v1649576345/github/paddle_control.png)

To build the project and send bitstream to the FPGA board just type:

```sh
make && make install
```
