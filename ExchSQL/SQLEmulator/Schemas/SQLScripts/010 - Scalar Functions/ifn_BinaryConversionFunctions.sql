--/////////////////////////////////////////////////////////////////////////////
--// Filename		: ifn_BinaryConversionFunctions.sql
--// Author		: 
--// Date		: 
--// Copyright Notice	: (c) 2015 Advanced Business Software & Solutions Ltd. All rights reserved.
--// Description	: SQL Script to add binary-conversion functions
--//
--/////////////////////////////////////////////////////////////////////////////
--// Version History:
--//	1	: File Creation
--//    2   : 2 July 2014 - C Sandow - Added IRIS.ExchequerSQL.ClrExtensions (missing from repository version)
--//    3   : 24/08/2015 - P Rutherford - Amended IRIS.ExchequerSQL.ClrExtensions (ABSEXCH-13479)
--/////////////////////////////////////////////////////////////////////////////

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* ================================================================
   Description:	GetString - Used for converting Binary to VarChar
   based on length byte
   ================================================================ */
DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[GetString]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	SET @SQL = 'CREATE FUNCTION [Common].[GetString]
(
	-- Parameters for the function
	@p1		VarBinary(100),
	@p2		Int
)
RETURNS VarChar(100)
AS
BEGIN
	-- Return variable
	DECLARE @Result VarChar(100)

	-- T-SQL statements to compute the return value
	SELECT @Result = CAST(SUBSTRING(@p1, (@p2 + 1), CAST(SUBSTRING(@p1, @p2,1) AS INT)) AS VARCHAR(100))

	-- Return the result of the function
	RETURN @Result

END'
END

EXEC (@SQL)
GO

/* ==============================================================================
   Description:	IRIS.ExchequerSQLDW.Conversions - Assembly & Function for various
  												  String & Numeric conversions.
   ============================================================================== */

DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.assembly_files where name  = 'IRIS.ExchequerSQLDW.Conversions' )
BEGIN

	SET @SQL = 'CREATE ASSEMBLY [IRIS.ExchequerSQLDW.Conversions]
AUTHORIZATION [dbo]
FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C01030023497B480000000000000000E0000E210B0108000012000000080000000000004E300000002000000040000000004000002000000002000004000000000000000400000000000000008000000002000000000000030040050000100000100000000010000010000000000000100000000000000000000000F42F000057000000004000009004000000000000000000000000000000000000006000000C000000E82E00001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E7465787400000054100000002000000012000000020000000000000000000000000000200000602E7273726300000090040000004000000006000000140000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000001A000000000000000000000000000040000042000000000000000000000000000000003030000000000000480000000200050050230000980B0000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000026020304280A0000062A220203280B0000062A220203280C0000062A220203280E0000062A220203280F0000062A22020328100000062A1E0228110000062A1E0228120000062A1E02281100000A2A00133005004A00000001000011032D067E1200000A2A7E1200000A0A731300000A0B160C0304590D041304160C2B1907021104251758130491281400000A6F1500000A260817580C080931E3076F1600000A0A140B062A0000133004002F00000002000011160A1A8D160000010B030C160D030C2B0E07090208919C0917580D0817580C08031A5832EC0716281700000A0A062A00133004003000000003000011166A0A1E8D160000010B030C160D030C2B0E07090208919C0917580D0817580C08031E5832EC0716281800000A0A062A133005002500000004000011188D160000010A160B2B0C060702070358919C0717580B071832F00616281900000A0C082A00000013300500A900000005000011028E691C3F960000001C8D160000010A160B2B0C060702070358919C0717580B071C32F00616280D0000060C0618280D0000060D061A280D0000061304166A13050820FF0000005F130611062C49110420008000005F6A1F3062130511051106207E030000586A1F34626013051105110420FF7F00005F6A1F25626013051105096E1F15626013051105082000FF00005F6A1B626013051105281A00000A2A23000000000000F0BF2A220203281B00000A2A220203281C00000A2A1E02281D00000A2A0013300400CF00000006000011160A1A8D160000010B026F1E00000A26188D180000010C1A8D180000010D1A8D1300000113041613052B321105185D2D0D08160211056F1F00000A9D2B1908170211056F1F00000A9D11040608732000000AA20617580A11051758130511051E32C9160A110413071613082B1F110711089A2607061104069A1F10281B00000AD29C0617580A110817581308110811078E6932D9160A07130916130A2B1B1109110A91130609061106281400000A9D0617580A110A1758130A110A11098E6932DD09732000000A1F10281B00000A2A0042534A4201000100000000000C00000076322E302E35303732370000000005006C0000004C040000237E0000B80400006804000023537472696E67730000000020090000080000002355530028090000100000002347554944000000380900006002000023426C6F620000000000000002000001471502000900000000FA0133001600000100000018000000030000001200000020000000200000001500000006000000010000000200000000000A0001000000000006007D0076000600A50193010600BC0193010600D90193010600F801930106001102930106002A0293010600450293010600600293010600980279020600AC0279020600BA0293010600D302930106000303F0023B00170300000600460326030600660326030A00AB0390030600C00376000600D903CD030600E703760006000604760006000B0476000600580476000000000001000000000001000100010010002E003E00050001000100810110005E003E00050001000A00502000000000960084000A0001005A20000000009600A500120004006320000000009600B900190006006C20000000009600CD00200008007520000000009600E80027000A007E2000000000960004012D000C008720000000009600200133000E008F20000000009600380139000F0097200000000086185C013E001000A02000000000960084000A001000F820000000009600A500120013003421000000009600B900190015007021000000009600620142001700A421000000009600CD00200019005922000000009600E80027001B00622200000000960004012D001D006B22000000009600200133001F007422000000009600380139002000000001007701000002007D01000003008801000001007701000002008801000001007701000002008801000001007701000002008801000001007701000002008E01000001007701000002008E01000001007701000001007701000001007701000002007D01000003008801000001007701000002008801000001007701000002008801000001007701000002008801000001007701000002008801000001007701000002008E01000001007701000002008E0100000100770100000100770111005C01490019005C01490021005C01490029005C01490031005C01490039005C01490041005C01490049005C01490051005C014E0059005C01490061005C01490069005C01490071005C01530081005C01590089005C013E0091005C013E0009005C013E009900C703EF00A1005C013E00A900EF03F200A100F603F7000900FD03FD00B90018041200B90020041900B90028044200B90031042101A90018043101A900FD032D00B9004304330099004C04370199005D043C0199005C014101200083005E002E001B00B7012E002300BD012E007B0040022E000B005B012E00130080012E004B00B7012E00730037022E003300D1012E003B00B7012E002B005B012E005300F7012E00630021022E006B002E02400083005E00600083005E00800083005E00A00083005E00C00083005E00E00083005E00000183005E0001010A0112011A01260147010480000001000600000001000000000000003E00000002000000000000000000000001006D0000000000020000000000000000000000010084030000000000000000003C4D6F64756C653E00495249532E45786368657175657253514C44572E436F6E76657273696F6E732E646C6C0053514C434C5246756E6374696F6E7300495249532E45786368657175657253514C44572E436F6E76657273696F6E73004669656C64436F6E766572746572006D73636F726C69620053797374656D004F626A65637400436F6E7665727444656C706869537472696E674279746573546F537472696E6700436F6E766572744279746573546F496E74333200436F6E766572744279746573546F496E74363400436F6E766572745265616C34384279746573546F446F75626C6500436F6E76657274456E636F646564537472696E67546F496E74333200436F6E76657274496E743332546F456E636F646564537472696E6700436F6E76657274496E743332546F42797465417272617900436F6E766572744153434949456E636F646564486578537472696E67546F496E743332002E63746F7200436F6E766572744279746573546F55496E74313600496E707574004C656E6774684279746500537461727400426173650053797374656D2E5265666C656374696F6E00417373656D626C795469746C6541747472696275746500417373656D626C794465736372697074696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C79436F6D70616E7941747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C7954726164656D61726B41747472696275746500417373656D626C7943756C747572654174747269627574650053797374656D2E52756E74696D652E496E7465726F70536572766963657300436F6D56697369626C65417474726962757465004775696441747472696275746500417373656D626C7956657273696F6E41747472696275746500417373656D626C7946696C6556657273696F6E4174747269627574650053797374656D2E446961676E6F73746963730044656275676761626C6541747472696275746500446562756767696E674D6F6465730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300436F6D70696C6174696F6E52656C61786174696F6E734174747269627574650052756E74696D65436F6D7061746962696C6974794174747269627574650053797374656D2E44617461004D6963726F736F66742E53716C5365727665722E5365727665720053716C46756E6374696F6E41747472696275746500537472696E6700456D7074790053797374656D2E5465787400537472696E674275696C64657200436F6E7665727400546F4368617200417070656E6400546F537472696E67004279746500426974436F6E76657274657200546F496E74333200546F496E74363400546F55496E74313600496E74363442697473546F446F75626C6500476574427974657300546F4368617241727261790043686172006765745F43686172730000000320000000000084D8F2149514AD41B9D1B790C6E9A1610008B77A5C561934E0890700030E1D050508060002081D05080600020A1D05080600020D1D0508050002080E050500020E08080500011D0508040001080E03200001060002071D0508042001010E042001010205200101113D0420010108808F010001005455794D6963726F736F66742E53716C5365727665722E5365727665722E446174614163636573734B696E642C2053797374656D2E446174612C2056657273696F6E3D322E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038390A446174614163636573730000000002060E04000103050520011251030320000E0807050E1251080808070704081D0508080707040A1D0508080607031D0508070400010D0A0A07071D05080707070A08050002080E080420001D030420010308052001011D0313070B081D051D031D031D0E08051D0E081D05082401001F495249532E45786368657175657253514C44572E436F6E76657273696F6E7300003601003148656C7065722066756E6374696F6E7320666F7220616363657373696E67204578636865717565722053514C206461746100000501000000001301000E495249532047726F7570204C7464000025010020436F7079726967687420C2A920495249532047726F7570204C7464203230303800002901002462663530653639622D616465372D346333392D383139662D61646364336233326666633800000C010007312E362E302E3100000801000200000000000801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F777301000000000023497B480000000002000000EF000000042F00000411000052534453241F8B06BF892D4E95A2CF4E75A9B59A01000000433A5C446F63756D656E747320616E642053657474696E67735C6173776565746D616E5C4D7920446F63756D656E74735C56697375616C2053747564696F20323030355C50726F6A656374735C45786368657175657253514C4461746157617265686F7573655C495249532E45786368657175657253514C44572E436F6E76657273696F6E735C495249532E45786368657175657253514C44572E436F6E76657273696F6E735C6F626A5C52656C656173655C495249532E45786368657175657253514C44572E436F6E76657273696F6E732E70646200001C30000000000000000000003E300000002000000000000000000000000000000000000000000000303000000000000000000000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF2500204000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100100000001800008000000000000000000000000000000100010000003000008000000000000000000000000000000100000000004800000058400000380400000000000000000000380434000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100060001000100000006000100010000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B00498030000010053007400720069006E006700460069006C00650049006E0066006F0000007403000001003000300030003000300034006200300000007C003200010043006F006D006D0065006E00740073000000480065006C007000650072002000660075006E006300740069006F006E007300200066006F007200200061006300630065007300730069006E00670020004500780063006800650071007500650072002000530051004C0020006400610074006100000040000F00010043006F006D00700061006E0079004E0061006D0065000000000049005200490053002000470072006F007500700020004C007400640000000000680020000100460069006C0065004400650073006300720069007000740069006F006E000000000049005200490053002E00450078006300680065007100750065007200530051004C00440057002E0043006F006E00760065007200730069006F006E0073000000300008000100460069006C006500560065007200730069006F006E000000000031002E0036002E0030002E003100000068002400010049006E007400650072006E0061006C004E0061006D006500000049005200490053002E00450078006300680065007100750065007200530051004C00440057002E0043006F006E00760065007200730069006F006E0073002E0064006C006C0000006400200001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A900200049005200490053002000470072006F007500700020004C00740064002000320030003000380000007000240001004F0072006900670069006E0061006C00460069006C0065006E0061006D006500000049005200490053002E00450078006300680065007100750065007200530051004C00440057002E0043006F006E00760065007200730069006F006E0073002E0064006C006C000000600020000100500072006F0064007500630074004E0061006D0065000000000049005200490053002E00450078006300680065007100750065007200530051004C00440057002E0043006F006E00760065007200730069006F006E0073000000340008000100500072006F006400750063007400560065007200730069006F006E00000031002E0036002E0030002E003100000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0036002E0030002E00310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000C000000503000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
WITH PERMISSION_SET = SAFE'

END
EXEC (@SQL)
GO

/* ==============================================================================
   Description:	IRIS.ExchequerSQL.ClrExtensions - Reporting CLR Extension
   ============================================================================== */

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[ifn_Report_TrialBalance_GetHiCodeComputedValue]' ))
BEGIN
   DROP FUNCTION [common].[ifn_Report_TrialBalance_GetHiCodeComputedValue]
END
go

IF  EXISTS (SELECT * FROM sys.assembly_files where name  = 'IRIS.ExchequerSQL.ClrExtensions' )
BEGIN
  DROP ASSEMBLY [IRIS.ExchequerSQL.ClrExtensions]
END
GO

DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.assembly_files where name  = 'IRIS.ExchequerSQL.ClrExtensions' )
BEGIN

	SET @SQL = 'CREATE ASSEMBLY [IRIS.ExchequerSQL.ClrExtensions]
	AUTHORIZATION [dbo]
	FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C0103005FFEDA550000000000000000E00002210B010B000010000000080000000000007E2E0000002000000040000000004000002000000002000004000000000000000400000000000000008000000002000000000000030040850000100000100000000010000010000000000000100000000000000000000000282E000053000000004000007804000000000000000000000000000000000000006000000C000000642D00001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E74657874000000840E0000002000000010000000020000000000000000000000000000200000602E7273726300000078040000004000000006000000120000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000001800000000000000000000000000004000004200000000000000000000000000000000602E0000000000004800000002000500082300005C0A00000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000133005003F0000000100001100026F1000000A185B0A068D130000010B160C2B1A0007080208185A186F1100000A1F10281200000A9C000817580C0806FE04130411042DDC070D2B00092A00133003004C0000000200001100028E69185A731300000A0A00020D1613042B20091104910B000612017201000070281400000A6F1500000A26001104175813041104098E69FE04130511052DD3066F1600000A0C2B00082A133003001C0000000300001100027209000070026F1000000A6F1700000A281800000A0A2B00062A13300600D50100000500001100036F1A00000A1001046F1A00000A1002161F28731B00000A0A0516FE010C082D0C0672170000706F1500000A26036F1000000A16FE02046F1000000A16FE025F16FE010C082D10000672310000706F1500000A26002B3E036F1000000A16FE0216FE010C082D10000672310000706F1500000A26002B1E046F1000000A16FE0216FE010C082D0E000672370000706F1500000A26000602281C00000A281D00000A723D0000707E1E00000A6F1F00000A6F1500000A26036F1000000A16FE02046F1000000A16FE025F16FE010C082D5D0006732000000A036F2100000A281D00000A723D0000707E1E00000A6F1F00000A28030000067241000070732000000A046F2100000A281D00000A723D0000707E1E00000A6F1F00000A2803000006282200000A6F1500000A26002B7C036F1000000A16FE0216FE010C082D2F0006732000000A036F2100000A281D00000A723D0000707E1E00000A6F1F00000A28030000066F1500000A26002B3D046F1000000A16FE0216FE010C082D2D0006732000000A046F2100000A281D00000A723D0000707E1E00000A6F1F00000A28030000066F1500000A2600067247000070161F28066F2300000A596F1100000A6F1500000A26066F1600000A28010000060B2B00072A1E02282400000A2A00000042534A4201000100000000000C00000076322E302E35303732370000000005006C000000F0020000237E00005C030000E803000023537472696E677300000000440700009C00000023555300E0070000100000002347554944000000F00700006C02000023426C6F620000000000000002000001471502000900000000FA2533001600000100000019000000030000000500000007000000240000000E00000005000000010000000200000000000A0001000000000006007D00760006002A01180106004101180106005E01180106007D0118010600960118010600AF0118010600CA0118010600E501180106001D02FE0106003102FE0106003F0218010600580218010600880275023B009C0200000600CB02AB020600EB02AB0206000903760006001B03760006002A0376000600450339030A00910376030600AB0376000600CF0339030600DD0339030000000001000000000001000100810110002E003D00050001000100010010005D003D00050001000300502000000000960084000A0001009C20000000009600990010000200F420000000009100AE00160003001C21000000009600BE001B000400FD22000000008618D5002400080000000100DB0000000100DB0000000100E10000000100EC0000000200F800000003000301000004000E011100D50028001900D50028002100D50028002900D50028003100D50028003900D50028004100D50028004900D50028005100D5002D005900D50028006100D50028006900D50028007100D50032008100D50038008900D5002400910010033D00910020034100A10032034700A900D5003800990053035700A9005C035C00090053036200910020037100910063037600B100D50024009100A6036200A900D5005001B900B8035601B900530310009100C10380009100C7035C01C100D5002400C900B8036201910063036801A90010033D000900D50024002E003300DC012E000B0077012E0013009C012E001B00C2012E002300C8012E002B0077012E00530003022E003B00C2012E004B00C2012E006B003A022E007B004C022E0063002D022E00730043028000CB0083004D0066007C0080006F010480000001000000000000000000000000003D00000002000000000000000000000001006D000000000002000000000000000000000001006A03000000000000003C4D6F64756C653E00495249532E45786368657175657253514C2E436C72457874656E73696F6E732E646C6C004669656C64436F6E76657274657200495249532E45786368657175657253514C2E436C72457874656E73696F6E730053514C434C5246756E6374696F6E73006D73636F726C69620053797374656D004F626A65637400436F6E76657274537472696E67546F427974657300436F6E766572744279746573546F537472696E6700506164434344657074537472696E67004765744869436F6465436F6D707574656456616C7565002E63746F720076616C756500636344657074436F6465006E6F6D696E616C436F646500636F737443656E747265006465706172746D656E7400636F6D6D69747465640053797374656D2E5265666C656374696F6E00417373656D626C795469746C6541747472696275746500417373656D626C794465736372697074696F6E41747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C79436F6D70616E7941747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C7954726164656D61726B41747472696275746500417373656D626C7943756C747572654174747269627574650053797374656D2E52756E74696D652E496E7465726F70536572766963657300436F6D56697369626C65417474726962757465004775696441747472696275746500417373656D626C7956657273696F6E41747472696275746500417373656D626C7946696C6556657273696F6E4174747269627574650053797374656D2E446961676E6F73746963730044656275676761626C6541747472696275746500446562756767696E674D6F6465730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300436F6D70696C6174696F6E52656C61786174696F6E734174747269627574650052756E74696D65436F6D7061746962696C69747941747472696275746500537472696E67006765745F4C656E677468004279746500537562737472696E6700436F6E7665727400546F427974650053797374656D2E5465787400537472696E674275696C64657200546F537472696E6700417070656E6400436F6E6361740053797374656D2E44617461004D6963726F736F66742E53716C5365727665722E5365727665720053716C46756E6374696F6E417474726962757465005472696D00426974436F6E76657274657200476574427974657300456D707479005265706C616365004153434949456E636F64696E6700456E636F64696E670000000007580030003200000D320030003200300032003000001934003300340044003500340030003200300032003200310000053400330000053400340000032D000105300032000051320030003200300032003000320030003200300032003000320030003200300032003000320030003200300032003000320030003200300032003000320030003200300032003000320030003200300000000000EE564B042307384C9690AED0D5FDF8D70008B77A5C561934E0890500011D050E0500010E1D050400010E0E0800041D05080E0E0203200001042001010E042001010205200101113D0420010108032000080520020E0808050002050E08090705081D05081D05020420010E0E05200112550E0320000E0A07061255050E1D0508020420010E080500020E0E0E0307010E02060E80CB010003005455794D6963726F736F66742E53716C5365727665722E5365727665722E446174614163636573734B696E642C2053797374656D2E446174612C2056657273696F6E3D322E302E302E302C2043756C747572653D6E65757472616C2C205075626C69634B6579546F6B656E3D623737613563353631393334653038390A446174614163636573730000000054020F497344657465726D696E697374696301540E044E616D652169666E5F5265706F72745F4765744869436F6465436F6D707574656456616C75650520020108080500011D05080520020E0E0E0520011D050E0600030E0E0E0E07070312551D05022401001F495249532E45786368657175657253514C2E436C72457874656E73696F6E73000025010020436C7220657874656E73696F6E7320666F72204578636865717565722053514C00000501000000001301000E497269732047726F7570204C7464000026010021436F7079726967687420C2A92020497269732047726F7570204C7464203230313100002901002434633261313964612D363666342D346465612D613031302D66346230343037393132616400000C010007312E302E302E3000000801000701000000000801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F77730100000000005FFEDA550000000002000000A6000000802D0000800F00005253445366AA5F24509CEA49B4A3F8786DE64B9601000000433A5C7466735C56375C4578636853514C5C53514C456D756C61746F725C536368656D61735C53514C536372697074735C434C525C536F75726365436F64655C495249532E45786368657175657253514C2E436C72457874656E73696F6E735C6F626A5C44656275675C495249532E45786368657175657253514C2E436C72457874656E73696F6E732E706462000000502E000000000000000000006E2E0000002000000000000000000000000000000000000000000000602E000000000000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF25002040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000018000080000000000000000000000000000001000100000030000080000000000000000000000000000001000000000048000000584000001C04000000000000000000001C0434000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000001000000000000000100000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B0047C030000010053007400720069006E006700460069006C00650049006E0066006F0000005803000001003000300030003000300034006200300000005C002100010043006F006D006D0065006E0074007300000043006C007200200065007800740065006E00730069006F006E007300200066006F00720020004500780063006800650071007500650072002000530051004C000000000040000F00010043006F006D00700061006E0079004E0061006D0065000000000049007200690073002000470072006F007500700020004C007400640000000000680020000100460069006C0065004400650073006300720069007000740069006F006E000000000049005200490053002E00450078006300680065007100750065007200530051004C002E0043006C00720045007800740065006E00730069006F006E0073000000300008000100460069006C006500560065007200730069006F006E000000000031002E0030002E0030002E003000000068002400010049006E007400650072006E0061006C004E0061006D006500000049005200490053002E00450078006300680065007100750065007200530051004C002E0043006C00720045007800740065006E00730069006F006E0073002E0064006C006C0000006800210001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A9002000200049007200690073002000470072006F007500700020004C007400640020003200300031003100000000007000240001004F0072006900670069006E0061006C00460069006C0065006E0061006D006500000049005200490053002E00450078006300680065007100750065007200530051004C002E0043006C00720045007800740065006E00730069006F006E0073002E0064006C006C000000600020000100500072006F0064007500630074004E0061006D0065000000000049005200490053002E00450078006300680065007100750065007200530051004C002E0043006C00720045007800740065006E00730069006F006E0073000000340008000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0030002E0030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C000000803E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
	WITH PERMISSION_SET = SAFE'

END
EXEC (@SQL)
GO

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE FUNCTION [common].[ifn_Report_TrialBalance_GetHiCodeComputedValue](@intNominalCode [int], @strCostCentre [nvarchar](3), @strDepartment [nvarchar](3), @bitCommitted [bit])
RETURNS [varbinary](8000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [IRIS.ExchequerSQL.ClrExtensions].[IRIS.ExchequerSQL.ClrExtensions.SQLCLRFunctions].[GetHiCodeComputedValue]
GO

/* ================================================================================================== */

DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[EntDouble]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	SET @SQL = 'CREATE FUNCTION [Common].[EntDouble]
(
	-- Parameters for the function
	@input	varbinary(100), 
	@Start	int
)
RETURNS float(53) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [IRIS.ExchequerSQLDW.Conversions].[IRIS.ExchequerSQLDW.Conversions.SQLCLRFunctions].ConvertReal48BytesToDouble'
END
EXEC (@SQL)
GO

/* =================================================================
   Description:	EntDoubleRecType1 - Used for verifying Quantity Used
                                    for EntDouble Conversion 
   ================================================================= */

DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[EntDoubleRecType1]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	SET @SQL = 'CREATE FUNCTION [Common].[EntDoubleRecType1] 
				(
					-- Parameters for the function
					@p1		VarBinary(12),
					@p2		VarBinary(5),
					@rt1	VarChar(1),
					@st1	int)
				RETURNS float
				AS
				BEGIN
					-- Return variable
					DECLARE @Result float
					SET @Result = 0

					-- T-SQL statements to compute the return value
					IF (@rt1 = ' + CHAR(39) + 'B' + CHAR(39) + ' AND @st1 = 77)
					BEGIN
					SELECT @Result = common.EntDouble(SUBSTRING(@p1, 12, 1) + @p2, 0)
					END

					-- Return the result of the function
					RETURN @Result

				END'
END
EXEC (@SQL)
GO

/* ================================================================
   Description:	EntDoubleRecType2 - Used for verifying Settle Value
                                    for EntDouble Conversion 
   ================================================================ */

DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[EntDoubleRecType2]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	SET @SQL = 'CREATE FUNCTION [Common].[EntDoubleRecType2] 
				(
					-- Parameters for the function
					@p1		VarBinary(12),
					@p2		VarBinary(5),
					@rt1	VarChar(1),
					@st1	int)
				RETURNS float
				AS
				BEGIN
					-- Return variable
					DECLARE @Result float
					SET @Result = 0

					-- T-SQL statements to compute the return value
					IF (@rt1 = ' + CHAR(39) + 'T' + CHAR(39) + ' AND @st1 = 80)
					BEGIN
					SELECT @Result = common.EntDouble(SUBSTRING(@p1, 12, 1) + @p2, 0)
					END

					-- Return the result of the function
					RETURN @Result

				END'
END
EXEC (@SQL)
GO

/* ============================================================
   Description:	GetFolio - Used for converting Reverse Hex 
                           String to Integer
   ============================================================ */

DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[GetFolio]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	SET @SQL = 'CREATE FUNCTION [Common].[GetFolio]
				(
					@Input		varbinary(20), 
					@Start		int
				)
				RETURNS [int] 
				WITH EXECUTE AS CALLER
				AS 
				EXTERNAL NAME [IRIS.ExchequerSQLDW.Conversions].[IRIS.ExchequerSQLDW.Conversions.SQLCLRFunctions].[ConvertBytesToInt32]'
END
EXEC (@SQL)
GO

/* ============================================================
   Description:	GetCompLineNo - Used for converting Hex String
                                to Integer
   ============================================================ */

DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[GetCompLineNo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	SET @SQL = 'CREATE FUNCTION [Common].[GetCompLineNo] 
(
	@input	nvarchar(10), 
	@Base	tinyint
)
RETURNS [int]
WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [IRIS.ExchequerSQLDW.Conversions].[IRIS.ExchequerSQLDW.Conversions.SQLCLRFunctions].[ConvertEncodedStringToInt32]'
END
EXEC (@SQL)
GO

/* ================================================================
   Description:	EntCompLineNo - Used for verifying Settle Value
                                    for GetCompLineNo Conversion 
   ================================================================ */

DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[EntCompLineNo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	SET @SQL = 'CREATE FUNCTION [Common].[EntCompLineNo] 
				(
					-- Parameters for the function
					@p1		VarChar(10),
					@p2		tinyint,
					@rt1	VarChar(1),
					@st1	int)
				RETURNS float
				AS
				BEGIN
					-- Return variable
					DECLARE @Result float

					-- T-SQL statements to compute the return value
					IF (@rt1 = ' + CHAR(39) + 'T' + CHAR(39) + ' AND @st1 = 80)
					BEGIN
					SELECT @Result = common.GetCompLineNo(@p1, @p2)
					END

					-- Return the result of the function
					RETURN @Result

				END'
END
EXEC (@SQL)
GO


DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[ConvertInt32ToByteArray]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	SET @SQL = 'CREATE FUNCTION [Common].[ConvertInt32ToByteArray]
				(
					@input		int
				)
				RETURNS [varbinary](4) 
				WITH EXECUTE AS CALLER
				AS
				EXTERNAL NAME [IRIS.ExchequerSQLDW.Conversions].[IRIS.ExchequerSQLDW.Conversions.SQLCLRFunctions].[ConvertInt32ToByteArray]'
END
EXEC (@SQL)
GO


DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[ConvertASCIIEncodedHexStringToInt32]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	SET @SQL = 'CREATE FUNCTION [Common].[ConvertASCIIEncodedHexStringToInt32]
				(
					@input		nvarchar(50)
				)
				RETURNS [int] 
				WITH EXECUTE AS CALLER
				AS
				EXTERNAL NAME [IRIS.ExchequerSQLDW.Conversions].[IRIS.ExchequerSQLDW.Conversions.SQLCLRFunctions].[ConvertASCIIEncodedHexStringToInt32]'
END
EXEC (@SQL)
GO


DECLARE @SQL varchar(max)

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Common].[EntDocSign]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	SET @SQL = 'CREATE FUNCTION [common].[EntDocSign] 
				(
					@DocType INT
				)
				RETURNS INT
				AS
				BEGIN
					-- Return variable
					DECLARE @DocSign INT
					
					SET @DocSign = 1

					SET @DocSign = CASE @DocType
										WHEN 0 THEN -1
										WHEN 1 THEN 1
										WHEN 2 THEN 1
										WHEN 3 THEN -1
										WHEN 4 THEN 1
										WHEN 5 THEN 1
										WHEN 6 THEN -1
										WHEN 7 THEN -1
										WHEN 8 THEN -1
										WHEN 9 THEN -1
										WHEN 10 THEN -1
										WHEN 11 THEN 1
										WHEN 12 THEN 1
										WHEN 13 THEN -1
										WHEN 14 THEN 1
										WHEN 15 THEN 1
										WHEN 16 THEN -1
										WHEN 17 THEN -1
										WHEN 18 THEN 1
										WHEN 19 THEN -1
										WHEN 20 THEN -1
										WHEN 21 THEN 1
										WHEN 22 THEN 1
										WHEN 23 THEN 1
										WHEN 24 THEN 1
										WHEN 25 THEN -1
										WHEN 26 THEN 1
										WHEN 27 THEN 1
										WHEN 28 THEN 1
										WHEN 29 THEN -1
										WHEN 30 THEN 1
										WHEN 31 THEN 1
										WHEN 32 THEN 1
										WHEN 33 THEN 1
										WHEN 34 THEN 1
										WHEN 35 THEN 1
										WHEN 36 THEN 1
										WHEN 37 THEN 1
										WHEN 38 THEN 1
										WHEN 39 THEN 1
										WHEN 40 THEN -1
										WHEN 41 THEN 1
										WHEN 42 THEN 1
										WHEN 43 THEN -1
										WHEN 44 THEN -1
										WHEN 45 THEN 1
										WHEN 46 THEN 1
										WHEN 47 THEN -1
										WHEN 48 THEN 1
										WHEN 49 THEN -1
										WHEN 50 THEN 1
									 END
					
					IF @DocSign IS NULL
					BEGIN
						SET @DocSign = 1
					END						

					-- Return the result of the function
					RETURN @DocSign

				END'
END
EXEC (@SQL)
GO
