// (C) 2001-2016 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS
// IN THIS FILE.

module ADC_adc_mega_0 (
	CLOCK,
	RESET,
	ADC_CS_N,
	ADC_SCLK,
	ADC_SADDR,
	ADC_SDAT, 
	CH0, 
	CH1, 
	CH2, 
	CH3, 
	CH4, 
	CH5, 
	CH6, 
	CH7
);

parameter tsclk = 8'd16;
parameter numch = 3'd7;
parameter board = "DE1-SoC (rev. A-E)";
parameter board_rev = "Autodetect";

input CLOCK, RESET;
output reg [11:0] CH0, CH1, CH2, CH3, CH4, CH5, CH6, CH7;

input ADC_SDAT;
output ADC_SCLK, ADC_CS_N, ADC_SADDR;

reg go;
wire done;
wire [11:0] outs [7:0];
wire [8:0] T_SCLK;

defparam ADC_CTRL.T_SCLK = tsclk, ADC_CTRL.NUM_CH = numch, ADC_CTRL.BOARD = board, ADC_CTRL.BOARD_REV = board_rev;
altera_up_avalon_adv_adc ADC_CTRL (CLOCK, RESET, go, ADC_SCLK, ADC_CS_N, ADC_SADDR, ADC_SDAT, done, 					outs[0], outs[1], outs[2], outs[3], outs[4], outs [5], outs[6], outs[7]);

always @ (posedge CLOCK)
begin
	if (RESET) begin
		go<=1'b0;
		CH0<=0;
		CH1<=0;
		CH2<=0;
		CH3<=0;
		CH4<=0;
		CH5<=0;
		CH6<=0;
		CH7<=0;
	end
	else if (done) begin
		go<=1'b0;
		CH0<=outs[0];
		CH1<=outs[1];
		CH2<=outs[2];
		CH3<=outs[3];
		CH4<=outs[4];
		CH5<=outs[5];
		CH6<=outs[6];
		CH7<=outs[7];
	end	
	else 
		go<=1'b1;
end

endmodule

