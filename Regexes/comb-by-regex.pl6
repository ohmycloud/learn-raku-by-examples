.comb(/record\.get\(\"\w+\"\))> \s+/)[0].say for $=finish.lines;

=finish
    if (record.get("vin")                       != null) s.vin                      = record.get("vin").toString
    if (record.get("timestamp")                 != null) s.timestamp                = record.get("timestamp").toString.toLong
    if (record.get("BCS_VehSpd")                != null) s.BCS_VehSpd               = record.get("BCS_VehSpd").toString.toFloat
    if (record.get("VCU_CrntGearLvl")           != null) s.VCU_CrntGearLvl          = record.get("VCU_CrntGearLvl").toString.toInt
    if (record.get("VCU_VehDrvMod")             != null) s.VCU_VehDrvMod            = record.get("VCU_VehDrvMod").toString.toInt
    if (record.get("VCU_EMS_AccPedalActPst")    != null) s.VCU_EMS_AccPedalActPst   = record.get("VCU_EMS_AccPedalActPst").toString.toFloat
    if (record.get("VCU_BrkPedSt")              != null) s.VCU_BrkPedSt             = record.get("VCU_BrkPedSt").toString.toFloat
    if (record.get("BMS_BattSoc")               != null) s.BMS_BattSoc              = record.get("BMS_BattSoc").toString.toFloat
    if (record.get("ICM_TotalOdometer")         != null) s.ICM_TotalOdometer        = record.get("ICM_TotalOdometer").toString.toInt
    if (record.get("DCU_MotTempAct")            != null) s.DCU_MotTempAct           = record.get("DCU_MotTempAct").toString.toInt
    if (record.get("DCU_InvtTempAct")           != null) s.DCU_InvtTempAct          = record.get("DCU_InvtTempAct").toString.toInt
    if (record.get("VCU_WaterTemp2")            != null) s.VCU_WaterTemp2           = record.get("VCU_WaterTemp2").toString.toInt
    if (record.get("VCU_TGW_WaterPump2SpdSet")  != null) s.VCU_TGW_WaterPump2SpdSet = record.get("VCU_TGW_WaterPump2SpdSet").toString.toFloat
    if (record.get("IPS_DCDCTempAct")           != null) s.IPS_DCDCTempAct          = record.get("IPS_DCDCTempAct").toString.toInt
    if (record.get("IPS_DCDCVoltHvAct")         != null) s.IPS_DCDCVoltHvAct        = record.get("IPS_DCDCVoltHvAct").toString.toInt
    if (record.get("IPS_DCDCCurrHvAct")         != null) s.IPS_DCDCCurrHvAct        = record.get("IPS_DCDCCurrHvAct").toString.toFloat
    if (record.get("IPS_DCDCVoltLvAct")         != null) s.IPS_DCDCVoltLvAct        = record.get("IPS_DCDCVoltLvAct").toString.toFloat
    if (record.get("IPS_DCDCCurrLvAct")         != null) s.IPS_DCDCCurrLvAct        = record.get("IPS_DCDCCurrLvAct").toString.toInt
    if (record.get("HVAC_PTCPwrConsmp")         != null) s.HVAC_PTCPwrConsmp        = record.get("HVAC_PTCPwrConsmp").toString.toInt
    if (record.get("HVAC_ECPPwrConsump")        != null) s.HVAC_ECPPwrConsump       = record.get("HVAC_ECPPwrConsump").toString.toInt
    if (record.get("TGW_HVPTCSt")               != null) s.TGW_HVPTCSt              = record.get("TGW_HVPTCSt").toString.toInt
    if (record.get("TGW_HVPTCHVDCCurr")         != null) s.TGW_HVPTCHVDCCurr        = record.get("TGW_HVPTCHVDCCurr").toString.toFloat
    if (record.get("TGW_HVPTCHVVoltage")        != null) s.TGW_HVPTCHVVoltage       = record.get("TGW_HVPTCHVVoltage").toString.toInt
    if (record.get("VCU_TGW_3To2ValveEn")       != null) s.VCU_TGW_3To2ValveEn      = record.get("VCU_TGW_3To2ValveEn").toString.toInt
    if (record.get("VCU_TGW_EmValveEn")         != null) s.VCU_TGW_EmValveEn        = record.get("VCU_TGW_EmValveEn").toString.toInt
    if (record.get("VCU_TGW_WaterPump1En")      != null) s.VCU_TGW_WaterPump1En     = record.get("VCU_TGW_WaterPump1En").toString.toInt
    if (record.get("VCU_TGW_WaterPump1SpdSet")  != null) s.VCU_TGW_WaterPump1SpdSet = record.get("VCU_TGW_WaterPump1SpdSet").toString.toFloat
    if (record.get("DCU_RotSpdAct")             != null) s.DCU_RotSpdAct            = record.get("DCU_RotSpdAct").toString.toInt
    if (record.get("DCU_TorqAct")               != null) s.DCU_TorqAct              = record.get("DCU_TorqAct").toString.toInt
    if (record.get("DCU_VoltAct")               != null) s.DCU_VoltAct              = record.get("DCU_VoltAct").toString.toInt
    if (record.get("DCU_CurrAct")               != null) s.DCU_CurrAct              = record.get("DCU_CurrAct").toString.toInt
    if (record.get("TGW_BattTemp1")             != null) s.TGW_BattTemp1            = record.get("TGW_BattTemp1").toString.toInt
    if (record.get("TGW_BattTemp2")             != null) s.TGW_BattTemp2            = record.get("TGW_BattTemp2").toString.toInt