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
    "dct,hls_ip_2013_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=8.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.380000,HLS_SYN_LAT=3959,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=0}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_st3_fsm_2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_st4_fsm_3 : STD_LOGIC_VECTOR (2 downto 0) := "011";
    constant ap_ST_st5_fsm_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_ST_st6_fsm_5 : STD_LOGIC_VECTOR (2 downto 0) := "101";
    constant ap_ST_st7_fsm_6 : STD_LOGIC_VECTOR (2 downto 0) := "110";
    constant ap_ST_st8_fsm_7 : STD_LOGIC_VECTOR (2 downto 0) := "111";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal r_fu_166_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_reg_316 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_i_fu_176_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_i_reg_321 : STD_LOGIC_VECTOR (5 downto 0);
    signal exitcond1_i_fu_160_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_fu_194_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_reg_329 : STD_LOGIC_VECTOR (3 downto 0);
    signal exitcond_i_fu_188_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_1_fu_243_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_1_reg_342 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_i5_fu_253_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_i5_reg_347 : STD_LOGIC_VECTOR (5 downto 0);
    signal exitcond1_i3_fu_237_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_1_fu_271_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_1_reg_355 : STD_LOGIC_VECTOR (3 downto 0);
    signal exitcond_i7_fu_265_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_9_i_fu_304_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_9_i_reg_365 : STD_LOGIC_VECTOR (5 downto 0);
    signal buf_2d_in_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal buf_2d_in_ce0 : STD_LOGIC;
    signal buf_2d_in_we0 : STD_LOGIC;
    signal buf_2d_in_d0 : STD_LOGIC_VECTOR (15 downto 0);
    signal buf_2d_in_q0 : STD_LOGIC_VECTOR (15 downto 0);
    signal buf_2d_out_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal buf_2d_out_ce0 : STD_LOGIC;
    signal buf_2d_out_we0 : STD_LOGIC;
    signal buf_2d_out_d0 : STD_LOGIC_VECTOR (15 downto 0);
    signal buf_2d_out_q0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_dct_2d_fu_152_ap_start : STD_LOGIC;
    signal grp_dct_2d_fu_152_ap_done : STD_LOGIC;
    signal grp_dct_2d_fu_152_ap_idle : STD_LOGIC;
    signal grp_dct_2d_fu_152_ap_ready : STD_LOGIC;
    signal grp_dct_2d_fu_152_in_block_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_dct_2d_fu_152_in_block_ce0 : STD_LOGIC;
    signal grp_dct_2d_fu_152_in_block_q0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_dct_2d_fu_152_out_block_address0 : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_dct_2d_fu_152_out_block_ce0 : STD_LOGIC;
    signal grp_dct_2d_fu_152_out_block_we0 : STD_LOGIC;
    signal grp_dct_2d_fu_152_out_block_d0 : STD_LOGIC_VECTOR (15 downto 0);
    signal r_i_reg_104 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i_reg_116 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_i2_reg_128 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_i6_reg_140 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_dct_2d_fu_152_ap_start_ap_start_reg : STD_LOGIC := '0';
    signal tmp_6_i_fu_205_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_3_fu_232_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_5_fu_299_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_3_i_fu_309_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_fu_172_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal c_i_cast6_fu_184_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_5_i_fu_200_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_2_fu_214_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal p_addr_cast_fu_222_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_7_i_trn_cast_fu_210_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_addr1_fu_226_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_1_fu_249_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_4_fu_281_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal p_addr2_cast_fu_289_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_8_i_trn_cast_fu_277_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_addr3_fu_293_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal c_i6_cast2_fu_261_p1 : STD_LOGIC_VECTOR (5 downto 0);
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
        out_block_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
        out_block_ce0 : OUT STD_LOGIC;
        out_block_we0 : OUT STD_LOGIC;
        out_block_d0 : OUT STD_LOGIC_VECTOR (15 downto 0) );
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
    buf_2d_in_U : component dct_2d_row_outbuf
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
        q0 => buf_2d_in_q0);

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

    grp_dct_2d_fu_152 : component dct_2d
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_dct_2d_fu_152_ap_start,
        ap_done => grp_dct_2d_fu_152_ap_done,
        ap_idle => grp_dct_2d_fu_152_ap_idle,
        ap_ready => grp_dct_2d_fu_152_ap_ready,
        in_block_address0 => grp_dct_2d_fu_152_in_block_address0,
        in_block_ce0 => grp_dct_2d_fu_152_in_block_ce0,
        in_block_q0 => grp_dct_2d_fu_152_in_block_q0,
        out_block_address0 => grp_dct_2d_fu_152_out_block_address0,
        out_block_ce0 => grp_dct_2d_fu_152_out_block_ce0,
        out_block_we0 => grp_dct_2d_fu_152_out_block_we0,
        out_block_d0 => grp_dct_2d_fu_152_out_block_d0);





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


    -- grp_dct_2d_fu_152_ap_start_ap_start_reg assign process. --
    grp_dct_2d_fu_152_ap_start_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_dct_2d_fu_152_ap_start_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_ST_st2_fsm_1 = ap_CS_fsm) and not((exitcond1_i_fu_160_p2 = ap_const_lv1_0)))) then 
                    grp_dct_2d_fu_152_ap_start_ap_start_reg <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_dct_2d_fu_152_ap_ready)) then 
                    grp_dct_2d_fu_152_ap_start_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- c_i6_reg_140 assign process. --
    c_i6_reg_140_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st8_fsm_7 = ap_CS_fsm)) then 
                c_i6_reg_140 <= c_1_reg_355;
            elsif (((ap_ST_st6_fsm_5 = ap_CS_fsm) and (ap_const_lv1_0 = exitcond1_i3_fu_237_p2))) then 
                c_i6_reg_140 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- c_i_reg_116 assign process. --
    c_i_reg_116_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st4_fsm_3 = ap_CS_fsm)) then 
                c_i_reg_116 <= c_reg_329;
            elsif (((ap_ST_st2_fsm_1 = ap_CS_fsm) and (exitcond1_i_fu_160_p2 = ap_const_lv1_0))) then 
                c_i_reg_116 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- r_i2_reg_128 assign process. --
    r_i2_reg_128_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st7_fsm_6 = ap_CS_fsm) and not((ap_const_lv1_0 = exitcond_i7_fu_265_p2)))) then 
                r_i2_reg_128 <= r_1_reg_342;
            elsif (((ap_ST_st5_fsm_4 = ap_CS_fsm) and not((ap_const_logic_0 = grp_dct_2d_fu_152_ap_done)))) then 
                r_i2_reg_128 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- r_i_reg_104 assign process. --
    r_i_reg_104_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st3_fsm_2 = ap_CS_fsm) and not((ap_const_lv1_0 = exitcond_i_fu_188_p2)))) then 
                r_i_reg_104 <= r_reg_316;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                r_i_reg_104 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st7_fsm_6 = ap_CS_fsm)) then
                c_1_reg_355 <= c_1_fu_271_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st3_fsm_2 = ap_CS_fsm)) then
                c_reg_329 <= c_fu_194_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st6_fsm_5 = ap_CS_fsm)) then
                r_1_reg_342 <= r_1_fu_243_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st2_fsm_1 = ap_CS_fsm)) then
                r_reg_316 <= r_fu_166_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st7_fsm_6 = ap_CS_fsm) and (ap_const_lv1_0 = exitcond_i7_fu_265_p2))) then
                tmp_9_i_reg_365 <= tmp_9_i_fu_304_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st6_fsm_5 = ap_CS_fsm) and (ap_const_lv1_0 = exitcond1_i3_fu_237_p2))) then
                tmp_i5_reg_347(3) <= tmp_i5_fu_253_p3(3);
    tmp_i5_reg_347(4) <= tmp_i5_fu_253_p3(4);
    tmp_i5_reg_347(5) <= tmp_i5_fu_253_p3(5);
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st2_fsm_1 = ap_CS_fsm) and (exitcond1_i_fu_160_p2 = ap_const_lv1_0))) then
                tmp_i_reg_321(3) <= tmp_i_fu_176_p3(3);
    tmp_i_reg_321(4) <= tmp_i_fu_176_p3(4);
    tmp_i_reg_321(5) <= tmp_i_fu_176_p3(5);
            end if;
        end if;
    end process;
    tmp_i_reg_321(2 downto 0) <= "000";
    tmp_i5_reg_347(2 downto 0) <= "000";

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_start , ap_CS_fsm , exitcond1_i_fu_160_p2 , exitcond_i_fu_188_p2 , exitcond1_i3_fu_237_p2 , exitcond_i7_fu_265_p2 , grp_dct_2d_fu_152_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if ((exitcond1_i_fu_160_p2 = ap_const_lv1_0)) then
                    ap_NS_fsm <= ap_ST_st3_fsm_2;
                else
                    ap_NS_fsm <= ap_ST_st5_fsm_4;
                end if;
            when ap_ST_st3_fsm_2 => 
                if (not((ap_const_lv1_0 = exitcond_i_fu_188_p2))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st4_fsm_3;
                end if;
            when ap_ST_st4_fsm_3 => 
                ap_NS_fsm <= ap_ST_st3_fsm_2;
            when ap_ST_st5_fsm_4 => 
                if (not((ap_const_logic_0 = grp_dct_2d_fu_152_ap_done))) then
                    ap_NS_fsm <= ap_ST_st6_fsm_5;
                else
                    ap_NS_fsm <= ap_ST_st5_fsm_4;
                end if;
            when ap_ST_st6_fsm_5 => 
                if (not((ap_const_lv1_0 = exitcond1_i3_fu_237_p2))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_st7_fsm_6;
                end if;
            when ap_ST_st7_fsm_6 => 
                if (not((ap_const_lv1_0 = exitcond_i7_fu_265_p2))) then
                    ap_NS_fsm <= ap_ST_st6_fsm_5;
                else
                    ap_NS_fsm <= ap_ST_st8_fsm_7;
                end if;
            when ap_ST_st8_fsm_7 => 
                ap_NS_fsm <= ap_ST_st7_fsm_6;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_CS_fsm, exitcond1_i3_fu_237_p2)
    begin
        if (((ap_ST_st6_fsm_5 = ap_CS_fsm) and not((ap_const_lv1_0 = exitcond1_i3_fu_237_p2)))) then 
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
    ap_ready_assign_proc : process(ap_CS_fsm, exitcond1_i3_fu_237_p2)
    begin
        if (((ap_ST_st6_fsm_5 = ap_CS_fsm) and not((ap_const_lv1_0 = exitcond1_i3_fu_237_p2)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    -- buf_2d_in_address0 assign process. --
    buf_2d_in_address0_assign_proc : process(ap_CS_fsm, grp_dct_2d_fu_152_in_block_address0, tmp_3_fu_232_p1)
    begin
        if ((ap_ST_st4_fsm_3 = ap_CS_fsm)) then 
            buf_2d_in_address0 <= tmp_3_fu_232_p1(6 - 1 downto 0);
        elsif ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then 
            buf_2d_in_address0 <= grp_dct_2d_fu_152_in_block_address0;
        else 
            buf_2d_in_address0 <= "XXXXXX";
        end if; 
    end process;


    -- buf_2d_in_ce0 assign process. --
    buf_2d_in_ce0_assign_proc : process(ap_CS_fsm, grp_dct_2d_fu_152_in_block_ce0)
    begin
        if ((ap_ST_st4_fsm_3 = ap_CS_fsm)) then 
            buf_2d_in_ce0 <= ap_const_logic_1;
        elsif ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then 
            buf_2d_in_ce0 <= grp_dct_2d_fu_152_in_block_ce0;
        else 
            buf_2d_in_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    buf_2d_in_d0 <= input_r_q0;

    -- buf_2d_in_we0 assign process. --
    buf_2d_in_we0_assign_proc : process(ap_CS_fsm)
    begin
        if (((ap_ST_st4_fsm_3 = ap_CS_fsm))) then 
            buf_2d_in_we0 <= ap_const_logic_1;
        else 
            buf_2d_in_we0 <= ap_const_logic_0;
        end if; 
    end process;


    -- buf_2d_out_address0 assign process. --
    buf_2d_out_address0_assign_proc : process(ap_CS_fsm, grp_dct_2d_fu_152_out_block_address0, tmp_5_fu_299_p1)
    begin
        if ((ap_ST_st7_fsm_6 = ap_CS_fsm)) then 
            buf_2d_out_address0 <= tmp_5_fu_299_p1(6 - 1 downto 0);
        elsif ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then 
            buf_2d_out_address0 <= grp_dct_2d_fu_152_out_block_address0;
        else 
            buf_2d_out_address0 <= "XXXXXX";
        end if; 
    end process;


    -- buf_2d_out_ce0 assign process. --
    buf_2d_out_ce0_assign_proc : process(ap_CS_fsm, exitcond_i7_fu_265_p2, grp_dct_2d_fu_152_out_block_ce0)
    begin
        if (((ap_ST_st7_fsm_6 = ap_CS_fsm) and (ap_const_lv1_0 = exitcond_i7_fu_265_p2))) then 
            buf_2d_out_ce0 <= ap_const_logic_1;
        elsif ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then 
            buf_2d_out_ce0 <= grp_dct_2d_fu_152_out_block_ce0;
        else 
            buf_2d_out_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    buf_2d_out_d0 <= grp_dct_2d_fu_152_out_block_d0;

    -- buf_2d_out_we0 assign process. --
    buf_2d_out_we0_assign_proc : process(ap_CS_fsm, grp_dct_2d_fu_152_out_block_we0)
    begin
        if ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then 
            buf_2d_out_we0 <= grp_dct_2d_fu_152_out_block_we0;
        else 
            buf_2d_out_we0 <= ap_const_logic_0;
        end if; 
    end process;

    c_1_fu_271_p2 <= std_logic_vector(unsigned(c_i6_reg_140) + unsigned(ap_const_lv4_1));
    c_fu_194_p2 <= std_logic_vector(unsigned(c_i_reg_116) + unsigned(ap_const_lv4_1));
    c_i6_cast2_fu_261_p1 <= std_logic_vector(resize(unsigned(c_i6_reg_140),6));
    c_i_cast6_fu_184_p1 <= std_logic_vector(resize(unsigned(c_i_reg_116),6));
    exitcond1_i3_fu_237_p2 <= "1" when (r_i2_reg_128 = ap_const_lv4_8) else "0";
    exitcond1_i_fu_160_p2 <= "1" when (r_i_reg_104 = ap_const_lv4_8) else "0";
    exitcond_i7_fu_265_p2 <= "1" when (c_i6_reg_140 = ap_const_lv4_8) else "0";
    exitcond_i_fu_188_p2 <= "1" when (c_i_reg_116 = ap_const_lv4_8) else "0";
    grp_dct_2d_fu_152_ap_start <= grp_dct_2d_fu_152_ap_start_ap_start_reg;
    grp_dct_2d_fu_152_in_block_q0 <= buf_2d_in_q0;
    input_r_address0 <= tmp_6_i_fu_205_p1(6 - 1 downto 0);

    -- input_r_ce0 assign process. --
    input_r_ce0_assign_proc : process(ap_CS_fsm, exitcond_i_fu_188_p2)
    begin
        if (((ap_ST_st3_fsm_2 = ap_CS_fsm) and (ap_const_lv1_0 = exitcond_i_fu_188_p2))) then 
            input_r_ce0 <= ap_const_logic_1;
        else 
            input_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    output_r_address0 <= tmp_3_i_fu_309_p1(6 - 1 downto 0);

    -- output_r_ce0 assign process. --
    output_r_ce0_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_st8_fsm_7 = ap_CS_fsm)) then 
            output_r_ce0 <= ap_const_logic_1;
        else 
            output_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    output_r_d0 <= buf_2d_out_q0;

    -- output_r_we0 assign process. --
    output_r_we0_assign_proc : process(ap_CS_fsm)
    begin
        if (((ap_ST_st8_fsm_7 = ap_CS_fsm))) then 
            output_r_we0 <= ap_const_logic_1;
        else 
            output_r_we0 <= ap_const_logic_0;
        end if; 
    end process;

    p_addr1_fu_226_p2 <= std_logic_vector(unsigned(p_addr_cast_fu_222_p1) + unsigned(tmp_7_i_trn_cast_fu_210_p1));
    p_addr2_cast_fu_289_p1 <= std_logic_vector(resize(unsigned(tmp_4_fu_281_p3),8));
    p_addr3_fu_293_p2 <= std_logic_vector(unsigned(p_addr2_cast_fu_289_p1) + unsigned(tmp_8_i_trn_cast_fu_277_p1));
    p_addr_cast_fu_222_p1 <= std_logic_vector(resize(unsigned(tmp_2_fu_214_p3),8));
    r_1_fu_243_p2 <= std_logic_vector(unsigned(r_i2_reg_128) + unsigned(ap_const_lv4_1));
    r_fu_166_p2 <= std_logic_vector(unsigned(r_i_reg_104) + unsigned(ap_const_lv4_1));
    tmp_1_fu_249_p1 <= r_i2_reg_128(3 - 1 downto 0);
    tmp_2_fu_214_p3 <= (r_i_reg_104 & ap_const_lv3_0);
    tmp_3_fu_232_p1 <= std_logic_vector(resize(unsigned(p_addr1_fu_226_p2),64));
    tmp_3_i_fu_309_p1 <= std_logic_vector(resize(unsigned(tmp_9_i_reg_365),64));
    tmp_4_fu_281_p3 <= (r_i2_reg_128 & ap_const_lv3_0);
    tmp_5_fu_299_p1 <= std_logic_vector(resize(unsigned(p_addr3_fu_293_p2),64));
    tmp_5_i_fu_200_p2 <= std_logic_vector(unsigned(c_i_cast6_fu_184_p1) + unsigned(tmp_i_reg_321));
    tmp_6_i_fu_205_p1 <= std_logic_vector(resize(unsigned(tmp_5_i_fu_200_p2),64));
    tmp_7_i_trn_cast_fu_210_p1 <= std_logic_vector(resize(unsigned(c_i_reg_116),8));
    tmp_8_i_trn_cast_fu_277_p1 <= std_logic_vector(resize(unsigned(c_i6_reg_140),8));
    tmp_9_i_fu_304_p2 <= std_logic_vector(unsigned(c_i6_cast2_fu_261_p1) + unsigned(tmp_i5_reg_347));
    tmp_fu_172_p1 <= r_i_reg_104(3 - 1 downto 0);
    tmp_i5_fu_253_p3 <= (tmp_1_fu_249_p1 & ap_const_lv3_0);
    tmp_i_fu_176_p3 <= (tmp_fu_172_p1 & ap_const_lv3_0);
end behav;
