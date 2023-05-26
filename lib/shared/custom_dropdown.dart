import 'package:consultation_curegal/shared/textfield_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomDropdown<T> extends HookWidget {
  final List<T> items;
  final T value;
  final ValueChanged<T> onChanged;
  final String hint;

  const CustomDropdown({
     Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState(value);

    return DropdownButtonFormField<T>(
      value: selectedValue.value,
      decoration: textFieldDecoration(hint,context),
      hint: hint != null ? Text(hint) : null,
      onChanged: (newValue) {
        selectedValue.value = newValue as T;
        onChanged(newValue);
      },
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
    );
  }
}
