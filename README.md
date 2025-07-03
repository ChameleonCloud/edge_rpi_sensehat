# CHI@Edge RPI sense hat image amd tutorial
Trovi Artifact outlining how to enable the usage of the official rpi sense hat through both the i2c, gpio, and framebuffer interfaces

## Required device boot options and device tree overlays
- dtoverlay=rpi-sense

## Required /dev devices to be included in the device profile
- /dev/i2c-0
- /dev/i2c-1
- /dev/gpiomem
- /dev/gpiochip0
- /dev/gpiochip1
- /dev/fb0
- /dev/input/event0
- /dev/input/event1
- /dev/input/event2

## Required dependencies to drive the sensors
- python3
- sense-hat (python)
- RTIMULib (python)
- libstdc++ (shared libraries)


## Dockerfile

The attached dockerfile uses a multistage build to minimize size and build-time

Build dependencies and sources are fetched in the builder stage, and used to generate python wheels with the necessary dependencies.

In the final image, these wheels are installed, and the minimal runtime dependencies included.

Comparison of sizes:
1. Initial, single-stage, debian-bullseye build: 1.14GB
1. Debian-bullseye, multistage build: 240MB
1. Alpine multistage build: 146MB
