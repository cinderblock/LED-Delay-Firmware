#pragma once

#include <avr/io.h>

namespace LEDDelay {

namespace IO {

namespace W1 {

constexpr bool UsePullUp = false;
constexpr auto pinMask = 1 << PB2;

inline bool Read() { return PINB & pinMask; }

inline void Low() {
  if (UsePullUp)
    PORTB &= ~pinMask;

  DDRB |= pinMask;
}

inline void Release() {
  DDRB &= ~pinMask;

  if (UsePullUp)
    PORTB |= pinMask;
}

} // namespace W1

static constexpr bool TacPullUp = true;
static constexpr bool PWMOutDefault = true;

/**
 * Setup IO hardware of device
 */
inline void setup() {
  // Disable digital input on ADC and output pins
  DIDR0 = 0b1001;
  // Default PWM out to high,
  PORTB = (PWMOutDefault << PB0) | (TacPullUp << PB1) | (W1::UsePullUp << PB2);
  // Enable PWM out pin
  DDRB = 0b0001;
}

} // namespace IO

} // namespace LEDDelay
