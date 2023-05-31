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
	String? textColour;
	List<ConsultationCategoryData>? data;
	bool? isSelected;

	ConsultationCategoryEntity();

	factory ConsultationCategoryEntity.fromJson(Map<String, dynamic> json) => $ConsultationCategoryEntityFromJson(json);

	Map<String, dynamic> toJson() => $ConsultationCategoryEntityToJson(this);

	ConsultationCategoryEntity copyWith({int? id, String? name, dynamic image, int? consultantPersonsId, String? textColour, List<ConsultationCategoryData>? data, bool? isSelected}) {
		return ConsultationCategoryEntity()
			..id= id ?? this.id
			..name= name ?? this.name
			..image= image ?? this.image
			..consultantPersonsId= consultantPersonsId ?? this.consultantPersonsId
			..textColour= textColour ?? this.textColour
			..data= data ?? this.data
			..isSelected= isSelected ?? this.isSelected;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ConsultationCategoryData {
	int? id;
	@JSONField(name: "created_at")
	String? createdAt;
	String? name;
	@JSONField(name: "consultation_category_id")
	int? consultationCategoryId;
	String? image;

	ConsultationCategoryData();

	factory ConsultationCategoryData.fromJson(Map<String, dynamic> json) => $ConsultationCategoryDataFromJson(json);

	Map<String, dynamic> toJson() => $ConsultationCategoryDataToJson(this);

	ConsultationCategoryData copyWith({int? id, String? createdAt, String? name, int? consultationCategoryId, String? image}) {
		return ConsultationCategoryData()
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