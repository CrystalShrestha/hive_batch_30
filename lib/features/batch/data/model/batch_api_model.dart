import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/batch_entity.dart';

part 'batch_api_model.g.dart';

final batchApiModelProvider = Provider((ref) => BatchApiModel.empty());

@JsonSerializable()
class BatchApiModel {
  @JsonKey(name: '_id')
  final String batchId;
  final String batchName;

  BatchApiModel({
    required this.batchId,
    required this.batchName,
  });

  //Empty costructor
  BatchApiModel.empty()
      : batchId = "",
        batchName = "";

  Map<String, dynamic> toJson() => _$BatchApiModelToJson(this);

  factory BatchApiModel.fromJson(Map<String, dynamic> json) =>
      _$BatchApiModelFromJson(json);

  //Add to Entity conversion same as Batch_Hive_model.dart
  // Convert API Object to Entity
  BatchEntity toEntity() => BatchEntity(
        batchId: batchId,
        batchName: batchName,
      );

  // Convert Entity to Api Object
  BatchApiModel toApiModel(BatchEntity entity) => BatchApiModel(
        //batchId: entity.batchId,
        batchName: entity.batchName, batchId: '',
      );

  // Convert Api List to Entity List
  List<BatchEntity> toEntityList(List<BatchApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  //Add to EntityList conversion
  //Add fromEntity conversion
  @override
  String toString() {
    return 'batchId: $batchId, batchName: $batchName';
  }

  fromEntity(BatchEntity batch) {}
}
