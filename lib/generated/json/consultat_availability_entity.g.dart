import 'package:consultation_curegal/generated/json/base/json_convert_content.dart';
import 'package:consultation_curegal/screens/home_screen/model/consultat_availability_entity.dart';

ConsultantAvailabilityEntity $ConsultatAvailabilityEntityFromJson(Map<String, dynamic> json) {
	final ConsultantAvailabilityEntity consultatAvailabilityEntity = ConsultantAvailabilityEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		consultatAvailabilityEntity.id = id;
	}
	final String? consultantId = jsonConvert.convert<String>(json['consultant_id']);
	if (consultantId != null) {
		consultatAvailabilityEntity.consultantId = consultantId;
	}
	final String? dayOfWeekText = jsonConvert.convert<String>(json['day_of_week_text']);
	if (dayOfWeekText != null) {
		consultatAvailabilityEntity.dayOfWeekText = dayOfWeekText;
	}
	final int? dayOfWeek = jsonConvert.convert<int>(json['day_of_week']);
	if (dayOfWeek != null) {
		consultatAvailabilityEntity.dayOfWeek = dayOfWeek;
	}
	final List<ConsultatAvailabilityTime>? time = jsonConvert.convertListNotNull<ConsultatAvailabilityTime>(json['time']);
	if (time != null) {
		consultatAvailabilityEntity.time = time;
	}
	final double? slotTime = jsonConvert.convert<double>(json['slot_time']);
	if (slotTime != null) {
		consultatAvailabilityEntity.slotTime = slotTime;
	}
	final double? slotPrice = jsonConvert.convert<double>(json['slot_price']);
	if (slotPrice != null) {
		consultatAvailabilityEntity.slotPrice = slotPrice;
	}
	return consultatAvailabilityEntity;
}

Map<String, dynamic> $ConsultatAvailabilityEntityToJson(ConsultantAvailabilityEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['consultant_id'] = entity.consultantId;
	data['day_of_week'] = entity.dayOfWeek;
	data['time'] =  entity.time?.map((v) => v.toJson()).toList();
	data['slot_time'] = entity.slotTime;
	data['slot_price'] = entity.slotPrice;
	data['day_of_week_text'] = entity.dayOfWeekText;
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