// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metrics_define_domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetricsDefineDomain _$MetricsDefineDomainFromJson(Map<String, dynamic> json) =>
    MetricsDefineDomain(
      metricsLevel1Name: json['metricsLevel1Name'] as String,
      metricsLevel1Code: json['metricsLevel1Code'] as String,
      metricsLevel2Name: json['metricsLevel2Name'] as String,
      metricsLevel2Code: json['metricsLevel2Code'] as String,
      metricsLevel3Name: json['metricsLevel3Name'] as String,
      metricsLevel3Code: json['metricsLevel3Code'] as String,
      metricsName: json['metricsName'] as String,
      metricsCode: json['metricsCode'] as String,
      metricsType: json['metricsType'] as String,
      metricsTypeName: json['metricsTypeName'] as String,
      metricsUnit: json['metricsUnit'] as String,
      metricsUnitName: json['metricsUnitName'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$MetricsDefineDomainToJson(
        MetricsDefineDomain instance) =>
    <String, dynamic>{
      'metricsLevel1Name': instance.metricsLevel1Name,
      'metricsLevel1Code': instance.metricsLevel1Code,
      'metricsLevel2Name': instance.metricsLevel2Name,
      'metricsLevel2Code': instance.metricsLevel2Code,
      'metricsLevel3Name': instance.metricsLevel3Name,
      'metricsLevel3Code': instance.metricsLevel3Code,
      'metricsName': instance.metricsName,
      'metricsCode': instance.metricsCode,
      'metricsType': instance.metricsType,
      'metricsTypeName': instance.metricsTypeName,
      'metricsUnit': instance.metricsUnit,
      'metricsUnitName': instance.metricsUnitName,
      'id': instance.id,
    };
