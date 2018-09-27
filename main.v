module main(input start,input reset,input clk,input [63:0] a,input [63:0] b,output reg [255:0] out,output reg ready);
reg [1:0]state ;
reg [63:0]m1;
reg [63:0]m2;
always @(posedge clk,negedge reset)
begin 
    if(reset==0)
    begin
        state<=0;
        ready<=1;
        out<=0;
    end
    else
    if(ready==1&&start==1)
    begin
        m1<=a ;
        m2<=b ;
        ready<=0 ;
        state<=1 ;
        out<=1 ;
    end
    else
    if(state==1)
    begin
        if(m2==0)
        begin
            state<=0 ;
            ready<=1 ;
        end    
        else
        begin
            if(m2[0]==1)
                out<=out*m1 ;
            m2<=m2>>1 ;
            m1<=m1*m1 ;
        end
    end
end
endmodule
