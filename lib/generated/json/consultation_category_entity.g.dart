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
	final dynamic textColour = jsonConvert.convert<dynamic>(json['text_colour']);
	if (textColour != null) {
		consultationCategoryEntity.textColour = textColour;
	}
	final bool? isSelected = jsonConvert.convert<bool>(json['isSelected']);
	if (isSelected != null) {
		consultationCategoryEntity.isSelected = isSelected;
	}
	final List<ConsultationCategoryConsultationSubCategories>? consultationSubCategories = jsonConvert.convertListNotNull<ConsultationCategoryConsultationSubCategories>(json['consultation_sub_categories']);
	if (consultationSubCategories != null) {
		consultationCategoryEntity.consultationSubCategories = consultationSubCategories;
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
	data['isSelected'] = entity.isSelected;
	data['consultation_sub_categories'] =  entity.consultationSubCategories?.map((v) => v.toJson()).toList();
	return data;
}

ConsultationCategoryConsultationSubCategories $ConsultationCategoryConsultationSubCategoriesFromJson(Map<String, dynamic> json) {
	final ConsultationCategoryConsultationSubCategories consultationCategoryConsultationSubCategories = ConsultationCategoryConsultationSubCategories();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		consultationCategoryConsultationSubCategories.id = id;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		consultationCategoryConsultationSubCategories.createdAt = createdAt;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		consultationCategoryConsultationSubCategories.name = name;
	}
	final int? consultationCategoryId = jsonConvert.convert<int>(json['consultation_category_id']);
	if (consultationCategoryId != null) {
		consultationCategoryConsultationSubCategories.consultationCategoryId = consultationCategoryId;
	}
	final dynamic image = jsonConvert.convert<dynamic>(json['image']);
	if (image != null) {
		consultationCategoryConsultationSubCategories.image = image;
	}
	return consultationCategoryConsultationSubCategories;
}

Map<String, dynamic> $ConsultationCategoryConsultationSubCategoriesToJson(ConsultationCategoryConsultationSubCategories entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['created_at'] = entity.createdAt;
	data['name'] = entity.name;
	data['consultation_category_id'] = entity.consultationCategoryId;
	data['image'] = entity.image;
	return data;
}