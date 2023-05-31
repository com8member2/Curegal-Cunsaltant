import 'package:consultation_curegal/generated/json/base/json_convert_content.dart';
import 'package:consultation_curegal/screens/account/model/consultation_category_entity.dart';

ConsultationCategoryEntity $ConsultationCategoryEntityFromJson(Map<String, dynamic> json) {
	final ConsultationCategoryEntity consultationCategoryEntity = ConsultationCategoryEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		consultationCategoryEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		consultationCategoryEntity.name = name;
	}
	final dynamic image = jsonConvert.convert<dynamic>(json['image']);
	if (image != null) {
		consultationCategoryEntity.image = image;
	}
	final int? consultantPersonsId = jsonConvert.convert<int>(json['consultant_persons_id']);
	if (consultantPersonsId != null) {
		consultationCategoryEntity.consultantPersonsId = consultantPersonsId;
	}
	final String? textColour = jsonConvert.convert<String>(json['text_colour']);
	if (textColour != null) {
		consultationCategoryEntity.textColour = textColour;
	}
	final List<ConsultationCategoryData>? data = jsonConvert.convertListNotNull<ConsultationCategoryData>(json['data']);
	if (data != null) {
		consultationCategoryEntity.data = data;
	}
	final bool? isSelected = jsonConvert.convert<bool>(json['isSelected']);
	if (isSelected != null) {
		consultationCategoryEntity.isSelected = isSelected;
	}
	return consultationCategoryEntity;
}

Map<String, dynamic> $ConsultationCategoryEntityToJson(ConsultationCategoryEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['image'] = entity.image;
	data['consultant_persons_id'] = entity.consultantPersonsId;
	data['text_colour'] = entity.textColour;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	data['isSelected'] = entity.isSelected;
	return data;
}

ConsultationCategoryData $ConsultationCategoryDataFromJson(Map<String, dynamic> json) {
	final ConsultationCategoryData consultationCategoryData = ConsultationCategoryData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		consultationCategoryData.id = id;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		consultationCategoryData.createdAt = createdAt;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		consultationCategoryData.name = name;
	}
	final int? consultationCategoryId = jsonConvert.convert<int>(json['consultation_category_id']);
	if (consultationCategoryId != null) {
		consultationCategoryData.consultationCategoryId = consultationCategoryId;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		consultationCategoryData.image = image;
	}
	return consultationCategoryData;
}

Map<String, dynamic> $ConsultationCategoryDataToJson(ConsultationCategoryData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['created_at'] = entity.createdAt;
	data['name'] = entity.name;
	data['consultation_category_id'] = entity.consultationCategoryId;
	data['image'] = entity.image;
	return data;
}