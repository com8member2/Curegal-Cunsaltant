import 'package:consultation_curegal/generated/json/base/json_field.dart';
import 'package:consultation_curegal/generated/json/user_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserEntity {
	String? id;
	@JSONField(name: "created_at")
	String? createdAt;
	@JSONField(name: "supabase_auth_id")
	String? supabaseAuthId;
	dynamic name;
	dynamic email;
	dynamic phone;
	@JSONField(name: "updated_at")
	String? updatedAt;
	@JSONField(name: "deleted_at")
	String? deletedAt;
	@JSONField(name: "approve_status")
	dynamic approveStatus;
	@JSONField(name: "approve_status_updated_by")
	dynamic approveStatusUpdatedBy;
	dynamic password;
	@JSONField(name: "date_of_birth")
	dynamic dateOfBirth;
	dynamic gender;
	dynamic address;
	dynamic city;
	dynamic state;
	dynamic country;
	dynamic rating;
	dynamic profile;
	@JSONField(name: "consulting_price")
	dynamic consultingPrice;
	@JSONField(name: "consultant_person_type")
	dynamic consultantPersonType;
	@JSONField(name: "education_experience_status")
	dynamic educationExperienceStatus;
	@JSONField(name: "consulatation_language_status")
	dynamic consulatationLanguageStatus;
	@JSONField(name: "documentation_status")
	dynamic documentationStatus;

	UserEntity();

	factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserEntityToJson(this);

	UserEntity copyWith({String? id, String? createdAt, String? supabaseAuthId, dynamic name, dynamic email, dynamic phone, String? updatedAt, String? deletedAt, dynamic approveStatus, dynamic approveStatusUpdatedBy, dynamic password, dynamic dateOfBirth, dynamic gender, dynamic address, dynamic city, dynamic state, dynamic country, dynamic rating, dynamic profile, dynamic consultingPrice, dynamic consultantPersonType, dynamic educationExperienceStatus, dynamic consulatationLanguageStatus, dynamic documentationStatus}) {
		return UserEntity()
			..id= id ?? this.id
			..createdAt= createdAt ?? this.createdAt
			..supabaseAuthId= supabaseAuthId ?? this.supabaseAuthId
			..name= name ?? this.name
			..email= email ?? this.email
			..phone= phone ?? this.phone
			..updatedAt= updatedAt ?? this.updatedAt
			..deletedAt= deletedAt ?? this.deletedAt
			..approveStatus= approveStatus ?? this.approveStatus
			..approveStatusUpdatedBy= approveStatusUpdatedBy ?? this.approveStatusUpdatedBy
			..password= password ?? this.password
			..dateOfBirth= dateOfBirth ?? this.dateOfBirth
			..gender= gender ?? this.gender
			..address= address ?? this.address
			..city= city ?? this.city
			..state= state ?? this.state
			..country= country ?? this.country
			..rating= rating ?? this.rating
			..profile= profile ?? this.profile
			..consultingPrice= consultingPrice ?? this.consultingPrice
			..consultantPersonType= consultantPersonType ?? this.consultantPersonType
			..educationExperienceStatus= educationExperienceStatus ?? this.educationExperienceStatus
			..consulatationLanguageStatus= consulatationLanguageStatus ?? this.consulatationLanguageStatus
			..documentationStatus= documentationStatus ?? this.documentationStatus;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}