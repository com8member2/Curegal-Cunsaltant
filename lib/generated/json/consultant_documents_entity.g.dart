import 'package:consultation_curegal/generated/json/base/json_convert_content.dart';
import 'package:consultation_curegal/screens/account/model/consultant_documents_entity.dart';

ConsultantDocumentsEntity $ConsultantDocumentsEntityFromJson(Map<String, dynamic> json) {
	final ConsultantDocumentsEntity consultantDocumentsEntity = ConsultantDocumentsEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		consultantDocumentsEntity.id = id;
	}
	final double? consultantPersonTypeId = jsonConvert.convert<double>(json['consultant_person_type_id']);
	if (consultantPersonTypeId != null) {
		consultantDocumentsEntity.consultantPersonTypeId = consultantPersonTypeId;
	}
	final double? consultantDocumentId = jsonConvert.convert<double>(json['consultant_document_id']);
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
	final List<ConsultantDocumentsConsultantDocumentsStatus>? consultantDocumentsStatus = jsonConvert.convertListNotNull<ConsultantDocumentsConsultantDocumentsStatus>(json['consultant_documents_status']);
	if (consultantDocumentsStatus != null) {
		consultantDocumentsEntity.consultantDocumentsStatus = consultantDocumentsStatus;
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
	data['consultant_documents_status'] =  entity.consultantDocumentsStatus?.map((v) => v.toJson()).toList();
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

ConsultantDocumentsConsultantDocumentsStatus $ConsultantDocumentsConsultantDocumentsStatusFromJson(Map<String, dynamic> json) {
	final ConsultantDocumentsConsultantDocumentsStatus consultantDocumentsConsultantDocumentsStatus = ConsultantDocumentsConsultantDocumentsStatus();
	final double? id = jsonConvert.convert<double>(json['id']);
	if (id != null) {
		consultantDocumentsConsultantDocumentsStatus.id = id;
	}
	final String? consultantId = jsonConvert.convert<String>(json['consultant_id']);
	if (consultantId != null) {
		consultantDocumentsConsultantDocumentsStatus.consultantId = consultantId;
	}
	final double? documentId = jsonConvert.convert<double>(json['document_id']);
	if (documentId != null) {
		consultantDocumentsConsultantDocumentsStatus.documentId = documentId;
	}
	final String? documentStatus = jsonConvert.convert<String>(json['document_status']);
	if (documentStatus != null) {
		consultantDocumentsConsultantDocumentsStatus.documentStatus = documentStatus;
	}
	final String? documentStatusMessage = jsonConvert.convert<String>(json['document_status_message']);
	if (documentStatusMessage != null) {
		consultantDocumentsConsultantDocumentsStatus.documentStatusMessage = documentStatusMessage;
	}
	final dynamic documentNumber = jsonConvert.convert<dynamic>(json['document_number']);
	if (documentNumber != null) {
		consultantDocumentsConsultantDocumentsStatus.documentNumber = documentNumber;
	}
	final dynamic documentRegistrationDate = jsonConvert.convert<dynamic>(json['document_registration_date']);
	if (documentRegistrationDate != null) {
		consultantDocumentsConsultantDocumentsStatus.documentRegistrationDate = documentRegistrationDate;
	}
	final dynamic documentExpirationDate = jsonConvert.convert<dynamic>(json['document_expiration_date']);
	if (documentExpirationDate != null) {
		consultantDocumentsConsultantDocumentsStatus.documentExpirationDate = documentExpirationDate;
	}
	final String? documentsFile = jsonConvert.convert<String>(json['documents_file']);
	if (documentsFile != null) {
		consultantDocumentsConsultantDocumentsStatus.documentsFile = documentsFile;
	}
	final double? consultantDocumentsId = jsonConvert.convert<double>(json['consultant_documents_id']);
	if (consultantDocumentsId != null) {
		consultantDocumentsConsultantDocumentsStatus.consultantDocumentsId = consultantDocumentsId;
	}
	return consultantDocumentsConsultantDocumentsStatus;
}

Map<String, dynamic> $ConsultantDocumentsConsultantDocumentsStatusToJson(ConsultantDocumentsConsultantDocumentsStatus entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['consultant_id'] = entity.consultantId;
	data['document_id'] = entity.documentId;
	data['document_status'] = entity.documentStatus;
	data['document_status_message'] = entity.documentStatusMessage;
	data['document_number'] = entity.documentNumber;
	data['document_registration_date'] = entity.documentRegistrationDate;
	data['document_expiration_date'] = entity.documentExpirationDate;
	data['documents_file'] = entity.documentsFile;
	data['consultant_documents_id'] = entity.consultantDocumentsId;
	return data;
}