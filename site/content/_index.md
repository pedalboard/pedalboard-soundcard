---
title: Overview
weight: 10
---

![PCB 3D Render](3D/pedalboard-soundcard-3D_blender_top.png)

I²S audio codec HAT for Raspberry Pi, designed for real-time guitar effects
processing in the [Open Pedalboard](https://github.com/pedalboard) system.

## Audio Specs

| | ADC (PCM1863) | DAC (PCM5242) |
|---|---|---|
| Resolution | 24-bit | 32-bit |
| Sample rate | up to 192 kHz | up to 384 kHz |
| SNR | 106 dB | 112 dB |
| THD+N | -93 dB | -93 dB |

## Features

- Stereo differential ADC input (guitar) + stereo DAC output (amp)
- TI Burr-Brown PCM1863 (ADC) and PCM5242 (DAC)
- I²S interface to Raspberry Pi GPIO header
- Low-latency audio path for real-time effects
- Raspberry Pi HAT form factor
- Dedicated low-noise LDO regulators for analog supply

