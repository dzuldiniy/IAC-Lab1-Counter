module counter #(
    parameter WIDTH = 8
) (
    input   logic               clk, // clock
    input   logic               rst, // reset
    input   logic               en, // counter enable
    output  logic [WIDTH-1:0]   count // count output
);

always_ff @( posedge clk, posedge rst)
    if (rst)    count <= {WIDTH{1'b0}};
    else begin
        if (en) count <= count + {{WIDTH-1{1'b0}}, 1'b1};
        else count <= count - {{WIDTH-1{1'b0}}, 1'b1};
    end
    
endmodule
