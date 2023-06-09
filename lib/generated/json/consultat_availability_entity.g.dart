import 'package:consultation_curegal/generated/json/base/json_convert_content.dart';
import 'package:consultation_curegal/screens/consultant_availability/model/consultat_availability_entity.dart';

ConsultantAvailabilityEntity $ConsultantAvailabilityEntityFromJson(Map<String, dynamic> json) {
	final ConsultantAvailabilityEntity consultantAvailabilityEntity = ConsultantAvailabilityEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		consultantAvailabilityEntity.id = id;
	}
	final String? consultantId = jsonConvert.convert<String>(json['consultant_id']);
	if (consultantId != null) {
		consultantAvailabilityEntity.consultantId = consultantId;
	}
	final int? dayOfWeek = jsonConvert.convert<int>(json['day_of_week']);
	if (dayOfWeek != null) {
		consultantAvailabilityEntity.dayOfWeek = dayOfWeek;
	}
	final String? dayOfWeekText = jsonConvert.convert<String>(json['day_of_week_text']);
	if (dayOfWeekText != null) {
		consultantAvailabilityEntity.dayOfWeekText = dayOfWeekText;
	}
	final List<ConsultatAvailabilityTime>? time = jsonConvert.convertListNotNull<ConsultatAvailabilityTime>(json['time']);
	if (time != null) {
		consultantAvailabilityEntity.time = time;
	}
	final double? slotTime = jsonConvert.convert<double>(json['slot_time']);
	if (slotTime != null) {
		consultantAvailabilityEntity.slotTime = slotTime;
	}
	final double? slotPrice = jsonConvert.convert<double>(json['slot_price']);
	if (slotPrice != null) {
		consultantAvailabilityEntity.slotPrice = slotPrice;
	}
	return consultantAvailabilityEntity;
}

Map<String, dynamic> $ConsultantAvailabilityEntityToJson(ConsultantAvailabilityEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['consultant_id'] = entity.consultantId;
	data['day_of_week'] = entity.dayOfWeek;
	data['day_of_week_text'] = entity.dayOfWeekText;
	data['time'] =  entity.time?.map((v) => v.toJson()).toList();
	data['slot_time'] = entity.slotTime;
	data['slot_price'] = entity.slotPrice;
	return data;
}

ConsultatAvailabilityTime $ConsultatAvailabilityTimeFromJson(Map<String, dynamic> json) {
	final ConsultatAvailabilityTime consultatAvailabilityTime = ConsultatAvailabilityTime();
	final String? to = jsonConvert.convert<String>(json['to']);
	if (to != null) {
		consultatAvailabilityTime.to = to;
	}
	final String? from = jsonConvert.convert<String>(json['from']);
	if (from != null) {
		consultatAvailabilityTime.from = from;
	}
	return consultatAvailabilityTime;
}

Map<String, dynamic> $ConsultatAvailabilityTimeToJson(ConsultatAvailabilityTime entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['to'] = entity.to;
	data['from'] = entity.from;
	return data;
}