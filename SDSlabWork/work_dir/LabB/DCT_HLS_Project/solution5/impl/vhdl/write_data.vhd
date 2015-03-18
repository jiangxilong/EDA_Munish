-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2013.3
-- Copyright (C) 2013 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity write_data is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    buf_r_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    buf_r_ce0 : OUT STD_LOGIC;
    buf_r_q0 : IN STD_LOGIC_VECTOR (15 downto 0);
    output_r_address0 : OUT STD_LOGIC_VECTOR (5 downto 0);
    output_r_ce0 : OUT STD_LOGIC;
    output_r_we0 : OUT STD_LOGIC;
    output_r_d0 : OUT STD_LOGIC_VECTOR (15 downto 0) );
end;


architecture behav of write_data is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_ST_pp0_stg0_fsm_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_st5_fsm_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv7_40 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_const_lv4_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal indvar_flatten_reg_69 : STD_LOGIC_VECTOR (6 downto 0);
    signal r_reg_80 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_reg_92 : STD_LOGIC_VECTOR (3 downto 0);
    signal exitcond_flatten_fu_104_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond_flatten_reg_200 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ppiten_pp0_it0 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp0_it1 : STD_LOGIC := '0';
    signal ap_reg_ppiten_pp0_it2 : STD_LOGIC := '0';
    signal ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1 : STD_LOGIC_VECTOR (0 downto 0);
    signal indvar_flatten_next_fu_110_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal exitcond4_fu_116_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond4_reg_209 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_mid2_fu_122_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_mid2_reg_214 : STD_LOGIC_VECTOR (3 downto 0);
    signal c_1_fu_130_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_mid2_fu_142_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_mid2_reg_225 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_5_fu_190_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_5_reg_235 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_sig_bdd_76 : BOOLEAN;
    signal r_phi_fu_84_p4 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_2_fu_185_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_6_fu_196_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal r_s_fu_136_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal tmp_fu_149_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_1_fu_167_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal p_addr_cast_fu_175_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_4_trn_cast_fu_164_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_addr1_fu_179_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_s_fu_153_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal c_cast6_fu_161_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);


begin




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


    -- ap_done_reg assign process. --
    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_continue)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((ap_ST_st5_fsm_2 = ap_CS_fsm)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
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
                if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and not((exitcond_flatten_fu_104_p2 = ap_const_lv1_0)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
                elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not(ap_sig_bdd_76))) then 
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
                if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (exitcond_flatten_fu_104_p2 = ap_const_lv1_0))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
                elsif ((((ap_ST_st1_fsm_0 = ap_CS_fsm) and not(ap_sig_bdd_76)) or ((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and not((exitcond_flatten_fu_104_p2 = ap_const_lv1_0))))) then 
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
                elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not(ap_sig_bdd_76))) then 
                    ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- c_reg_92 assign process. --
    c_reg_92_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and (exitcond_flatten_fu_104_p2 = ap_const_lv1_0))) then 
                c_reg_92 <= c_1_fu_130_p2;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not(ap_sig_bdd_76))) then 
                c_reg_92 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- indvar_flatten_reg_69 assign process. --
    indvar_flatten_reg_69_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and (exitcond_flatten_fu_104_p2 = ap_const_lv1_0))) then 
                indvar_flatten_reg_69 <= indvar_flatten_next_fu_110_p2;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not(ap_sig_bdd_76))) then 
                indvar_flatten_reg_69 <= ap_const_lv7_0;
            end if; 
        end if;
    end process;

    -- r_reg_80 assign process. --
    r_reg_80_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1 = ap_const_lv1_0))) then 
                r_reg_80 <= r_mid2_reg_225;
            elsif (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not(ap_sig_bdd_76))) then 
                r_reg_80 <= ap_const_lv4_0;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm)) then
                ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1 <= exitcond_flatten_reg_200;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and (exitcond_flatten_fu_104_p2 = ap_const_lv1_0))) then
                c_mid2_reg_214 <= c_mid2_fu_122_p3;
                exitcond4_reg_209 <= exitcond4_fu_116_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0))) then
                exitcond_flatten_reg_200 <= exitcond_flatten_fu_104_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_flatten_reg_200 = ap_const_lv1_0))) then
                r_mid2_reg_225 <= r_mid2_fu_142_p3;
                tmp_5_reg_235 <= tmp_5_fu_190_p2;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_CS_fsm , exitcond_flatten_fu_104_p2 , ap_reg_ppiten_pp0_it0 , ap_reg_ppiten_pp0_it1 , ap_reg_ppiten_pp0_it2 , ap_sig_bdd_76)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not(ap_sig_bdd_76)) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_pp0_stg0_fsm_1 => 
                if ((not(((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) and not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((exitcond_flatten_fu_104_p2 = ap_const_lv1_0)) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_1;
                elsif (((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not((exitcond_flatten_fu_104_p2 = ap_const_lv1_0)) and not((ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))) then
                    ap_NS_fsm <= ap_ST_st5_fsm_2;
                else
                    ap_NS_fsm <= ap_ST_st5_fsm_2;
                end if;
            when ap_ST_st5_fsm_2 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or (ap_ST_st5_fsm_2 = ap_CS_fsm))) then 
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
        if ((ap_ST_st5_fsm_2 = ap_CS_fsm)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_bdd_76 assign process. --
    ap_sig_bdd_76_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_sig_bdd_76 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;

    buf_r_address0 <= tmp_2_fu_185_p1(6 - 1 downto 0);

    -- buf_r_ce0 assign process. --
    buf_r_ce0_assign_proc : process(ap_CS_fsm, exitcond_flatten_reg_200, ap_reg_ppiten_pp0_it1)
    begin
        if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and (exitcond_flatten_reg_200 = ap_const_lv1_0))) then 
            buf_r_ce0 <= ap_const_logic_1;
        else 
            buf_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    c_1_fu_130_p2 <= std_logic_vector(unsigned(c_mid2_fu_122_p3) + unsigned(ap_const_lv4_1));
    c_cast6_fu_161_p1 <= std_logic_vector(resize(unsigned(c_mid2_reg_214),6));
    c_mid2_fu_122_p3 <= 
        ap_const_lv4_0 when (exitcond4_fu_116_p2(0) = '1') else 
        c_reg_92;
    exitcond4_fu_116_p2 <= "1" when (c_reg_92 = ap_const_lv4_8) else "0";
    exitcond_flatten_fu_104_p2 <= "1" when (indvar_flatten_reg_69 = ap_const_lv7_40) else "0";
    indvar_flatten_next_fu_110_p2 <= std_logic_vector(unsigned(indvar_flatten_reg_69) + unsigned(ap_const_lv7_1));
    output_r_address0 <= tmp_6_fu_196_p1(6 - 1 downto 0);

    -- output_r_ce0 assign process. --
    output_r_ce0_assign_proc : process(ap_CS_fsm, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1)
    begin
        if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1 = ap_const_lv1_0))) then 
            output_r_ce0 <= ap_const_logic_1;
        else 
            output_r_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    output_r_d0 <= buf_r_q0;

    -- output_r_we0 assign process. --
    output_r_we0_assign_proc : process(ap_CS_fsm, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1)
    begin
        if ((((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1 = ap_const_lv1_0)))) then 
            output_r_we0 <= ap_const_logic_1;
        else 
            output_r_we0 <= ap_const_logic_0;
        end if; 
    end process;

    p_addr1_fu_179_p2 <= std_logic_vector(unsigned(p_addr_cast_fu_175_p1) + unsigned(tmp_4_trn_cast_fu_164_p1));
    p_addr_cast_fu_175_p1 <= std_logic_vector(resize(unsigned(tmp_1_fu_167_p3),8));
    r_mid2_fu_142_p3 <= 
        r_s_fu_136_p2 when (exitcond4_reg_209(0) = '1') else 
        r_phi_fu_84_p4;

    -- r_phi_fu_84_p4 assign process. --
    r_phi_fu_84_p4_assign_proc : process(ap_CS_fsm, r_reg_80, ap_reg_ppiten_pp0_it2, ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1, r_mid2_reg_225)
    begin
        if (((ap_ST_pp0_stg0_fsm_1 = ap_CS_fsm) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it2) and (ap_reg_ppstg_exitcond_flatten_reg_200_pp0_it1 = ap_const_lv1_0))) then 
            r_phi_fu_84_p4 <= r_mid2_reg_225;
        else 
            r_phi_fu_84_p4 <= r_reg_80;
        end if; 
    end process;

    r_s_fu_136_p2 <= std_logic_vector(unsigned(r_phi_fu_84_p4) + unsigned(ap_const_lv4_1));
    tmp_1_fu_167_p3 <= (r_mid2_fu_142_p3 & ap_const_lv3_0);
    tmp_2_fu_185_p1 <= std_logic_vector(resize(unsigned(p_addr1_fu_179_p2),64));
    tmp_4_trn_cast_fu_164_p1 <= std_logic_vector(resize(unsigned(c_mid2_reg_214),8));
    tmp_5_fu_190_p2 <= std_logic_vector(unsigned(tmp_s_fu_153_p3) + unsigned(c_cast6_fu_161_p1));
    tmp_6_fu_196_p1 <= std_logic_vector(resize(unsigned(tmp_5_reg_235),64));
    tmp_fu_149_p1 <= r_mid2_fu_142_p3(3 - 1 downto 0);
    tmp_s_fu_153_p3 <= (tmp_fu_149_p1 & ap_const_lv3_0);
end behav;
