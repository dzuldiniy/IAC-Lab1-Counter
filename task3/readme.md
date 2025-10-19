# Task 3: Vbuddy Parameter & Flag in One-Shot Mode

## Loadable Counter

The testbench needs to be adjusted to work with the _counter.sv_ file provided by the Lab 1 document. Obviously, Vbuddy needs to be initialized in the testbench using `vbdSetMode(1)`. Then, we need to have the tesbench file read the encoder and flag values:

```cpp
top->ld = vbdFlag(); //set ld to flag value
top->v = vbdValue(); //assign rotary encoder value
```

Vbuddy is now able to change the counter value to current encoder value.

## Single Stepping

In the _counter.sv_ file, this modification needs to be made.

```verilog
always_ff @ (posedge clk)
  if (rst) count <= {WIDTH{1'b0}};
  else     count <= ld ? count + {{WIDTH-1{1'b0}},1'b1} : count;
```