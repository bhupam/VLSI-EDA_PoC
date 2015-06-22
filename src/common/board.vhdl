-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- ============================================================================
-- Authors:					Patrick Lehmann
--
-- Package:					Global board configuration settings.
--
-- Description:
-- ------------------------------------
--		This file evaluates the settings declared in the project specific package my_config.
--		See also template file my_config.vhdl.template.
--
-- License:
-- ============================================================================
-- Copyright 2007-2015 Technische Universitaet Dresden - Germany,
--										 Chair for VLSI-Design, Diagnostics and Architecture
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--		http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- ============================================================================

library	IEEE;
use			IEEE.std_logic_1164.all;
use			IEEE.numeric_std.all;

library	PoC;
use			PoC.my_config.all;
use			PoC.utils.all;
use			PoC.vectors.all;
use			PoC.strings.all;


package board is
	-- TODO: 
	-- ===========================================================================
	subtype T_BOARD_STRING					is STRING(1 to 16);
	subtype T_BOARD_CONFIG_STRING		is STRING(1 to 64);
	
	constant C_BOARD_STRING_EMPTY	: T_BOARD_STRING		:= (others => NUL);
	
	type T_BOARD is (
		BOARD_CUSTOM,
		BOARD_S3SK200,	BOARD_S3SK1000,
		BOARD_S3ESK500,	BOARD_S3ESK1600,
		BOARD_ML505,
		BOARD_ML605,
		BOARD_KC705,
		BOARD_VC707,
		BOARD_ZEDBOARD,
		BOARD_DE0,
		BOARD_DE4,
		BOARD_DE5,
		BOARD_S2GXAV
	);
	
	type T_BOARD_ETHERNET_DESC is record
		IPStyle										: T_BOARD_CONFIG_STRING;
		RS_DataInterface					: T_BOARD_CONFIG_STRING;
		PHY_Device								: T_BOARD_CONFIG_STRING;
		PHY_DeviceAddress					: T_SLV_8;
		PHY_DataInterface					: T_BOARD_CONFIG_STRING;
		PHY_ManagementInterface		: T_BOARD_CONFIG_STRING;
	end record;

	type T_BOARD_DESCRIPTION is record
		FPGADevice	: T_BOARD_CONFIG_STRING;
		Ethernet		: T_BOARD_ETHERNET_DESC;
	
	end record;

	type T_BOARD_DESCRIPTION_VECTOR	is array (T_BOARD) of T_BOARD_DESCRIPTION;


	-- Functions extracting board and PCB properties from "MY_BOARD"
	-- which is declared in package "my_config".
	-- ===========================================================================
	function MY_DEVICE_STRING(BoardConfig : string := C_BOARD_STRING_EMPTY) return string;
	function MY_BOARD_STRUCT(BoardConfig : string := C_BOARD_STRING_EMPTY)	return T_BOARD_DESCRIPTION;

end;


package body board is

	-- private functions required by board description
	-- ModelSim requires that this functions is defined before it is used below.
	-- ===========================================================================
	function conf(str : string) return T_BOARD_CONFIG_STRING is
	begin
		return resize(str, T_BOARD_CONFIG_STRING'length);
	end function;

	-- board description
	-- ===========================================================================
	CONSTANT C_BOARD_DESCRIPTION_LIST		: T_BOARD_DESCRIPTION_VECTOR		:= (
		BOARD_S3SK200 => (
			FPGADevice									=> conf("XC3S200FT256"),														-- XC2S200FT256
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
				BOARD_S3SK1000 => (
			FPGADevice									=> conf("XC3S1000FT256"),														-- XC2S200FT256
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
				BOARD_S3ESK500 => (
			FPGADevice									=> conf("XC3S500EFT256"),														-- XC2S200FT256
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		BOARD_S3ESK1600 => (
			FPGADevice									=> conf("XC3S1600EFT256"),														-- XC2S200FT256
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		BOARD_ML505 => (
			FPGADevice									=> conf("XC5VLX50T-1FF1136"),												-- XC5VLX50T-1FF1136
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_HARD"),	--SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		BOARD_ML605 => (
			FPGADevice									=> conf("XC6VLX240T-1FF1156"),											-- XC6VLX240T-1FF1156
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),	--HARD"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		BOARD_KC705 => (
			FPGADevice									=> conf("XC7K325T-2FFG900C"),												-- XC7K325T-2FFG900C
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		BOARD_VC707 => (
			FPGADevice									=> conf("XC7VX485T-2FFG1761C"),											-- XC7VX485T-2FFG1761C
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_SGMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		BOARD_ZEDBOARD => (
			FPGADevice									=> conf("XC7Z020-1CLG484"),													-- XC7Z020-1CLG484
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1518"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_RGMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		-- Altera boards
		BOARD_DE0 => (
			FPGADevice									=> conf("EP3C16F484"),															-- EP3C16F484
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		BOARD_DE4 => (
			FPGADevice									=> conf("EP4SGX230KF40C2"),													-- EP4SGX230KF40C2
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		BOARD_DE5 => (
			FPGADevice									=> conf("EP5SGXEA7N2F45C2"),												-- EP5SGXEA7N2F45C2
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		
		BOARD_S2GXAV => (
			FPGADevice									=> conf("EP2SGX90FF1508C3"),												-- EP2SGX90FF1508C3
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		),
		
		-- custom board / dummy entry
		BOARD_CUSTOM => (
			FPGADevice									=> conf("Device is unknown for a custom board"),
			Ethernet => (
				IPStyle										=> conf("IPSTYLE_SOFT"),
				RS_DataInterface					=> conf("NET_ETH_RS_DATA_INTERFACE_GMII"),
				PHY_Device								=> conf("NET_ETH_PHY_DEVICE_MARVEL_88E1111"),
				PHY_DeviceAddress					=> x"07",
				PHY_DataInterface					=> conf("NET_ETH_PHY_DATA_INTERFACE_GMII"),
				PHY_ManagementInterface		=> conf("NET_ETH_PHY_MANAGEMENT_INTERFACE_MDIO")
			)
		)
	);


	-- public functions
	-- ===========================================================================
	-- TODO: comment
	function MY_BOARD_STRUCT(BoardConfig : string := C_BOARD_STRING_EMPTY) return T_BOARD_DESCRIPTION is
		constant MY_BRD : T_BOARD_CONFIG_STRING := ite((BoardConfig /= C_BOARD_STRING_EMPTY), conf(BoardConfig), conf(MY_BOARD));
  begin
		for i in T_BOARD loop
			if str_imatch("BOARD_" & str_trim(MY_BRD), t_board'image(i)) then
				return  C_BOARD_DESCRIPTION_LIST(i);
			end if;
		end loop;

		report "Unknown board name in MY_BOARD = " & MY_BRD & "." severity failure;
		-- return statement is explicitly missing otherwise XST won't stop
	end function;

	-- TODO: comment
	function MY_DEVICE_STRING(BoardConfig : string := C_BOARD_STRING_EMPTY) return string is
		constant BRD_STRUCT	: T_BOARD_DESCRIPTION := MY_BOARD_STRUCT(BoardConfig);
  begin
		return BRD_STRUCT.FPGADevice(1 to 32);
	end function;
end package body;