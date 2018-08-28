# Programmable_logic_design
This is repository for course ECEN 5863.

<h2>Project 1:</h2>
<h6>Project Members: Vikrant Waje,
                 Anay Gondhalekar</h6>
<h3>Evaluation of Altera MAX10 FPGA and creating a soft processor core</h3>
- Used various IP blocks of MAX10 FPGA such as ADC, JTAG, memory, Avalon bus interface and softcore processor
<br>- Created a NIOS 2 softcore processor from FPGA fabric by using the Qsys software. Assigned memory address so that it could load a simple program and display the output. The UART was used to send the data and text to terminal

<h2>Project 2:</h2>
<h6>Project Members: Vikrant Waje,
                 Chutao Wei</h6>
<h3>Evaluation of Microsemi Smartfusion FPGA</h3>
- Used the On chip Analog Compute engine of A2F200M3F FPGA Evaluation kit to convert the analog 
values of potentiometer into digital values which were displayed on Putty
<br>- Made a multi-functional system that could switch between various modes such as multimeter mode, 
web-server mode and LED test mode. The IP address would be displayed in webserver mode, voltage across potentiometer would be displayed on Putty in multimeter mode and LED's would blink in LED test mode
<br>- Timing analysis was done on various modules such as binary counter, 32 bit shift register. Clock 
domain crossing was taken care of and also false path were removed to improve the performance of 
the fitter. The timing analysis was done using Microsemi Libero development software

<h2>Project 3:</h2>
<h6>Project Members: Vikrant Waje,
                 Anay Gondhalekar</h6>
<h3>Evaluation of Altera DE-1 SOC and Xilinx Pynq Z1</h3>
-Designed Real time Clock to display time on on seven segment leds of Altera DE1-SOC. The design included modules such as clock divider, counters written in VHDL.
- Developed Morse code generator for DE-1 SOC using Quartus Prime FPGA development environment
- Evaluated the Pynq Z1 board by using the on board switches to blink various LED's on board using 
python on Jupyter Notebook online IDE
