import 'package:consultation_curegal/generated/json/base/json_convert_content.dart';
import 'package:consultation_curegal/screens/account/model/consultant_documents_entity.dart';

ConsultantDocumentsEntity $ConsultantDocumentsEntityFromJson(Map<String, dynamic> json) {
	final ConsultantDocumentsEntity consultantDocumentsEntity = ConsultantDocumentsEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		consultantDocumentsEntity.id = id;
	}
	final int? consultantPersonTypeId = jsonConvert.convert<int>(json['consultant_person_type_id']);
	if (consultantPersonTypeId != null) {
		consultantDocumentsEntity.consultantPersonTypeId = consultantPersonTypeId;
	}
	final int? consultantDocumentId = jsonConvert.convert<int>(json['consultant_document_id']);
	if (consultantDocumentId != null) {
		consultantDocumentsEntity.consultantDocumentId = consultantDocumentId;
	}
	final bool? isExpirationDateRequired = jsonConvert.convert<bool>(json['is_expiration_date_required']);
	if (isExpirationDateRequired != null) {
		consultantDocumentsEntity.isExpirationDateRequired = isExpirationDateRequired;
	}
	final bool? isRegistrationDateRequired = jsonConvert.convert<bool>(json['is_registration_date_required']);
	if (isRegistrationDateRequired != null) {
		consultantDocumentsEntity.isRegistrationDateRequired = isRegistrationDateRequired;
	}
	final bool? isNumberRequired = jsonConvert.convert<bool>(json['is_number_required']);
	if (isNumberRequired != null) {
		consultantDocumentsEntity.isNumberRequired = isNumberRequired;
	}
	final ConsultantDocumentsDocuments? documents = jsonConvert.convert<ConsultantDocumentsDocuments>(json['documents']);
	if (documents != null) {
		consultantDocumentsEntity.documents = documents;
	}
	return consultantDocumentsEntity;
}

Map<String, dynamic> $ConsultantDocumentsEntityToJson(ConsultantDocumentsEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['consultant_person_type_id'] = entity.consultantPersonTypeId;
	data['consultant_document_id'] = entity.consultantDocumentId;
	data['is_expiration_date_required'] = entity.isExpirationDateRequired;
	data['is_registration_date_required'] = entity.isRegistrationDateRequired;
	data['is_number_required'] = entity.isNumberRequired;
	data['documents'] = entity.documents?.toJson();
	return data;
}

ConsultantDocumentsDocuments $ConsultantDocumentsDocumentsFromJson(Map<String, dynamic> json) {
	final ConsultantDocumentsDocuments consultantDocumentsDocuments = ConsultantDocumentsDocuments();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		consultantDocumentsDocuments.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		consultantDocumentsDocuments.name = name;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		consultantDocumentsDocuments.description = description;
	}
	final String? image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		consultantDocumentsDocuments.image = image;
	}
	final String? format = jsonConvert.convert<String>(json['format']);
	if (format != null) {
		consultantDocumentsDocuments.format = format;
	}
	final dynamic sampleImage = jsonConvert.convert<dynamic>(json['sample_image']);
	if (sampleImage != null) {
		consultantDocumentsDocuments.sampleImage = sampleImage;
	}
	return consultantDocumentsDocuments;
}

Map<String, dynamic> $ConsultantDocumentsDocumentsToJson(ConsultantDocumentsDocuments entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['image'] = entity.image;
	data['format'] = entity.format;
	data['sample_image'] = entity.sampleImage;
	return data;
}