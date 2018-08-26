module SolarTracker(Clk,Reset,led0,led1,PWM);
input Clk;	//Clock signal
input Reset;	//Reset signal
input led0;		//Key 2
input led1;		//Key 1
output reg PWM;
reg[20:0] count1=20'd0;		//Dictates ON time
reg[20:0] count2=20'd0;		//Dictates OFF time
reg [20:0] counter1=20'd75000;
reg [20:0]counter2=20'd1000000;	//Corresponds to 20ms (Every 20ms a pulse needs to be applied)
reg detect1=0;
reg detect2=0;
always@(posedge(Clk) )
    begin
        if(Reset==0)
            begin
            counter1=20'd75000;
        end
        
        
            
            else if((led1==1) && detect1 ==0)    //increment
            begin
					count1=0;
					count2=0;
                if(counter1<20'd150000)        //180 degree. 2ms/20ns=100,000
                begin
                counter1=counter1 + 20'd450;        //1800 corresponds to 1 degree
                end
                else if(counter1==20'd150000)
                begin
                counter1=20'd150000;                //Settle to base position
                end

				detect1=1;
            end
           else if(led0==1 && detect2==0)            //Decrement
            begin
				count1=0;
					count2=0;
                if(counter1>20'd5000)    //0 degree
                begin
                counter1=counter1-20'd450;        // 1800 degree correspond to 1 degree
                end
                else if(counter1==20'd5000)
                begin
                counter1=20'd5000;
                end
				detect2=1;
            end

	if(count1<counter1)
    begin
    PWM=1;	//PWM should be high until ON time
    count1=count1+1;
    end
    else if(count1==counter1)
    begin
    PWM=0;	//PWM signal should be low when it hits OFF time 
    end
    if(PWM==0 && count2<(counter2-counter1)&& count1==counter1)
    begin
    PWM=0;
    count2=count2+1;
    end
	 else if(PWM ==0 && count2==(counter2-counter1) && count1==counter1)
	 begin
	 detect1=0;
	 detect2=0;
	 end
        
end


endmodule