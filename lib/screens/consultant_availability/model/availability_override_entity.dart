import 'package:consultation_curegal/generated/json/base/json_field.dart';
import 'package:consultation_curegal/generated/json/availability_override_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AvailabilityOverrideEntity {
	int? id;
	@JSONField(name: "consultant_id")
	String? consultantId;
	bool? available;
	String? date;
	List<AvailabilityOverrideTime>? time;

	AvailabilityOverrideEntity();

	factory AvailabilityOverrideEntity.fromJson(Map<String, dynamic> json) => $AvailabilityOverrideEntityFromJson(json);

	Map<String, dynamic> toJson() => $AvailabilityOverrideEntityToJson(this);

	AvailabilityOverrideEntity copyWith({int? id, String? consultantId, String? date, List<AvailabilityOverrideTime>? time,bool? available}) {
		return AvailabilityOverrideEntity()
			..id= id ?? this.id
			..consultantId= consultantId ?? this.consultantId
			..date= date ?? this.date
			..time= time ?? this.time
			..available= available ?? this.available;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AvailabilityOverrideTime {
	String? to;
	String? from;

	AvailabilityOverrideTime();

	factory AvailabilityOverrideTime.fromJson(Map<String, dynamic> json) => $AvailabilityOverrideTimeFromJson(json);

	Map<String, dynamic> toJson() => $AvailabilityOverrideTimeToJson(this);

	AvailabilityOverrideTime copyWith({String? to, String? from}) {
		return AvailabilityOverrideTime()
			..to= to ?? this.to
			..from= from ?? this.from;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}