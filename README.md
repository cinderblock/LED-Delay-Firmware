# Assembly for LED Delay board

This is the software for an ATtiny10 based Async LED Delay generator

## WS2811 API

Basic sequence is:

...

## Hardware Description

The board is designed to be as minimal as possible.

Using internal 8MHz clock.

### Programming

Use 5-pin TPI interface (6-pin pogo connector)

### Pins

| Name | Hardware | PCB connection |
| ---- | -------- | -------------- |
| PB0  |          |                |
| PB1  |          |                |
| PB2  |          |                |
| PB3  |          |                |

#### AVR Reference

| Name | Function | Hardware Features                            |
| ---- | -------- | -------------------------------------------- |
| PB0  | TPI Data | (PCINT0/TPIDATA/**OC0A**/ADC0/AIN0)          |
| PB1  | TPI Clk  | (**PCINT1**/TPICLK/CLKI/ICP0/OC0B/ADC1/AIN1) |
| PB2  |          | (T0/CLKO/PCINT2/**INT0**/ADC2)               |
| PB3  | Reset    | (RESET/PCINT3/**ADC3**)                      |

### Hardware Allocation

- PCINT0
  - Tac
