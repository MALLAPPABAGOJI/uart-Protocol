# UART Project (SystemVerilog)

This is a UART (Universal Asynchronous Receiver/Transmitter) implementation using SystemVerilog, supporting full-duplex communication with **even parity**. The design includes transmitter, receiver, baud rate generator, and a testbench, all simulated using EDAPlayground.

## Features
- 8-bit data transfer
- 1 start bit, 1 stop bit
- **Even parity** for error checking
- Baud rate control via counter
- Written and tested in SystemVerilog
- Simulated using EDAPlayground (Icarus Verilog + EPWave)

## Frame Format
| Start (1 bit) | Data (8 bits) | Parity (even) | Stop (1 bit) |


## How to Run
1. Go to [EDAPlayground](https://edaplayground.com/)
2. Paste the code files
3. Select **SystemVerilog**, **Icarus Verilog**
4. Run simulation and view waveforms in EPWave

UART output waveform :
![image](https://github.com/user-attachments/assets/82796c6b-5ada-4d03-ad57-1feb555c6bce)

