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
	String? name;
	String? email;
	String? phone;
	@JSONField(name: "updated_at")
	String? updatedAt;
	@JSONField(name: "deleted_at")
	String? deletedAt;
	@JSONField(name: "approve_status")
	String? approveStatus;
	@JSONField(name: "approve_status_updated_by")
	dynamic approveStatusUpdatedBy;
	dynamic password;
	@JSONField(name: "date_of_birth")
	String? dateOfBirth;
	String? gender;
	String? address;
	String? city;
	String? state;
	String? country;
	int? rating;
	String? profile;
	@JSONField(name: "consulting_price")
	String? consultingPrice;
	@JSONField(name: "consultant_person_type")
	int? consultantPersonType;
	@JSONField(name: "education_experience_status")
	bool? educationExperienceStatus;
	@JSONField(name: "consultation_language_status")
	dynamic consultationLanguageStatus;
	@JSONField(name: "documentation_status")
	bool? documentationStatus;

	UserEntity();

	factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserEntityToJson(this);

	UserEntity copyWith({String? id, String? createdAt, String? supabaseAuthId, String? name, String? email, String? phone, String? updatedAt, String? deletedAt, String? approveStatus, dynamic approveStatusUpdatedBy, dynamic password, String? dateOfBirth, String? gender, String? address, String? city, String? state, String? country, int? rating, String? profile, String? consultingPrice, int? consultantPersonType, bool? educationExperienceStatus, dynamic consulatationLanguageStatus, bool? documentationStatus}) {
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
			..consultationLanguageStatus= consulatationLanguageStatus ?? this.consultationLanguageStatus
			..documentationStatus= documentationStatus ?? this.documentationStatus;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}