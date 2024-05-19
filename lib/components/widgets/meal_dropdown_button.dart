import 'package:flutter/material.dart';
import 'package:repsoft_assignment/models/pg_model.dart';

class MealDropdownButton extends StatelessWidget {
  final String mealType;
  final int index;
  final PGModel pgModel;
  final String? selectedPG;
  final ValueChanged<String?> onChanged;

  MealDropdownButton({
    required this.mealType,
    required this.index,
    required this.pgModel,
    required this.selectedPG,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: pgModel.mealSelections[selectedPG]?[mealType]?[index],
      items: <String>['Dosa', 'Idli', 'Puri'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      hint: Text('Select'),
    );
  }
}
