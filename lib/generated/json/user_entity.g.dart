import 'package:consultation_curegal/generated/json/base/json_convert_content.dart';
import 'package:consultation_curegal/shared/model/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final dynamic id = jsonConvert.convert<dynamic>(json['id']);
	if (id != null) {
		userEntity.id = id;
	}
	final dynamic createdAt = jsonConvert.convert<dynamic>(json['created_at']);
	if (createdAt != null) {
		userEntity.createdAt = createdAt;
	}
	final dynamic supabaseAuthId = jsonConvert.convert<dynamic>(json['supabase_auth_id']);
	if (supabaseAuthId != null) {
		userEntity.supabaseAuthId = supabaseAuthId;
	}
	final dynamic name = jsonConvert.convert<dynamic>(json['name']);
	if (name != null) {
		userEntity.name = name;
	}
	final dynamic email = jsonConvert.convert<dynamic>(json['email']);
	if (email != null) {
		userEntity.email = email;
	}
	final dynamic phone = jsonConvert.convert<dynamic>(json['phone']);
	if (phone != null) {
		userEntity.phone = phone;
	}
	final dynamic updatedAt = jsonConvert.convert<dynamic>(json['updated_at']);
	if (updatedAt != null) {
		userEntity.updatedAt = updatedAt;
	}
	final dynamic deletedAt = jsonConvert.convert<dynamic>(json['deleted_at']);
	if (deletedAt != null) {
		userEntity.deletedAt = deletedAt;
	}
	final dynamic approveStatus = jsonConvert.convert<dynamic>(json['approve_status']);
	if (approveStatus != null) {
		userEntity.approveStatus = approveStatus;
	}
	final dynamic approveStatusUpdatedBy = jsonConvert.convert<dynamic>(json['approve_status_updated_by']);
	if (approveStatusUpdatedBy != null) {
		userEntity.approveStatusUpdatedBy = approveStatusUpdatedBy;
	}
	final dynamic password = jsonConvert.convert<dynamic>(json['password']);
	if (password != null) {
		userEntity.password = password;
	}
	final dynamic dateOfBirth = jsonConvert.convert<dynamic>(json['date_of_birth']);
	if (dateOfBirth != null) {
		userEntity.dateOfBirth = dateOfBirth;
	}
	final dynamic gender = jsonConvert.convert<dynamic>(json['gender']);
	if (gender != null) {
		userEntity.gender = gender;
	}
	final dynamic address = jsonConvert.convert<dynamic>(json['address']);
	if (address != null) {
		userEntity.address = address;
	}
	final dynamic city = jsonConvert.convert<dynamic>(json['city']);
	if (city != null) {
		userEntity.city = city;
	}
	final dynamic state = jsonConvert.convert<dynamic>(json['state']);
	if (state != null) {
		userEntity.state = state;
	}
	final dynamic country = jsonConvert.convert<dynamic>(json['country']);
	if (country != null) {
		userEntity.country = country;
	}
	final dynamic rating = jsonConvert.convert<dynamic>(json['rating']);
	if (rating != null) {
		userEntity.rating = rating;
	}
	final dynamic profile = jsonConvert.convert<dynamic>(json['profile']);
	if (profile != null) {
		userEntity.profile = profile;
	}
	final dynamic consultingPrice = jsonConvert.convert<dynamic>(json['consulting_price']);
	if (consultingPrice != null) {
		userEntity.consultingPrice = consultingPrice;
	}
	final dynamic consultantPersonType = jsonConvert.convert<dynamic>(json['consultant_person_type']);
	if (consultantPersonType != null) {
		userEntity.consultantPersonType = consultantPersonType;
	}
	final dynamic educationExperienceStatus = jsonConvert.convert<dynamic>(json['education_experience_status']);
	if (educationExperienceStatus != null) {
		userEntity.educationExperienceStatus = educationExperienceStatus;
	}
	final dynamic consulatationLanguageStatus = jsonConvert.convert<dynamic>(json['consulatation_language_status']);
	if (consulatationLanguageStatus != null) {
		userEntity.consulatationLanguageStatus = consulatationLanguageStatus;
	}
	final dynamic documentationStatus = jsonConvert.convert<dynamic>(json['documentation_status']);
	if (documentationStatus != null) {
		userEntity.documentationStatus = documentationStatus;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['created_at'] = entity.createdAt;
	data['supabase_auth_id'] = entity.supabaseAuthId;
	data['name'] = entity.name;
	data['email'] = entity.email;
	data['phone'] = entity.phone;
	data['updated_at'] = entity.updatedAt;
	data['deleted_at'] = entity.deletedAt;
	data['approve_status'] = entity.approveStatus;
	data['approve_status_updated_by'] = entity.approveStatusUpdatedBy;
	data['password'] = entity.password;
	data['date_of_birth'] = entity.dateOfBirth;
	data['gender'] = entity.gender;
	data['address'] = entity.address;
	data['city'] = entity.city;
	data['state'] = entity.state;
	data['country'] = entity.country;
	data['rating'] = entity.rating;
	data['profile'] = entity.profile;
	data['consulting_price'] = entity.consultingPrice;
	data['consultant_person_type'] = entity.consultantPersonType;
	data['education_experience_status'] = entity.educationExperienceStatus;
	data['consulatation_language_status'] = entity.consulatationLanguageStatus;
	data['documentation_status'] = entity.documentationStatus;
	return data;
}