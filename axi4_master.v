module axi4_master.v
#(
  parameter width = 32,
)
(
input  aclk,  // Clock source
input  areset_n,  // Reset source

// Write address channel signals
output [ 3:0] awid,  // ID tag
output [31:0] awaddr,  // address of the first transfer in a write burst transaction
output [ 7:0] awlen,  // number of transfers in a burst
output [ 2:0] awsize,  // The size of each transfer in the burst, 2^n Bytes
output [ 1:0] awburst, // Burst type. 00 same address, 01 incrementing address, 10 loop address
output awlock,  // 0 normal access, 1 exclusive access
output [ 3:0] awcache,  // Memory type.
output [ 2:0] awprot,  // Protection type.
output [ 3:0] awqos,  // Quality of Service
output awuser,  // User signal. Optional User-defined signal in the write address channel (AXI4)
output awvalid,  //  channel is signaling valid write address and control information
input  awready,  // slave is ready to accept an address and associated control signals

// Write data channel signals
output [w-1:0] wdata,  // Write data.
output [(w/8)-1:0] wstrb,  // This signal indicates which byte lanes hold valid data.
output wlast,  // last transfer in a write burst
output wuser,  // Optional User-defined signal in the write data channel (AXI4)
output wvalid,  // valid write data and strobes are available
input  wready,  // slave can accept the write data

// Write response channel signals
input  [ 3:0] bid,  // ID tag
input  [ 1:0] bresp,  // status of transaction(for the entire burst), 00 normal access success, 01 exclusive access success, 10 slave error, 11 decode error
input  buser,  // User signal. Optional User-defined signal in the write response channel (AXI4)
input  bvalid,  // channel is signaling a valid write response
output bready,  // master can accept a write response

// Read address channel signals
output [ 3:0] arid,  // ID tag
output [31:0] araddr,  // Read address. The read address gives the address of the first transfer in a read burst transaction
output [ 7:0] arlen,  // This signal indicates the exact number of transfers in a burst
output [ 2:0] arsize,  // The size of each transfer in the burst, 2^n Bytes
output [ 1:0] arburst,  // Burst type. 00 same address, 01 incrementing address, 10 loop address
output arlock,  // 0 normal access, 1 exclusive access
output [ 3:0] arcache,  // Memory type.
output [ 2:0] arprot,  // Protection type.
output [ 3:0] arqos,  // Quality of Service
output arvalid,  // channel is signaling valid read address and control information
input  arready,  // slave is ready to accept an address and associated control signals

// Read data channel signals
input  [ 3:0] rid,  // ID tag
input  [w-1:0] rdata,  // Read data
input  [ 1:0] rresp,  // status of transfer(for different transfers), 00 normal access success, 01 exclusive access success, 10 slave error, 11 decode error
input  rlast,  // last transfer in a read burst
input  rvalid,  // channel is signaling the required read data
output rready  // master can accept the read data and response information
);

assign awcache = 4'b0000;
assign awburst = 2'b01;
assign awprot  = 3'b000;
assign awlock  = 1'b0;
assign awqos   = 4'b0000;
assign arcache = 4'b0000;
assign arburst = 2'b01;
assign arprot  = 3'b000;
assign arlock  = 1'b0;
assign arqos   = 4'b0000;

endmodule
