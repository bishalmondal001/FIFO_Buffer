# FIFO Buffer

FIFO is an acronym for First In First Out, which describes how data is managed relative to time or priority. In this case, the first data that arrives will also be the first data to leave from a group of data. A FIFO Buffer is a read/write memory array that automatically keep track of the order in which data enters into the module and reads the data out in the same order. In hardware FIFO buffer is used for synchronization purposes. It is often implemented as a circular queue, and has two pointers:
- Read Pointer/Read Address Register
- Write Pointer/Write Address Register
Read and write addresses are initially both at the first memory location and the FIFO queue is Empty. When the difference between the read address and write address of the FIFO buffer is equal to the size of the memory array then the FIFO queue is Full.

FIFO can be classified as synchronous or asynchronous depending on whether same clock (synchronous) or different clocks (asynchronous) control the read and write operations.


### Verilog Module
Following figure presents the Verilog module of the FIFO Buffer. This FIFO Buffer can store eight 32-bit values. The FIFO Buffer module consists of a 32-bit data input line, dataIn and a 32-bit data output line, dataOut. The module is clocked using the 1-bit input clock line Clk. The module also has a 1-bit enable line, EN and a 1-bit active high reset line, Rst.

The 1-bit RD line is used to signal a data read operation on the FIFO Buffer and the 1-bit WR line is used to signal a data write operation on the FIFO Buffer. Both the RD and WR lines are active high. The module also has two output lines FULL and EMPTY which are each 1-bit wide. The FULL line becomes high when the FIFO Buffer is or becomes full (internal counter becomes eight). The EMPTY line becomes high when the FIFO Buffer is or becomes empty (internal counter becomes zero).


![image](https://github.com/bishalmondal001/FIFO_Buffer/assets/109130584/521a1938-bb2a-430b-8af5-c60751185cd8)
