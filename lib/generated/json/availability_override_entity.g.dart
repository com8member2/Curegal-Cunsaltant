import 'package:consultation_curegal/generated/json/base/json_convert_content.dart';
import 'package:consultation_curegal/screens/consultant_availability/model/availability_override_entity.dart';

AvailabilityOverrideEntity $AvailabilityOverrideEntityFromJson(Map<String, dynamic> json) {
	final AvailabilityOverrideEntity availabilityOverrideEntity = AvailabilityOverrideEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		availabilityOverrideEntity.id = id;
	}
	final String? consultantId = jsonConvert.convert<String>(json['consultant_id']);
	if (consultantId != null) {
		availabilityOverrideEntity.consultantId = consultantId;
	}
	final String? date = jsonConvert.convert<String>(json['date']);
	if (date != null) {
		availabilityOverrideEntity.date = date;
	}
	final List<AvailabilityOverrideTime>? time = jsonConvert.convertListNotNull<AvailabilityOverrideTime>(json['time']);
	if (time != null) {
		availabilityOverrideEntity.time = time;
	}
	final int? slotPrice = jsonConvert.convert<int>(json['slot_price']);
	if (slotPrice != null) {
		availabilityOverrideEntity.slotPrice = slotPrice;
	}
	final bool? available = jsonConvert.convert<bool>(json['available']);
	if (available != null) {
		availabilityOverrideEntity.available = available;
	}
	return availabilityOverrideEntity;
}

Map<String, dynamic> $AvailabilityOverrideEntityToJson(AvailabilityOverrideEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['consultant_id'] = entity.consultantId;
	data['date'] =  entity.date;
	data['time'] =  entity.time?.map((v) => v.toJson()).toList();
	data['slot_price'] = entity.slotPrice;
	data['available'] = entity.available;
	return data;
}

AvailabilityOverrideTime $AvailabilityOverrideTimeFromJson(Map<String, dynamic> json) {
	final AvailabilityOverrideTime availabilityOverrideTime = AvailabilityOverrideTime();
	final String? to = jsonConvert.convert<String>(json['to']);
	if (to != null) {
		availabilityOverrideTime.to = to;
	}
	final String? from = jsonConvert.convert<String>(json['from']);
	if (from != null) {
		availabilityOverrideTime.from = from;
	}
	return availabilityOverrideTime;
}

Map<String, dynamic> $AvailabilityOverrideTimeToJson(AvailabilityOverrideTime entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['to'] = entity.to;
	data['from'] = entity.from;
	return data;
}