# FPGA-verilog

### In this repository, I want to present tasks that I have made in the  "Reconfigurable Systems" course in the Automation and Robotics field, at the AGH University of Science and Technology. I learn the basics of FPGA programming on the Zybo board from Digilent company by using Verilog language and Vivado environment.  
Every folder contains just files with code (modules and testbanches). Below are short descriptions of every folder. 

---

- [Cascade_AND](https://github.com/patryklatka/FPGA-verilog/tree/main/Cascade_AND) AND gate with a parameterisable number of inputs
- [Delay_line](https://github.com/patryklatka/FPGA-verilog/tree/main/Delay_line)  Serially connected registers that implement the delay line. The user can select the width of the input and output ports and the length of the delay. 
- [State_machine](https://github.com/patryklatka/FPGA-verilog/tree/main/State_machine) A simplified version of the UART. Input data is serialised and sent. In addition, there is a Matlab file in this folder for testing the circuit. This code is written for a 16-letter phrase, such as "alamakotaidwapsy"