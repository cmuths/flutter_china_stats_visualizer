import 'dart:isolate';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'metrics_define_domain.g.dart';

/// 指标原始数据
@JsonSerializable()
class MetricsDefineDomain{
    final String metricsLevel1Name;
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
    final int id;

    Map<String, dynamic> toMap() {
        return {
            'metrics_level1_name': this.metricsLevel1Name,
            'metrics_level1_code': this.metricsLevel1Code,
            'metrics_level2_name': this.metricsLevel2Name,
            'metrics_level2_code': this.metricsLevel2Code,
            'metrics_level3_name': this.metricsLevel3Name,
            'metrics_level3_code': this.metricsLevel3Code,
            'metrics_name': this.metricsName,
            'metrics_code': this.metricsCode,
            'metrics_type': this.metricsType,
            'metrics_type_name': this.metricsTypeName,
            'metrics_unit': this.metricsUnit,
            'metrics_unit_name': this.metricsUnitName,
            'id': this.id,
        };
    }

    Map<String, dynamic> toMapWithOutId() {
        return {
            'metrics_level1_name': this.metricsLevel1Name,
            'metrics_level1_code': this.metricsLevel1Code,
            'metrics_level2_name': this.metricsLevel2Name,
            'metrics_level2_code': this.metricsLevel2Code,
            'metrics_level3_name': this.metricsLevel3Name,
            'metrics_level3_code': this.metricsLevel3Code,
            'metrics_name': this.metricsName,
            'metrics_code': this.metricsCode,
            'metrics_type': this.metricsType,
            'metrics_type_name': this.metricsTypeName,
            'metrics_unit': this.metricsUnit,
            'metrics_unit_name': this.metricsUnitName,
        };
    }

    factory MetricsDefineDomain.fromMap(Map<String, dynamic> map) {
        return MetricsDefineDomain(
            metricsLevel1Name: map['metrics_level1_name'] as String,
            metricsLevel1Code: map['metrics_level1_code'] as String,
            metricsLevel2Name: map['metrics_level2_name'] as String,
            metricsLevel2Code: map['metrics_level2_code'] as String,
            metricsLevel3Name: map['metrics_level3_name'] as String,
            metricsLevel3Code: map['metrics_level3_code'] as String,
            metricsName: map['metrics_name'] as String,
            metricsCode: map['metrics_code'] as String,
            metricsType: map['metrics_type'] as String,
            metricsTypeName: map['metrics_type_name'] as String,
            metricsUnit: map['metrics_unit'] as String,
            metricsUnitName: map['metrics_unit_name'] as String,
            id: map['id'] as int,
        );
    }

    const MetricsDefineDomain({
        required this.metricsLevel1Name,
        required this.metricsLevel1Code,
        required this.metricsLevel2Name,
        required this.metricsLevel2Code,
        required this.metricsLevel3Name,
        required this.metricsLevel3Code,
        required this.metricsName,
        required this.metricsCode,
        required this.metricsType,
        required this.metricsTypeName,
        required this.metricsUnit,
        required this.metricsUnitName,
        required this.id
    });

    MetricsDefineDomain copyWith({
        String? metricsLevel1Name,
        String? metricsLevel1Code,
        String? metricsLevel2Name,
        String? metricsLevel2Code,
        String? metricsLevel3Name,
        String? metricsLevel3Code,
        String? metricsName,
        String? metricsCode,
        String? metricsType,
        String? metricsTypeName,
        String? metricsUnit,
        String? metricsUnitName,
        int? id,
    }) {
        return MetricsDefineDomain(
            metricsLevel1Name: metricsLevel1Name ?? this.metricsLevel1Name,
            metricsLevel1Code: metricsLevel1Code ?? this.metricsLevel1Code,
            metricsLevel2Name: metricsLevel2Name ?? this.metricsLevel2Name,
            metricsLevel2Code: metricsLevel2Code ?? this.metricsLevel2Code,
            metricsLevel3Name: metricsLevel3Name ?? this.metricsLevel3Name,
            metricsLevel3Code: metricsLevel3Code ?? this.metricsLevel3Code,
            metricsName: metricsName ?? this.metricsName,
            metricsCode: metricsCode ?? this.metricsCode,
            metricsType: metricsType ?? this.metricsType,
            metricsTypeName: metricsTypeName ?? this.metricsTypeName,
            metricsUnit: metricsUnit ?? this.metricsUnit,
            metricsUnitName: metricsUnitName ?? this.metricsUnitName,
            id: id ?? this.id,
        );
    }


    factory MetricsDefineDomain.fromJson(Map<String,dynamic> json) => _$MetricsDefineDomainFromJson(json);
    Map<String,dynamic> toJson() => _$MetricsDefineDomainToJson(this);


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



