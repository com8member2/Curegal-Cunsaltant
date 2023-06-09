import 'package:consultation_curegal/generated/json/base/json_field.dart';
import 'package:consultation_curegal/generated/json/consultat_availability_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ConsultantAvailabilityEntity {
	int? id;
	@JSONField(name: "consultant_id")
	String? consultantId;
	@JSONField(name: "day_of_week")
	int? dayOfWeek;
	@JSONField(name: "day_of_week_text")
	String? dayOfWeekText;
	List<ConsultatAvailabilityTime>? time;
	@JSONField(name: "slot_time")
	double? slotTime;
	@JSONField(name: "slot_price")
	double? slotPrice;

	ConsultantAvailabilityEntity();

	factory ConsultantAvailabilityEntity.fromJson(Map<String, dynamic> json) => $ConsultantAvailabilityEntityFromJson(json);

	Map<String, dynamic> toJson() => $ConsultantAvailabilityEntityToJson(this);

	ConsultantAvailabilityEntity copyWith({int? id, String? consultantId, String? dayOfWeekText, int? dayOfWeek, List<ConsultatAvailabilityTime>? time, double? slotTime, double? slotPrice}) {
		return ConsultantAvailabilityEntity()
			..id= id ?? this.id
			..consultantId= consultantId ?? this.consultantId
			..dayOfWeek= dayOfWeek ?? this.dayOfWeek
			..dayOfWeekText= dayOfWeekText ?? this.dayOfWeekText
			..time= time ?? this.time
			..slotTime= slotTime ?? this.slotTime
			..slotPrice= slotPrice ?? this.slotPrice;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ConsultatAvailabilityTime {
	String? to;
	String? from;

	ConsultatAvailabilityTime();

	factory ConsultatAvailabilityTime.fromJson(Map<String, dynamic> json) => $ConsultatAvailabilityTimeFromJson(json);

	Map<String, dynamic> toJson() => $ConsultatAvailabilityTimeToJson(this);

	ConsultatAvailabilityTime copyWith({String? to, String? from}) {
		return ConsultatAvailabilityTime()
			..to= to ?? this.to
			..from= from ?? this.from;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}