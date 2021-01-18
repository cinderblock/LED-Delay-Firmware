
#include "main.hpp"
#include "IO.hpp"
#include <avr/interrupt.h>
#include <basicTypes.hpp>
#include <util/crc16.h>
#include <util/delay.h>

using namespace LEDDelay;
using namespace Basic;

/**
 * Setup hardware of device
 */
void setup() {
  IO::setup();

  // Enable interrupts globally
  sei();
}

int main() { setup(); }
