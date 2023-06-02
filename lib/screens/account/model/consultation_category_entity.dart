import 'package:consultation_curegal/generated/json/base/json_field.dart';
import 'package:consultation_curegal/generated/json/consultation_category_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ConsultationCategoryEntity {
	int? id;
	String? name;
	dynamic image;
	@JSONField(name: "consultant_persons_id")
	int? consultantPersonsId;
	@JSONField(name: "text_colour")
	dynamic textColour;
	bool? isSelected;
	@JSONField(name: "consultation_sub_categories")
	List<ConsultationCategoryConsultationSubCategories>? consultationSubCategories;

	ConsultationCategoryEntity();

	factory ConsultationCategoryEntity.fromJson(Map<String, dynamic> json) => $ConsultationCategoryEntityFromJson(json);

	Map<String, dynamic> toJson() => $ConsultationCategoryEntityToJson(this);

	ConsultationCategoryEntity copyWith({int? id, String? name, dynamic image, int? consultantPersonsId, dynamic textColour, bool? isSelected, List<ConsultationCategoryConsultationSubCategories>? consultationSubCategories}) {
		return ConsultationCategoryEntity()
			..id= id ?? this.id
			..name= name ?? this.name
			..image= image ?? this.image
			..consultantPersonsId= consultantPersonsId ?? this.consultantPersonsId
			..textColour= textColour ?? this.textColour
			..isSelected= isSelected ?? this.isSelected
			..consultationSubCategories= consultationSubCategories ?? this.consultationSubCategories;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ConsultationCategoryConsultationSubCategories {
	int? id;
	@JSONField(name: "created_at")
	String? createdAt;
	String? name;
	@JSONField(name: "consultation_category_id")
	int? consultationCategoryId;
	dynamic image;

	ConsultationCategoryConsultationSubCategories();

	factory ConsultationCategoryConsultationSubCategories.fromJson(Map<String, dynamic> json) => $ConsultationCategoryConsultationSubCategoriesFromJson(json);

	Map<String, dynamic> toJson() => $ConsultationCategoryConsultationSubCategoriesToJson(this);

	ConsultationCategoryConsultationSubCategories copyWith({int? id, String? createdAt, String? name, int? consultationCategoryId, dynamic image}) {
		return ConsultationCategoryConsultationSubCategories()
			..id= id ?? this.id
			..createdAt= createdAt ?? this.createdAt
			..name= name ?? this.name
			..consultationCategoryId= consultationCategoryId ?? this.consultationCategoryId
			..image= image ?? this.image;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}