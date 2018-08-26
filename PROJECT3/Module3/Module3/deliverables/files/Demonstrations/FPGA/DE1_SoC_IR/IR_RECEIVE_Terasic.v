// --------------------------------------------------------------------
// Copyright (c) 2010 by Terasic Technologies(China)Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies(China)Inc
//                     
//                     Wuhan, China
//                     
//
//                     web: http://www.terasic.com.cn/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	IRDA receiver
//
//                  it can realize a IRDA receiver,show the user code(16 bit) on HEX4-HEX7
//                  and key value on HEX0-HEX3  7-SEGS.the user code is fixed for some 
//                  remote control and the key value is not the same for different key
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date   :| Changes Made:
//   V1.0 :| Peli  Li          :| 2010/03/22  :| Initial Revision
//   V1.1 :| Allen Wang        :| 06/06/2010  :| Change IRDA with IR
//   v1.2 :| johnny            :| 06/18/2010  :| delete the iREAD port
// --------------------------------------------------------------------

module IR_RECEIVE(
					iCLK,         //clk 50MHz
					iRST_n,       //reset					
					iIRDA,        //IR code input
					oDATA_READY,  //data ready
					oDATA         //decode data output
					);


//=======================================================
//  PARAMETER declarations
//=======================================================
parameter IDLE               = 2'b00;    //always high voltage level
parameter GUIDANCE           = 2'b01;    //9ms low voltage and 4.5 ms high voltage
parameter DATAREAD           = 2'b10;    //0.6ms low voltage start and with 0.52ms high voltage is 0,with 1.66ms high voltage is 1, 32bit in sum.

parameter IDLE_HIGH_DUR      =  262143;  // data_count    262143*0.02us = 5.24ms, threshold for DATAREAD-----> IDLE
parameter GUIDE_LOW_DUR      =  230000;  // idle_count    230000*0.02us = 4.60ms, threshold for IDLE--------->GUIDANCE
parameter GUIDE_HIGH_DUR     =  210000;  // state_count   210000*0.02us = 4.20ms, 4.5-4.2 = 0.3ms < BIT_AVAILABLE_DUR = 0.4ms,threshold for GUIDANCE------->DATAREAD
parameter DATA_HIGH_DUR      =  41500;	 // data_count    41500 *0.02us = 0.83ms, sample time from the posedge of iIRDA
parameter BIT_AVAILABLE_DUR  =  20000;   // data_count    20000 *0.02us = 0.4ms,  the sample bit pointer,can inhibit the interference from iIRDA signal


//=======================================================
//  PORT declarations
//=======================================================
input         iCLK;        //input clk,50MHz
input         iRST_n;      //rst
input         iIRDA;       //Irda RX output decoded data
output        oDATA_READY; //data ready
output [31:0] oDATA;       //output data,32bit 


//=======================================================
//  Signal Declarations
//=======================================================
reg    [31:0] oDATA;                 //data output reg
reg    [17:0] idle_count;            //idle_count counter works under data_read state
reg           idle_count_flag;       //idle_count conter flag
//wire          idle_count_max;
reg    [17:0] state_count;           //state_count counter works under guide state
reg           state_count_flag;      //state_count conter flag
reg    [17:0] data_count;            //data_count counter works under data_read state
reg           data_count_flag;       //data_count conter flag
reg     [5:0] bitcount;              //sample bit pointer
reg     [1:0] state;                 //state reg
reg    [31:0] data;                  //data reg
reg    [31:0] data_buf;              //data buf
reg           data_ready;            //data ready flag


//=======================================================
//  Structural coding
//=======================================================	
assign oDATA_READY = data_ready;


//idle counter works on iclk under IDLE state only
always @(posedge iCLK or negedge iRST_n)	
	  if (!iRST_n)
		   idle_count <= 0;
	  else if (idle_count_flag)    //the counter works when the flag is 1
			 idle_count <= idle_count + 1'b1;
		else  
			 idle_count <= 0;	         //the counter resets when the flag is 0		      		 	

//idle counter switch when iIRDA is low under IDLE state
always @(posedge iCLK or negedge iRST_n)	
	  if (!iRST_n)
		   idle_count_flag <= 1'b0;
	  else if ((state == IDLE) && !iIRDA)
			 idle_count_flag <= 1'b1;
		else                           
			 idle_count_flag <= 1'b0;		     		 	
      
//state counter works on iclk under GUIDE state only
always @(posedge iCLK or negedge iRST_n)	
	  if (!iRST_n)
		   state_count <= 0;
	  else if (state_count_flag)    //the counter works when the flag is 1
			 state_count <= state_count + 1'b1;
		else  
			 state_count <= 0;	        //the counter resets when the flag is 0		      		 	

//state counter switch when iIRDA is high under GUIDE state
always @(posedge iCLK or negedge iRST_n)	
	  if (!iRST_n)
		   state_count_flag <= 1'b0;
	  else if ((state == GUIDANCE) && iIRDA)
			 state_count_flag <= 1'b1;
		else  
			 state_count_flag <= 1'b0;     		 	

//data read decode counter based on iCLK
always @(posedge iCLK or negedge iRST_n)	
	  if (!iRST_n)
		   data_count <= 1'b0;
	  else if(data_count_flag)      //the counter works when the flag is 1
			 data_count <= data_count + 1'b1;
		else 
			 data_count <= 1'b0;        //the counter resets when the flag is 0

//data counter switch
always @(posedge iCLK or negedge iRST_n)
	  if (!iRST_n) 
		   data_count_flag <= 0;	
	  else if ((state == DATAREAD) && iIRDA)
			 data_count_flag <= 1'b1;  
		else
			 data_count_flag <= 1'b0; 

//data reg pointer counter 
always @(posedge iCLK or negedge iRST_n)
    if (!iRST_n)
       bitcount <= 6'b0;
	  else if (state == DATAREAD)
		begin
			if (data_count == 20000)
					bitcount <= bitcount + 1'b1; //add 1 when iIRDA posedge
		end   
	  else
	     bitcount <= 6'b0;

//state change between IDLE,GUIDE,DATA_READ according to irda edge or counter
always @(posedge iCLK or negedge iRST_n) 
	  if (!iRST_n)	     
	     state <= IDLE;
	  else 
			 case (state)
 			    IDLE     : if (idle_count > GUIDE_LOW_DUR)  // state chang from IDLE to Guidance when detect the negedge and the low voltage last for > 4.6ms
			  	              state <= GUIDANCE; 
			    GUIDANCE : if (state_count > GUIDE_HIGH_DUR)//state change from GUIDANCE to DATAREAD when detect the posedge and the high voltage last for > 4.2ms
			  	              state <= DATAREAD;
			    DATAREAD : if ((data_count >= IDLE_HIGH_DUR) || (bitcount >= 33))
			  					      state <= IDLE;
	        default  : state <= IDLE; //default
			 endcase

//data decode base on the value of data_count 	
always @(posedge iCLK or negedge iRST_n)
	  if (!iRST_n)
	     data <= 0;
		else if (state == DATAREAD)
		begin
			 if (data_count >= DATA_HIGH_DUR) //2^15 = 32767*0.02us = 0.64us
			    data[bitcount-1'b1] <= 1'b1;  //>0.52ms  sample the bit 1
		end
		else
			 data <= 0;
	
//set the data_ready flag 
always @(posedge iCLK or negedge iRST_n) 
	  if (!iRST_n)
	     data_ready <= 1'b0;
    else if (bitcount == 32)   
		begin
			 if (data[31:24] == ~data[23:16])
			 begin		
					data_buf <= data;     //fetch the value to the databuf from the data reg
				  data_ready <= 1'b1;   //set the data ready flag
			 end	
			 else
				  data_ready <= 1'b0 ;  //data error
		end
		else
		   data_ready <= 1'b0 ;

//read data
always @(posedge iCLK or negedge iRST_n)
	  if (!iRST_n)
		   oDATA <= 32'b0000;
	  else if (data_ready)
	     oDATA <= data_buf;  //output
					
endmodule