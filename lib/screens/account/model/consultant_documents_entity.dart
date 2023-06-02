import 'package:consultation_curegal/generated/json/base/json_field.dart';
import 'package:consultation_curegal/generated/json/consultant_documents_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ConsultantDocumentsEntity {
	int? id;
	@JSONField(name: "consultant_person_type_id")
	int? consultantPersonTypeId;
	@JSONField(name: "consultant_document_id")
	int? consultantDocumentId;
	@JSONField(name: "is_expiration_date_required")
	bool? isExpirationDateRequired;
	@JSONField(name: "is_registration_date_required")
	bool? isRegistrationDateRequired;
	@JSONField(name: "is_number_required")
	bool? isNumberRequired;
	ConsultantDocumentsDocuments? documents;

	ConsultantDocumentsEntity();

	factory ConsultantDocumentsEntity.fromJson(Map<String, dynamic> json) => $ConsultantDocumentsEntityFromJson(json);

	Map<String, dynamic> toJson() => $ConsultantDocumentsEntityToJson(this);

	ConsultantDocumentsEntity copyWith({int? id, int? consultantPersonTypeId, int? consultantDocumentId, bool? isExpirationDateRequired, bool? isRegistrationDateRequired, bool? isNumberRequired, ConsultantDocumentsDocuments? documents}) {
		return ConsultantDocumentsEntity()
			..id= id ?? this.id
			..consultantPersonTypeId= consultantPersonTypeId ?? this.consultantPersonTypeId
			..consultantDocumentId= consultantDocumentId ?? this.consultantDocumentId
			..isExpirationDateRequired= isExpirationDateRequired ?? this.isExpirationDateRequired
			..isRegistrationDateRequired= isRegistrationDateRequired ?? this.isRegistrationDateRequired
			..isNumberRequired= isNumberRequired ?? this.isNumberRequired
			..documents= documents ?? this.documents;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ConsultantDocumentsDocuments {
	int? id;
	String? name;
	String? description;
	String? image;
	String? format;
	@JSONField(name: "sample_image")
	dynamic sampleImage;

	ConsultantDocumentsDocuments();

	factory ConsultantDocumentsDocuments.fromJson(Map<String, dynamic> json) => $ConsultantDocumentsDocumentsFromJson(json);

	Map<String, dynamic> toJson() => $ConsultantDocumentsDocumentsToJson(this);

	ConsultantDocumentsDocuments copyWith({int? id, String? name, String? description, String? image, String? format, dynamic sampleImage}) {
		return ConsultantDocumentsDocuments()
			..id= id ?? this.id
			..name= name ?? this.name
			..description= description ?? this.description
			..image= image ?? this.image
			..format= format ?? this.format
			..sampleImage= sampleImage ?? this.sampleImage;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}