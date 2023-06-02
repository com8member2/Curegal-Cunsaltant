import 'package:consultation_curegal/generated/json/base/json_convert_content.dart';
import 'package:consultation_curegal/shared/model/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		userEntity.id = id;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		userEntity.createdAt = createdAt;
	}
	final String? supabaseAuthId = jsonConvert.convert<String>(json['supabase_auth_id']);
	if (supabaseAuthId != null) {
		userEntity.supabaseAuthId = supabaseAuthId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userEntity.name = name;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userEntity.email = email;
	}
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		userEntity.phone = phone;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		userEntity.updatedAt = updatedAt;
	}
	final String? deletedAt = jsonConvert.convert<String>(json['deleted_at']);
	if (deletedAt != null) {
		userEntity.deletedAt = deletedAt;
	}
	final String? approveStatus = jsonConvert.convert<String>(json['approve_status']);
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
	final String? dateOfBirth = jsonConvert.convert<String>(json['date_of_birth']);
	if (dateOfBirth != null) {
		userEntity.dateOfBirth = dateOfBirth;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		userEntity.gender = gender;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		userEntity.address = address;
	}
	final String? city = jsonConvert.convert<String>(json['city']);
	if (city != null) {
		userEntity.city = city;
	}
	final String? state = jsonConvert.convert<String>(json['state']);
	if (state != null) {
		userEntity.state = state;
	}
	final String? country = jsonConvert.convert<String>(json['country']);
	if (country != null) {
		userEntity.country = country;
	}
	final int? rating = jsonConvert.convert<int>(json['rating']);
	if (rating != null) {
		userEntity.rating = rating;
	}
	final String? profile = jsonConvert.convert<String>(json['profile']);
	if (profile != null) {
		userEntity.profile = profile;
	}
	final String? consultingPrice = jsonConvert.convert<String>(json['consulting_price']);
	if (consultingPrice != null) {
		userEntity.consultingPrice = consultingPrice;
	}
	final int? consultantPersonType = jsonConvert.convert<int>(json['consultant_person_type']);
	if (consultantPersonType != null) {
		userEntity.consultantPersonType = consultantPersonType;
	}
	final bool? educationExperienceStatus = jsonConvert.convert<bool>(json['education_experience_status']);
	if (educationExperienceStatus != null) {
		userEntity.educationExperienceStatus = educationExperienceStatus;
	}
	final dynamic consultationLanguageStatus = jsonConvert.convert<dynamic>(json['consultation_language_status']);
	if (consultationLanguageStatus != null) {
		userEntity.consultationLanguageStatus = consultationLanguageStatus;
	}
	final bool? documentationStatus = jsonConvert.convert<bool>(json['documentation_status']);
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
	data['consultation_language_status'] = entity.consultationLanguageStatus;
	data['documentation_status'] = entity.documentationStatus;
	return data;
}