import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/screens/home_screen/controller/home_tab_controller.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CalendarView extends HookConsumerWidget {
  const CalendarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDate = useState(DateTime.now());
    var allBookings = ref.watch(allBookingsProvider);
    return allBookings.when(
      data: (value) => Column(
        children: [
          TableCalendar(
            headerStyle: const HeaderStyle(formatButtonVisible: false),
            eventLoader: (day) => value.where((element) => element["date"] == day.toSupaFormate()).toList(),
            calendarFormat: CalendarFormat.week,
            selectedDayPredicate: (day) => isSameDay(selectedDate.value, day),
            firstDay: DateTime.now(),
            enabledDayPredicate: (day) => value.any((element) => element["date"] == day.toSupaFormate()),
            lastDay: DateTime.now().add(const Duration(days: 15)),
            focusedDay: selectedDate.value,
            calendarStyle: const CalendarStyle(
                todayTextStyle: TextStyle(color: Color(0xFF5A5A5A)),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                )),
            currentDay: DateTime.now(),
            onDaySelected: (selectedDay, focusedDay) {
              selectedDate.value = selectedDay;
            },
          ),
          ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = value.where((element) => element["date"] == selectedDate.value.toSupaFormate()).elementAt(index);
              var fromTime = item["start_time"].toString().tosupaTime().toFormattedTime();
              var endTime = item["end_time"].toString().tosupaTime().toFormattedTime();
              return Card(
                child: ListTile(
                  leading: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: fromTime.substring(0, fromTime.length - 3),
                        ),
                        TextSpan(
                          text: "${fromTime.substring(fromTime.length - 3)}\n",
                          style: const TextStyle(fontSize: 11), // Adjust the font size for the AM/PM text
                        ),
                        TextSpan(text: endTime.substring(0, endTime.length - 3), style: const TextStyle(color: CustomColor.dateGray)),
                        TextSpan(
                          text: endTime.substring(endTime.length - 3),
                          style: const TextStyle(fontSize: 11, color: CustomColor.dateGray), // Adjust the font size for the AM/PM text
                        )
                      ],
                    ),
                  ),
                  title: Text(item["user_profile"]["fullName"], style: Theme.of(context).textTheme.titleLarge),
                ),
              );
            },
            itemCount: value.where((element) => element["date"] == selectedDate.value.toSupaFormate()).length,
          )
        ],
      ),
      error: (Object error, StackTrace stackTrace) => const SizedBox(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
