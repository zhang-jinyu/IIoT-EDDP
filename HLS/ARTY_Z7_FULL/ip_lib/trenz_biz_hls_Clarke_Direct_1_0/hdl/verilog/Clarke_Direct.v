// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.1
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Clarke_Direct,hls_ip_2017_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.380000,HLS_SYN_LAT=3,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=1,HLS_SYN_FF=332,HLS_SYN_LUT=132}" *)

module Clarke_Direct (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        s_axis_V_TDATA,
        s_axis_V_TVALID,
        s_axis_V_TREADY,
        m_axis_V_TDATA,
        m_axis_V_TVALID,
        m_axis_V_TREADY
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] s_axis_V_TDATA;
input   s_axis_V_TVALID;
output   s_axis_V_TREADY;
output  [63:0] m_axis_V_TDATA;
output   m_axis_V_TVALID;
input   m_axis_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [63:0] s_axis_V_0_data_out;
wire    s_axis_V_0_vld_in;
wire    s_axis_V_0_vld_out;
wire    s_axis_V_0_ack_in;
reg    s_axis_V_0_ack_out;
reg   [63:0] s_axis_V_0_payload_A;
reg   [63:0] s_axis_V_0_payload_B;
reg    s_axis_V_0_sel_rd;
reg    s_axis_V_0_sel_wr;
wire    s_axis_V_0_sel;
wire    s_axis_V_0_load_A;
wire    s_axis_V_0_load_B;
reg   [1:0] s_axis_V_0_state;
wire    s_axis_V_0_state_cmp_full;
reg   [63:0] m_axis_V_1_data_out;
reg    m_axis_V_1_vld_in;
wire    m_axis_V_1_vld_out;
wire    m_axis_V_1_ack_in;
wire    m_axis_V_1_ack_out;
reg   [63:0] m_axis_V_1_payload_A;
reg   [63:0] m_axis_V_1_payload_B;
reg    m_axis_V_1_sel_rd;
reg    m_axis_V_1_sel_wr;
wire    m_axis_V_1_sel;
wire    m_axis_V_1_load_A;
wire    m_axis_V_1_load_B;
reg   [1:0] m_axis_V_1_state;
wire    m_axis_V_1_state_cmp_full;
reg    s_axis_V_TDATA_blk_n;
wire    ap_CS_fsm_state2;
reg    m_axis_V_TDATA_blk_n;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire  signed [15:0] Ia_fu_65_p1;
reg   [15:0] Ia_reg_144;
reg   [15:0] tmp_s_reg_149;
reg   [31:0] tmp_4_reg_155;
wire   [63:0] res_fu_126_p4;
wire   [15:0] tmp_1_fu_73_p4;
wire  signed [16:0] tmp_5_fu_83_p3;
wire  signed [31:0] grp_fu_135_p3;
wire   [0:0] tmp_8_fu_114_p2;
wire   [15:0] tmp_3_fu_119_p3;
wire   [16:0] grp_fu_135_p2;
reg   [3:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 s_axis_V_0_sel_rd = 1'b0;
#0 s_axis_V_0_sel_wr = 1'b0;
#0 s_axis_V_0_state = 2'd0;
#0 m_axis_V_1_sel_rd = 1'b0;
#0 m_axis_V_1_sel_wr = 1'b0;
#0 m_axis_V_1_state = 2'd0;
end

Clarke_Direct_am_bkb #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 17 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 17 ),
    .dout_WIDTH( 32 ))
Clarke_Direct_am_bkb_U0(
    .din0(tmp_5_fu_83_p3),
    .din1(Ia_fu_65_p1),
    .din2(grp_fu_135_p2),
    .dout(grp_fu_135_p3)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        m_axis_V_1_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == m_axis_V_1_ack_out) & (1'b1 == m_axis_V_1_vld_out))) begin
            m_axis_V_1_sel_rd <= ~m_axis_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        m_axis_V_1_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == m_axis_V_1_vld_in) & (1'b1 == m_axis_V_1_ack_in))) begin
            m_axis_V_1_sel_wr <= ~m_axis_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        m_axis_V_1_state <= 2'd0;
    end else begin
        if ((((1'b0 == m_axis_V_1_vld_in) & (1'b1 == m_axis_V_1_ack_out) & (2'd3 == m_axis_V_1_state)) | ((1'b0 == m_axis_V_1_vld_in) & (2'd2 == m_axis_V_1_state)))) begin
            m_axis_V_1_state <= 2'd2;
        end else if ((((1'b1 == m_axis_V_1_vld_in) & (1'b0 == m_axis_V_1_ack_out) & (2'd3 == m_axis_V_1_state)) | ((1'b0 == m_axis_V_1_ack_out) & (2'd1 == m_axis_V_1_state)))) begin
            m_axis_V_1_state <= 2'd1;
        end else if ((((1'b1 == m_axis_V_1_vld_in) & (2'd2 == m_axis_V_1_state)) | ((1'b1 == m_axis_V_1_ack_out) & (2'd1 == m_axis_V_1_state)) | ((2'd3 == m_axis_V_1_state) & ~((1'b1 == m_axis_V_1_vld_in) & (1'b0 == m_axis_V_1_ack_out)) & ~((1'b0 == m_axis_V_1_vld_in) & (1'b1 == m_axis_V_1_ack_out))))) begin
            m_axis_V_1_state <= 2'd3;
        end else begin
            m_axis_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        s_axis_V_0_sel_rd <= 1'b0;
    end else begin
        if (((1'b1 == s_axis_V_0_ack_out) & (1'b1 == s_axis_V_0_vld_out))) begin
            s_axis_V_0_sel_rd <= ~s_axis_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        s_axis_V_0_sel_wr <= 1'b0;
    end else begin
        if (((1'b1 == s_axis_V_0_vld_in) & (1'b1 == s_axis_V_0_ack_in))) begin
            s_axis_V_0_sel_wr <= ~s_axis_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        s_axis_V_0_state <= 2'd0;
    end else begin
        if ((((1'b0 == s_axis_V_0_vld_in) & (1'b1 == s_axis_V_0_ack_out) & (s_axis_V_0_state == 2'd3)) | ((1'b0 == s_axis_V_0_vld_in) & (s_axis_V_0_state == 2'd2)))) begin
            s_axis_V_0_state <= 2'd2;
        end else if ((((1'b1 == s_axis_V_0_vld_in) & (1'b0 == s_axis_V_0_ack_out) & (s_axis_V_0_state == 2'd3)) | ((1'b0 == s_axis_V_0_ack_out) & (s_axis_V_0_state == 2'd1)))) begin
            s_axis_V_0_state <= 2'd1;
        end else if ((((1'b1 == s_axis_V_0_vld_in) & (s_axis_V_0_state == 2'd2)) | ((1'b1 == s_axis_V_0_ack_out) & (s_axis_V_0_state == 2'd1)) | ((s_axis_V_0_state == 2'd3) & ~((1'b1 == s_axis_V_0_vld_in) & (1'b0 == s_axis_V_0_ack_out)) & ~((1'b0 == s_axis_V_0_vld_in) & (1'b1 == s_axis_V_0_ack_out))))) begin
            s_axis_V_0_state <= 2'd3;
        end else begin
            s_axis_V_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (s_axis_V_0_vld_out == 1'b1))) begin
        Ia_reg_144 <= Ia_fu_65_p1;
        tmp_4_reg_155 <= {{s_axis_V_0_data_out[63:32]}};
        tmp_s_reg_149 <= {{grp_fu_135_p3[31:16]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == m_axis_V_1_load_A)) begin
        m_axis_V_1_payload_A <= res_fu_126_p4;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == m_axis_V_1_load_B)) begin
        m_axis_V_1_payload_B <= res_fu_126_p4;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == s_axis_V_0_load_A)) begin
        s_axis_V_0_payload_A <= s_axis_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == s_axis_V_0_load_B)) begin
        s_axis_V_0_payload_B <= s_axis_V_TDATA;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (m_axis_V_1_ack_in == 1'b1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (m_axis_V_1_ack_in == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == m_axis_V_1_sel)) begin
        m_axis_V_1_data_out = m_axis_V_1_payload_B;
    end else begin
        m_axis_V_1_data_out = m_axis_V_1_payload_A;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) & (m_axis_V_1_ack_in == 1'b1))) begin
        m_axis_V_1_vld_in = 1'b1;
    end else begin
        m_axis_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state4))) begin
        m_axis_V_TDATA_blk_n = m_axis_V_1_state[1'd1];
    end else begin
        m_axis_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (s_axis_V_0_vld_out == 1'b1))) begin
        s_axis_V_0_ack_out = 1'b1;
    end else begin
        s_axis_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == s_axis_V_0_sel)) begin
        s_axis_V_0_data_out = s_axis_V_0_payload_B;
    end else begin
        s_axis_V_0_data_out = s_axis_V_0_payload_A;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        s_axis_V_TDATA_blk_n = s_axis_V_0_state[1'd0];
    end else begin
        s_axis_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (s_axis_V_0_vld_out == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (m_axis_V_1_ack_in == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (m_axis_V_1_ack_in == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Ia_fu_65_p1 = s_axis_V_0_data_out[15:0];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_fu_135_p2 = 32'd37837;

assign m_axis_V_1_ack_in = m_axis_V_1_state[1'd1];

assign m_axis_V_1_ack_out = m_axis_V_TREADY;

assign m_axis_V_1_load_A = (m_axis_V_1_state_cmp_full & ~m_axis_V_1_sel_wr);

assign m_axis_V_1_load_B = (m_axis_V_1_sel_wr & m_axis_V_1_state_cmp_full);

assign m_axis_V_1_sel = m_axis_V_1_sel_rd;

assign m_axis_V_1_state_cmp_full = ((m_axis_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign m_axis_V_1_vld_out = m_axis_V_1_state[1'd0];

assign m_axis_V_TDATA = m_axis_V_1_data_out;

assign m_axis_V_TVALID = m_axis_V_1_state[1'd0];

assign res_fu_126_p4 = {{{tmp_4_reg_155}, {tmp_3_fu_119_p3}}, {Ia_reg_144}};

assign s_axis_V_0_ack_in = s_axis_V_0_state[1'd1];

assign s_axis_V_0_load_A = (s_axis_V_0_state_cmp_full & ~s_axis_V_0_sel_wr);

assign s_axis_V_0_load_B = (s_axis_V_0_sel_wr & s_axis_V_0_state_cmp_full);

assign s_axis_V_0_sel = s_axis_V_0_sel_rd;

assign s_axis_V_0_state_cmp_full = ((s_axis_V_0_state != 2'd1) ? 1'b1 : 1'b0);

assign s_axis_V_0_vld_in = s_axis_V_TVALID;

assign s_axis_V_0_vld_out = s_axis_V_0_state[1'd0];

assign s_axis_V_TREADY = s_axis_V_0_state[1'd1];

assign tmp_1_fu_73_p4 = {{s_axis_V_0_data_out[31:16]}};

assign tmp_3_fu_119_p3 = ((tmp_8_fu_114_p2[0:0] === 1'b1) ? 16'd32769 : tmp_s_reg_149);

assign tmp_5_fu_83_p3 = {{tmp_1_fu_73_p4}, {1'd0}};

assign tmp_8_fu_114_p2 = ((tmp_s_reg_149 == 16'd32768) ? 1'b1 : 1'b0);

endmodule //Clarke_Direct