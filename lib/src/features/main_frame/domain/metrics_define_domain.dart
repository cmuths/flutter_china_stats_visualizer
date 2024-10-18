/// 指标原始数据
class MetricsDefineDomain{
   final String metricsEvel1Name;
   final String metricsLevel1Code;
   final String metricsLevel2Name;
   final String metricsLevel2Code;
   final String metricsLevel3Name;
   final String metricsLevel3Code;
   final String metricsName;
   final String metricsCode;
   final String metricsType;
   final String metricsTypeName;
   final String metricsUnit;
   final String metricsUnitName;

   MetricsDefineDomain(
      this.metricsEvel1Name,
      this.metricsLevel1Code,
      this.metricsLevel2Name,
      this.metricsLevel2Code,
      this.metricsLevel3Name,
      this.metricsLevel3Code,
      this.metricsName,
      this.metricsCode,
      this.metricsType,
      this.metricsTypeName,
      this.metricsUnit,
      this.metricsUnitName);
}

enum MetricsTypeEnum{
   ZS("ZS","指数"),
   BFB("BFB","百分比"),
   SZ("SZ","数值");

   const MetricsTypeEnum(this.type,this.name);
   final String type;
   final String name;

   static MetricsTypeEnum getByType(String type) => MetricsTypeEnum.values.firstWhere((enums)=>enums.type == type);
   static MetricsTypeEnum getByName(String name) => MetricsTypeEnum.values.firstWhere((enums)=>enums.name == name);
}



