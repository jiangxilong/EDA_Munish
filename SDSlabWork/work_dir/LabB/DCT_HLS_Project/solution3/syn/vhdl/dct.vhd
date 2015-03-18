-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2013.3
-- Copyright (C) 2013 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dct is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    input_r_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    input_r_ce0 : OUT STD_LOGIC;
    input_r_q0 : IN STD_LOGIC_VECTOR (15 downto 0);
    output_r_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    output_r_ce0 : OUT STD_LOGIC;
    output_r_we0 : OUT STD_LOGIC;
    output_r_d0 : OUT STD_LOGIC_VECTOR (15 downto 0) );
end;


architecture behav of dct is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "dct,hls_ip_2013_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=8.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.380000,HLS_SYN_LAT=894,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=0}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_ST_pp0_stg0_fsm_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_st5_fsm_2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_st6_fsm_3 : STD_LOGIC_VECTOR (2 downto 0) := "011";
    constant ap_ST_pp1_stg0_fsm_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_ST_st10_fsm_5 : STD_LOGIC_VECTOR (2 downto 0) := "101";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv7_40 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_const_lv4_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal indvar_flatten_reg_130 : STD_LOGIC_VECTOR (6 downto 0);
    signal r_i_reg_141 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i_reg_153 : STD_LOGIC_VECTOR (3 downto 0);
    signal indvar_flatten1_reg_164 : STD_LOGIC_VECTOR (6 downto 0);
    signal r_i2_reg_175 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i6_reg_187 : STD_LOGIC_VECTOR (3 downto 0);
    signal exitcond_flatten_fu_221_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_flatten_reg_413 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ppiten_pp0_it0 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp0_it1 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp0_it2 : STD_LOGIC := '0';
    signal ap_reg_ppstg_exitcond_flatten_reg_413_pp0_it1 : STD_LOGIC_VECTOR (0 downto 0);
    signal indvar_flatten_next_fu_227_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal exitcond_i_fu_233_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_i_reg_422 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i_mid2_fu_239_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i_mid2_reg_427 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_reg_ppstg_c_i_mid2_reg_427_pp0_it1 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_fu_247_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_i_mid2_fu_259_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_i_mid2_reg_438 : STD_LOGIC_VECTOR (3 downto 0);
    signal exitcond_flatten1_fu_317_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_flatten1_reg_449 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ppiten_pp1_it0 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp1_it1 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp1_it2 : STD_LOGIC := '0';
    signal ap_reg_ppstg_exitcond_flatten1_reg_449_pp1_it1 : STD_LOGIC_VECTOR (0 downto 0);
    signal indvar_flatten_next1_fu_323_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal exitcond_i1_fu_329_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_i1_reg_458 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i6_mid2_fu_335_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i6_mid2_reg_463 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_1_fu_343_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_i2_mid2_fu_355_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_i2_mid2_reg_474 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_9_i_fu_403_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_9_i_reg_484 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_dct_2d_fu_199_ap_done : STD_LOGIC;
    signal buf_2d_in_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal buf_2d_in_ce0 : STD_LOGIC;
    signal buf_2d_in_we0 : STD_LOGIC;
    signal buf_2d_in_d0 : STD_LOGIC_VECTOR (15 downto 0);
    signal buf_2d_in_q0 : STD_LOGIC_VECTOR (15 downto 0);
    signal buf_2d_in_address1 : STD_LOGIC_VECTOR (5 downto 0);
    signal buf_2d_in_ce1 : STD_LOGIC;
    signal buf_2d_in_q1 : STD_LOGIC_VECTOR (15 downto 0);
    signal buf_2d_out_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal buf_2d_out_ce0 : STD_LOGIC;
    signal buf_2d_out_we0 : STD_LOGIC;
    signal buf_2d_out_d0 : STD_LOGIC_VECTOR (15 downto 0);
    signal buf_2d_out_q0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_dct_2d_fu_199_ap_start : STD_LOGIC;
    signal grp_dct_2d_fu_199_ap_idle : STD_LOGIC;
    signal grp_dct_2d_fu_199_ap_ready : STD_LOGIC;
    signal grp_dct_2d_fu_199_in_block_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_dct_2d_fu_199_in_block_ce0 : STD_LOGIC;
    signal grp_dct_2d_fu_199_in_block_q0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_dct_2d_fu_199_in_block_address1 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_dct_2d_fu_199_in_block_ce1 : STD_LOGIC;
    signal grp_dct_2d_fu_199_in_block_q1 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_dct_2d_fu_199_out_block_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_dct_2d_fu_199_out_block_ce0 : STD_LOGIC;
    signal grp_dct_2d_fu_199_out_block_we0 : STD_LOGIC;
    signal grp_dct_2d_fu_199_out_block_d0 : STD_LOGIC_VECTOR (15 downto 0);
    signal r_i_phi_fu_145_p4 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_i2_phi_fu_179_p4 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_dct_2d_fu_199_ap_start_ap_start_reg : STD_LOGIC := '0';
    signal tmp_6_i_fu_287_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_2_fu_312_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_5_fu_398_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_3_i_fu_409_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal r_fu_253_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_fu_266_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal c_i_cast6_fu_278_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_i_fu_270_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_5_i_fu_281_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_1_fu_295_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal p_addr_cast_fu_302_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_7_i_trn_cast_fu_292_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_addr1_fu_306_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal r_s_fu_349_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_3_fu_362_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_4_fu_380_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal p_addr2_cast_fu_388_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_8_i_trn_cast_fu_377_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_addr3_fu_392_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i6_cast2_fu_374_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_i5_fu_366_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);

    component dct_2d IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        in_block_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
        in_block_ce0 : OUT STD_LOGIC;
        in_block_q0 : IN STD_LOGIC_VECTOR (15 downto 0);
        in_block_address1 : OUT STD_LOGIC_VECTOR (5 downto 0);
        in_block_ce1 : OUT STD_LOGIC;
        in_block_q1 : IN STD_LOGIC_VECTOR (15 downto 0);
        out_block_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
        out_block_ce0 : OUT STD_LOGIC;
        out_block_we0 : OUT STD_LOGIC;
        out_block_d0 : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component dct_2d_col_inbuf IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (5 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (15 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (15 downto 0);
        address1 : IN STD_LOGIC_VECTOR (5 downto 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component dct_2d_row_outbuf IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (5 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (15 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;



begin
    buf_2d_in_U : component dct_2d_col_inbuf
    generic map (
        DataWidth => 16,
        AddressRange => 64,
        AddressWidth => 6)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => buf_2d_in_address0,
        ce0 => buf_2d_in_ce0,
        we0 => buf_2d_in_we0,
        d0 => buf_2d_in_d0,
        q0 => buf_2d_in_q0,
        address1 => buf_2d_in_address1,
        ce1 => buf_2d_in_ce1,
        q1 => buf_2d_in_q1);

    buf_2d_out_U : component dct_2d_row_outbuf
    generic map (
        DataWidth => 16,
        AddressRange => 64,
        AddressWidth => 6)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => buf_2d_out_address0,
        ce0 => buf_2d_out_ce0,
        we0 => buf_2d_out_we0,
        d0 => buf_2d_out_d0,
        q0 => buf_2d_out_q0);

    grp_dct_2d_fu_199 : component dct_2d
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_dct_2d_fu_199_ap_start,
        ap_done => grp_dct_2d_fu_199_ap_done,
        ap_idle => grp_dct_2d_fu_199_ap_idle,
        ap_ready => grp_dct_2d_fu_199_ap_ready,
        in_block_address0 => grp_dct_2d_fu_199_in_block_address0,
        in_block_ce0 => grp_dct_2d_fu_199_in_block_ce0,
        in_block_q0 => grp_dct_2d_fu_199_in_block_q0,
        in_block_address1 => grp_dct_2d_fu_199_in_block_address1,
        in_block_ce1 => grp_dct_2d_fu_199_in_block_ce1,
        in_block_q1 => grp_dct_2d_fu_199_in_block_q1,
        out_block_address0 => grp_dct_2d_fu_199_out_block_address0,
        out_block_ce0 => grp_dct_2d_fu_199_out_block_ce0,
        out_block_we0 => grp_dct_2d_fu_199_out_block_we0,
        out_block_d0 => grp_dct_2d_fu_199_out_block_d0);





    -- the current state (ap_CS_fsm) of the state machine. --
    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it0 assign process. --
    ap_reg_ppiten_pp0_it0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
            else
                if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and not((exitcond_flatten_fu_221_p2 = ap_const_lv1_0)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
                elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it1 assign process. --
    ap_reg_ppiten_pp0_it1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
            else
                if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (exitcond_flatten_fu_221_p2 = ap_const_lv1_0))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
                elsif ((((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0))) or ((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and not((exitcond_flatten_fu_221_p2 = ap_const_lv1_0))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it2 assign process. --
    ap_reg_ppiten_pp0_it2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
            else
                if ((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm)) then 
                    ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
                elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                    ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp1_it0 assign process. --
    ap_reg_ppiten_pp1_it0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp1_it0 <= ap_const_logic_0;
            else
                if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and not((ap_const_lv1_0 = exitcond_flatten1_fu_317_p2)))) then 
                    ap_reg_ppiten_pp1_it0 <= ap_const_logic_0;
                elsif (((ap_ST_st6_fsm_3 = ap_CS_fsm) and not((ap_const_logic_0 = grp_dct_2d_fu_199_ap_done)))) then 
                    ap_reg_ppiten_pp1_it0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp1_it1 assign process. --
    ap_reg_ppiten_pp1_it1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp1_it1 <= ap_const_logic_0;
            else
                if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_lv1_0 = exitcond_flatten1_fu_317_p2))) then 
                    ap_reg_ppiten_pp1_it1 <= ap_const_logic_1;
                elsif ((((ap_ST_st6_fsm_3 = ap_CS_fsm) and not((ap_const_logic_0 = grp_dct_2d_fu_199_ap_done))) or ((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and not((ap_const_lv1_0 = exitcond_flatten1_fu_317_p2))))) then 
                    ap_reg_ppiten_pp1_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp1_it2 assign process. --
    ap_reg_ppiten_pp1_it2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp1_it2 <= ap_const_logic_0;
            else
                if ((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm)) then 
                    ap_reg_ppiten_pp1_it2 <= ap_reg_ppiten_pp1_it1;
                elsif (((ap_ST_st6_fsm_3 = ap_CS_fsm) and not((ap_const_logic_0 = grp_dct_2d_fu_199_ap_done)))) then 
                    ap_reg_ppiten_pp1_it2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- grp_dct_2d_fu_199_ap_start_ap_start_reg assign process. --
    grp_dct_2d_fu_199_ap_start_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_dct_2d_fu_199_ap_start_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_ST_st5_fsm_2 = ap_CS_fsm)) then 
                    grp_dct_2d_fu_199_ap_start_ap_start_reg <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_dct_2d_fu_199_ap_ready)) then 
                    grp_dct_2d_fu_199_ap_start_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- c_i6_reg_187 assign process. --
    c_i6_reg_187_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and (ap_const_lv1_0 = exitcond_flatten1_fu_317_p2))) then 
                c_i6_reg_187 <= c_1_fu_343_p2;
            elsif (((ap_ST_st6_fsm_3 = ap_CS_fsm) and not((ap_const_logic_0 = grp_dct_2d_fu_199_ap_done)))) then 
                c_i6_reg_187 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- c_i_reg_153 assign process. --
    c_i_reg_153_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and (exitcond_flatten_fu_221_p2 = ap_const_lv1_0))) then 
                c_i_reg_153 <= c_fu_247_p2;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                c_i_reg_153 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- indvar_flatten1_reg_164 assign process. --
    indvar_flatten1_reg_164_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and (ap_const_lv1_0 = exitcond_flatten1_fu_317_p2))) then 
                indvar_flatten1_reg_164 <= indvar_flatten_next1_fu_323_p2;
            elsif (((ap_ST_st6_fsm_3 = ap_CS_fsm) and not((ap_const_logic_0 = grp_dct_2d_fu_199_ap_done)))) then 
                indvar_flatten1_reg_164 <= ap_const_lv7_0;
            end if; 
        end if;
    end process;

    -- indvar_flatten_reg_130 assign process. --
    indvar_flatten_reg_130_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and (exitcond_flatten_fu_221_p2 = ap_const_lv1_0))) then 
                indvar_flatten_reg_130 <= indvar_flatten_next_fu_227_p2;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                indvar_flatten_reg_130 <= ap_const_lv7_0;
            end if; 
        end if;
    end process;

    -- r_i2_reg_175 assign process. --
    r_i2_reg_175_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it2) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_flatten1_reg_449_pp1_it1))) then 
                r_i2_reg_175 <= r_i2_mid2_reg_474;
            elsif (((ap_ST_st6_fsm_3 = ap_CS_fsm) and not((ap_const_logic_0 = grp_dct_2d_fu_199_ap_done)))) then 
                r_i2_reg_175 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- r_i_reg_141 assign process. --
    r_i_reg_141_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_reg_ppstg_exitcond_flatten_reg_413_pp0_it1 = ap_const_lv1_0))) then 
                r_i_reg_141 <= r_i_mid2_reg_438;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                r_i_reg_141 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm)) then
                ap_reg_ppstg_c_i_mid2_reg_427_pp0_it1 <= c_i_mid2_reg_427;
                ap_reg_ppstg_exitcond_flatten_reg_413_pp0_it1 <= exitcond_flatten_reg_413;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm)) then
                ap_reg_ppstg_exitcond_flatten1_reg_449_pp1_it1 <= exitcond_flatten1_reg_449;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and (ap_const_lv1_0 = exitcond_flatten1_fu_317_p2))) then
                c_i6_mid2_reg_463 <= c_i6_mid2_fu_335_p3;
                exitcond_i1_reg_458 <= exitcond_i1_fu_329_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and (exitcond_flatten_fu_221_p2 = ap_const_lv1_0))) then
                c_i_mid2_reg_427 <= c_i_mid2_fu_239_p3;
                exitcond_i_reg_422 <= exitcond_i_fu_233_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it0))) then
                exitcond_flatten1_reg_449 <= exitcond_flatten1_fu_317_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) then
                exitcond_flatten_reg_413 <= exitcond_flatten_fu_221_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and (ap_const_lv1_0 = exitcond_flatten1_reg_449))) then
                r_i2_mid2_reg_474 <= r_i2_mid2_fu_355_p3;
                tmp_9_i_reg_484 <= tmp_9_i_fu_403_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_flatten_reg_413 = ap_const_lv1_0))) then
                r_i_mid2_reg_438 <= r_i_mid2_fu_259_p3;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_start , ap_CS_fsm , exitcond_flatten_fu_221_p2 , ap_reg_ppiten_pp0_it0 , ap_reg_ppiten_pp0_it1 , ap_reg_ppiten_pp0_it2 , exitcond_flatten1_fu_317_p2 , ap_reg_ppiten_pp1_it0 , ap_reg_ppiten_pp1_it1 , ap_reg_ppiten_pp1_it2 , grp_dct_2d_fu_199_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_pp0_stg0_fsm_1 => 
                if ((not(((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((exitcond_flatten_fu_221_p2 = ap_const_lv1_0)) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_1;
                elsif (((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((exitcond_flatten_fu_221_p2 = ap_const_lv1_0)) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) then
                    ap_NS_fsm <= ap_ST_st5_fsm_2;
                else
                    ap_NS_fsm <= ap_ST_st5_fsm_2;
                end if;
            when ap_ST_st5_fsm_2 => 
                ap_NS_fsm <= ap_ST_st6_fsm_3;
            when ap_ST_st6_fsm_3 => 
                if (not((ap_const_logic_0 = grp_dct_2d_fu_199_ap_done))) then
                    ap_NS_fsm <= ap_ST_pp1_stg0_fsm_4;
                else
                    ap_NS_fsm <= ap_ST_st6_fsm_3;
                end if;
            when ap_ST_pp1_stg0_fsm_4 => 
                if ((not(((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it2) and not((ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))) and not(((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((ap_const_lv1_0 = exitcond_flatten1_fu_317_p2)) and not((ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))))) then
                    ap_NS_fsm <= ap_ST_pp1_stg0_fsm_4;
                elsif (((ap_const_logic_1 = ap_reg_ppiten_pp1_it0) and not((ap_const_lv1_0 = exitcond_flatten1_fu_317_p2)) and not((ap_const_logic_1 = ap_reg_ppiten_pp1_it1)))) then
                    ap_NS_fsm <= ap_ST_st10_fsm_5;
                else
                    ap_NS_fsm <= ap_ST_st10_fsm_5;
                end if;
            when ap_ST_st10_fsm_5 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_st10_fsm_5 = ap_CS_fsm)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_idle assign process. --
    ap_idle_assign_proc : process(ap_start, ap_CS_fsm)
    begin
        if ((not((ap_const_logic_1 = ap_start)) and (ap_ST_st1_fsm_0 = ap_CS_fsm))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_ready assign process. --
    ap_ready_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_st10_fsm_5 = ap_CS_fsm)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    -- buf_2d_in_address0 assign process. --
    buf_2d_in_address0_assign_proc : process(ap_CS_fsm, ap_reg_ppiten_pp0_it2, grp_dct_2d_fu_199_in_block_address0, tmp_2_fu_312_p1)
    begin
        if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2))) then 
            buf_2d_in_address0 <= tmp_2_fu_312_p1(6 - 1 downto 0);
        elsif ((ap_ST_st6_fsm_3 = ap_CS_fsm)) then 
            buf_2d_in_address0 <= grp_dct_2d_fu_199_in_block_address0;
        else 
            buf_2d_in_address0 <= "XXXXXX";
        end if; 
    end process;

    buf_2d_in_address1 <= grp_dct_2d_fu_199_in_block_address1;

    -- buf_2d_in_ce0 assign process. --
    buf_2d_in_ce0_assign_proc : process(ap_CS_fsm, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_flatten_reg_413_pp0_it1, grp_dct_2d_fu_199_in_block_ce0)
    begin
        if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_reg_ppstg_exitcond_flatten_reg_413_pp0_it1 = ap_const_lv1_0))) then 
            buf_2d_in_ce0 <= ap_const_logic_1;
        elsif ((ap_ST_st6_fsm_3 = ap_CS_fsm)) then 
            buf_2d_in_ce0 <= grp_dct_2d_fu_199_in_block_ce0;
        else 
            buf_2d_in_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    -- buf_2d_in_ce1 assign process. --
    buf_2d_in_ce1_assign_proc : process(ap_CS_fsm, grp_dct_2d_fu_199_in_block_ce1)
    begin
        if ((ap_ST_st6_fsm_3 = ap_CS_fsm)) then 
            buf_2d_in_ce1 <= grp_dct_2d_fu_199_in_block_ce1;
        else 
            buf_2d_in_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    buf_2d_in_d0 <= input_r_q0;

    -- buf_2d_in_we0 assign process. --
    buf_2d_in_we0_assign_proc : process(ap_CS_fsm, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_flatten_reg_413_pp0_it1)
    begin
        if ((((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_reg_ppstg_exitcond_flatten_reg_413_pp0_it1 = ap_const_lv1_0)))) then 
            buf_2d_in_we0 <= ap_const_logic_1;
        else 
            buf_2d_in_we0 <= ap_const_logic_0;
        end if; 
    end process;


    -- buf_2d_out_address0 assign process. --
    buf_2d_out_address0_assign_proc : process(ap_CS_fsm, ap_reg_ppiten_pp1_it1, grp_dct_2d_fu_199_out_block_address0, tmp_5_fu_398_p1)
    begin
        if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1))) then 
            buf_2d_out_address0 <= tmp_5_fu_398_p1(6 - 1 downto 0);
        elsif ((ap_ST_st6_fsm_3 = ap_CS_fsm)) then 
            buf_2d_out_address0 <= grp_dct_2d_fu_199_out_block_address0;
        else 
            buf_2d_out_address0 <= "XXXXXX";
        end if; 
    end process;


    -- buf_2d_out_ce0 assign process. --
    buf_2d_out_ce0_assign_proc : process(ap_CS_fsm, exitcond_flatten1_reg_449, ap_reg_ppiten_pp1_it1, grp_dct_2d_fu_199_out_block_ce0)
    begin
        if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it1) and (ap_const_lv1_0 = exitcond_flatten1_reg_449))) then 
            buf_2d_out_ce0 <= ap_const_logic_1;
        elsif ((ap_ST_st6_fsm_3 = ap_CS_fsm)) then 
            buf_2d_out_ce0 <= grp_dct_2d_fu_199_out_block_ce0;
        else 
            buf_2d_out_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    buf_2d_out_d0 <= grp_dct_2d_fu_199_out_block_d0;

    -- buf_2d_out_we0 assign process. --
    buf_2d_out_we0_assign_proc : process(ap_CS_fsm, grp_dct_2d_fu_199_out_block_we0)
    begin
        if ((ap_ST_st6_fsm_3 = ap_CS_fsm)) then 
            buf_2d_out_we0 <= grp_dct_2d_fu_199_out_block_we0;
        else 
            buf_2d_out_we0 <= ap_const_logic_0;
        end if; 
    end process;

    c_1_fu_343_p2 <= std_logic_vector(unsigned(c_i6_mid2_fu_335_p3) + unsigned(ap_const_lv4_1));
    c_fu_247_p2 <= std_logic_vector(unsigned(c_i_mid2_fu_239_p3) + unsigned(ap_const_lv4_1));
    c_i6_cast2_fu_374_p1 <= std_logic_vector(resize(unsigned(c_i6_mid2_reg_463),6));
    c_i6_mid2_fu_335_p3 <= 
        ap_const_lv4_0 when (exitcond_i1_fu_329_p2(0) = '1') else 
        c_i6_reg_187;
    c_i_cast6_fu_278_p1 <= std_logic_vector(resize(unsigned(c_i_mid2_reg_427),6));
    c_i_mid2_fu_239_p3 <= 
        ap_const_lv4_0 when (exitcond_i_fu_233_p2(0) = '1') else 
        c_i_reg_153;
    exitcond_flatten1_fu_317_p2 <= "1" when (indvar_flatten1_reg_164 = ap_const_lv7_40) else "0";
    exitcond_flatten_fu_221_p2 <= "1" when (indvar_flatten_reg_130 = ap_const_lv7_40) else "0";
    exitcond_i1_fu_329_p2 <= "1" when (c_i6_reg_187 = ap_const_lv4_8) else "0";
    exitcond_i_fu_233_p2 <= "1" when (c_i_reg_153 = ap_const_lv4_8) else "0";
    grp_dct_2d_fu_199_ap_start <= grp_dct_2d_fu_199_ap_start_ap_start_reg;
    grp_dct_2d_fu_199_in_block_q0 <= buf_2d_in_q0;
    grp_dct_2d_fu_199_in_block_q1 <= buf_2d_in_q1;
    indvar_flatten_next1_fu_323_p2 <= std_logic_vector(unsigned(indvar_flatten1_reg_164) + unsigned(ap_const_lv7_1));
    indvar_flatten_next_fu_227_p2 <= std_logic_vector(unsigned(indvar_flatten_reg_130) + unsigned(ap_const_lv7_1));
    input_r_address0 <= tmp_6_i_fu_287_p1(6 - 1 downto 0);

    -- input_r_ce0 assign process. --
    input_r_ce0_assign_proc : process(ap_CS_fsm, exitcond_flatten_reg_413, ap_reg_ppiten_pp0_it1)
    begin
        if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_flatten_reg_413 = ap_const_lv1_0))) then 
            input_r_ce0 <= ap_const_logic_1;
        else 
            input_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    output_r_address0 <= tmp_3_i_fu_409_p1(6 - 1 downto 0);

    -- output_r_ce0 assign process. --
    output_r_ce0_assign_proc : process(ap_CS_fsm, ap_reg_ppiten_pp1_it2, ap_reg_ppstg_exitcond_flatten1_reg_449_pp1_it1)
    begin
        if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it2) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_flatten1_reg_449_pp1_it1))) then 
            output_r_ce0 <= ap_const_logic_1;
        else 
            output_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    output_r_d0 <= buf_2d_out_q0;

    -- output_r_we0 assign process. --
    output_r_we0_assign_proc : process(ap_CS_fsm, ap_reg_ppiten_pp1_it2, ap_reg_ppstg_exitcond_flatten1_reg_449_pp1_it1)
    begin
        if ((((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it2) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_flatten1_reg_449_pp1_it1)))) then 
            output_r_we0 <= ap_const_logic_1;
        else 
            output_r_we0 <= ap_const_logic_0;
        end if; 
    end process;

    p_addr1_fu_306_p2 <= std_logic_vector(unsigned(p_addr_cast_fu_302_p1) + unsigned(tmp_7_i_trn_cast_fu_292_p1));
    p_addr2_cast_fu_388_p1 <= std_logic_vector(resize(unsigned(tmp_4_fu_380_p3),8));
    p_addr3_fu_392_p2 <= std_logic_vector(unsigned(p_addr2_cast_fu_388_p1) + unsigned(tmp_8_i_trn_cast_fu_377_p1));
    p_addr_cast_fu_302_p1 <= std_logic_vector(resize(unsigned(tmp_1_fu_295_p3),8));
    r_fu_253_p2 <= std_logic_vector(unsigned(r_i_phi_fu_145_p4) + unsigned(ap_const_lv4_1));
    r_i2_mid2_fu_355_p3 <= 
        r_s_fu_349_p2 when (exitcond_i1_reg_458(0) = '1') else 
        r_i2_phi_fu_179_p4;

    -- r_i2_phi_fu_179_p4 assign process. --
    r_i2_phi_fu_179_p4_assign_proc : process(ap_CS_fsm, r_i2_reg_175, ap_reg_ppiten_pp1_it2, ap_reg_ppstg_exitcond_flatten1_reg_449_pp1_it1, r_i2_mid2_reg_474)
    begin
        if (((ap_ST_pp1_stg0_fsm_4 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp1_it2) and (ap_const_lv1_0 = ap_reg_ppstg_exitcond_flatten1_reg_449_pp1_it1))) then 
            r_i2_phi_fu_179_p4 <= r_i2_mid2_reg_474;
        else 
            r_i2_phi_fu_179_p4 <= r_i2_reg_175;
        end if; 
    end process;

    r_i_mid2_fu_259_p3 <= 
        r_fu_253_p2 when (exitcond_i_reg_422(0) = '1') else 
        r_i_phi_fu_145_p4;

    -- r_i_phi_fu_145_p4 assign process. --
    r_i_phi_fu_145_p4_assign_proc : process(ap_CS_fsm, r_i_reg_141, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_flatten_reg_413_pp0_it1, r_i_mid2_reg_438)
    begin
        if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_reg_ppstg_exitcond_flatten_reg_413_pp0_it1 = ap_const_lv1_0))) then 
            r_i_phi_fu_145_p4 <= r_i_mid2_reg_438;
        else 
            r_i_phi_fu_145_p4 <= r_i_reg_141;
        end if; 
    end process;

    r_s_fu_349_p2 <= std_logic_vector(unsigned(r_i2_phi_fu_179_p4) + unsigned(ap_const_lv4_1));
    tmp_1_fu_295_p3 <= (r_i_mid2_reg_438 & ap_const_lv3_0);
    tmp_2_fu_312_p1 <= std_logic_vector(resize(unsigned(p_addr1_fu_306_p2),64));
    tmp_3_fu_362_p1 <= r_i2_mid2_fu_355_p3(3 - 1 downto 0);
    tmp_3_i_fu_409_p1 <= std_logic_vector(resize(unsigned(tmp_9_i_reg_484),64));
    tmp_4_fu_380_p3 <= (r_i2_mid2_fu_355_p3 & ap_const_lv3_0);
    tmp_5_fu_398_p1 <= std_logic_vector(resize(unsigned(p_addr3_fu_392_p2),64));
    tmp_5_i_fu_281_p2 <= std_logic_vector(unsigned(c_i_cast6_fu_278_p1) + unsigned(tmp_i_fu_270_p3));
    tmp_6_i_fu_287_p1 <= std_logic_vector(resize(unsigned(tmp_5_i_fu_281_p2),64));
    tmp_7_i_trn_cast_fu_292_p1 <= std_logic_vector(resize(unsigned(ap_reg_ppstg_c_i_mid2_reg_427_pp0_it1),8));
    tmp_8_i_trn_cast_fu_377_p1 <= std_logic_vector(resize(unsigned(c_i6_mid2_reg_463),8));
    tmp_9_i_fu_403_p2 <= std_logic_vector(unsigned(c_i6_cast2_fu_374_p1) + unsigned(tmp_i5_fu_366_p3));
    tmp_fu_266_p1 <= r_i_mid2_fu_259_p3(3 - 1 downto 0);
    tmp_i5_fu_366_p3 <= (tmp_3_fu_362_p1 & ap_const_lv3_0);
    tmp_i_fu_270_p3 <= (tmp_fu_266_p1 & ap_const_lv3_0);
end behav;
