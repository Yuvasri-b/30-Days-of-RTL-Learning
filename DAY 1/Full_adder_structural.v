
module FullAdderStructural(
    input a,b,cin,
    output sum,carry
    );
	 wire p,q,r;
xor1 x1(a,b,cin,sum);
and1 a1(a,b,p);
and1 a2(b,cin,q);
and1 a3(a,cin,r);
or1 o1(p,q,r,carry);

endmodule

module xor1(input a,b,cin,output s);
assign s= a^b^cin;
endmodule

module and1(input a,b,output z);
assign z= a&b;
endmodule

module or1(input a,b,cin,output carry);
assign carry= a|b|cin;
endmodule

module tb_fa_structural;

    reg a, b, cin;
    wire sum, carry;

    FullAdderStructural HA1 (.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));

    initial begin
        a = 0;b = 0;cin = 0;
        #100;
	a = 0;b = 0;cin = 1;
        #100;
        a = 0;b = 1;cin = 0;
        #100;
        a = 0;b = 1;cin = 1;
        #100;
        a = 1;b = 0;cin = 0;
        #100;
        a = 1;b = 0;cin = 1;
        #100;
        a = 1;b = 1;cin = 0;
        #100;
        a = 1;b = 1;cin = 1;
        #100;

     end  

endmodule