import 'package:consultation_curegal/generated/json/base/json_field.dart';
import 'package:consultation_curegal/generated/json/consultant_documents_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ConsultantDocumentsEntity {
	int? id;
	@JSONField(name: "consultant_person_type_id")
	double? consultantPersonTypeId;
	@JSONField(name: "consultant_document_id")
	double? consultantDocumentId;
	@JSONField(name: "is_expiration_date_required")
	bool? isExpirationDateRequired;
	@JSONField(name: "is_registration_date_required")
	bool? isRegistrationDateRequired;
	@JSONField(name: "is_number_required")
	bool? isNumberRequired;
	ConsultantDocumentsDocuments? documents;
	@JSONField(name: "consultant_documents_status")
	List<ConsultantDocumentsConsultantDocumentsStatus>? consultantDocumentsStatus;

	ConsultantDocumentsEntity();

	factory ConsultantDocumentsEntity.fromJson(Map<String, dynamic> json) => $ConsultantDocumentsEntityFromJson(json);

	Map<String, dynamic> toJson() => $ConsultantDocumentsEntityToJson(this);

	ConsultantDocumentsEntity copyWith({int? id, double? consultantPersonTypeId, double? consultantDocumentId, bool? isExpirationDateRequired, bool? isRegistrationDateRequired, bool? isNumberRequired, ConsultantDocumentsDocuments? documents, List<ConsultantDocumentsConsultantDocumentsStatus>? consultantDocumentsStatus}) {
		return ConsultantDocumentsEntity()
			..id= id ?? this.id
			..consultantPersonTypeId= consultantPersonTypeId ?? this.consultantPersonTypeId
			..consultantDocumentId= consultantDocumentId ?? this.consultantDocumentId
			..isExpirationDateRequired= isExpirationDateRequired ?? this.isExpirationDateRequired
			..isRegistrationDateRequired= isRegistrationDateRequired ?? this.isRegistrationDateRequired
			..isNumberRequired= isNumberRequired ?? this.isNumberRequired
			..documents= documents ?? this.documents
			..consultantDocumentsStatus= consultantDocumentsStatus ?? this.consultantDocumentsStatus;
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

@JsonSerializable()
class ConsultantDocumentsConsultantDocumentsStatus {
	double? id;
	@JSONField(name: "consultant_id")
	String? consultantId;
	@JSONField(name: "document_id")
	double? documentId;
	@JSONField(name: "document_status")
	String? documentStatus;
	@JSONField(name: "document_status_message")
	dynamic documentStatusMessage;
	@JSONField(name: "document_number")
	dynamic documentNumber;
	@JSONField(name: "document_registration_date")
	dynamic documentRegistrationDate;
	@JSONField(name: "document_expiration_date")
	dynamic documentExpirationDate;
	@JSONField(name: "documents_file")
	String? documentsFile;
	@JSONField(name: "consultant_documents_id")
	double? consultantDocumentsId;

	ConsultantDocumentsConsultantDocumentsStatus();

	factory ConsultantDocumentsConsultantDocumentsStatus.fromJson(Map<String, dynamic> json) => $ConsultantDocumentsConsultantDocumentsStatusFromJson(json);

	Map<String, dynamic> toJson() => $ConsultantDocumentsConsultantDocumentsStatusToJson(this);

	ConsultantDocumentsConsultantDocumentsStatus copyWith({double? id, String? consultantId, double? documentId, String? documentStatus, dynamic documentStatusMessage, dynamic documentNumber, dynamic documentRegistrationDate, dynamic documentExpirationDate, String? documentsFile, double? consultantDocumentsId}) {
		return ConsultantDocumentsConsultantDocumentsStatus()
			..id= id ?? this.id
			..consultantId= consultantId ?? this.consultantId
			..documentId= documentId ?? this.documentId
			..documentStatus= documentStatus ?? this.documentStatus
			..documentStatusMessage= documentStatusMessage ?? this.documentStatusMessage
			..documentNumber= documentNumber ?? this.documentNumber
			..documentRegistrationDate= documentRegistrationDate ?? this.documentRegistrationDate
			..documentExpirationDate= documentExpirationDate ?? this.documentExpirationDate
			..documentsFile= documentsFile ?? this.documentsFile
			..consultantDocumentsId= consultantDocumentsId ?? this.consultantDocumentsId;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}