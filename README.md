# Pedalboard Soundcard

I²S audio codec HAT for Raspberry Pi — ADC + DAC for the [Open Pedalboard](https://github.com/pedalboard) system.

**[Documentation →](https://pedalboard.github.io/pedalboard-soundcard/latest/)**

![Top View](https://pedalboard.github.io/pedalboard-soundcard/latest/3D/pedalboard-soundcard-3D_blender_top.png)

## Features

- TI Burr-Brown PCM1863 ADC (106dB SNR) + PCM5242 DAC (112dB SNR)
- Stereo differential input (guitar) + stereo output (amp)
- I²S interface to Raspberry Pi GPIO header
- Low-latency audio path for real-time effects
- Raspberry Pi HAT form factor

## Links

- [Interactive schematic & PCB viewer](https://pedalboard.github.io/pedalboard-soundcard/latest/board/)
- [Digi-Key shared list](https://www.digikey.ch/de/mylists/list/OT2O5ZLS9K)

## Development Setup

### Prerequisites

- [KiCad](https://www.kicad.org/) 10+
- [KiKit](https://github.com/yaqwsx/KiKit) (panelization)
- [mise](https://mise.jdx.dev/) (environment management)

### Environment

The schematic references KiKit's symbol and footprint libraries via the `${KIKIT_LIB}` environment variable. This is set per-machine using a `mise.local.toml` file (gitignored).

After cloning, create `mise.local.toml` in the project root:

```toml
[env]
KIKIT_LIB = "/path/to/kikit/resources"
```

Find your KiKit resources path with:

```sh
python3 -c "import kikit, os; print(os.path.join(os.path.dirname(kikit.__file__), 'resources'))"
```

Then trust the config:

```sh
mise trust mise.local.toml
```

### Checks

Run ERC and DRC:

```sh
make test
```

## Acknowledgements

Based on Dave Vandenbout's [RPi Hat Template](https://github.com/devbisme/RPi_Hat_Template).
Schematics derived from Jośe Fernando Moyano's [ZynADC](https://github.com/zynthian/zynthian-hw/tree/master/ZynADAC) ([CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)).

## License

[![License](https://img.shields.io/badge/License-CERN--OHL--P--2.0-green)](LICENSE.txt)
