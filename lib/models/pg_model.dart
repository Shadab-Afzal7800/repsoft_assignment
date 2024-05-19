class PGModel {
  final List<String> pgList = ['PG 1', 'PG 2', 'PG 3'];
  final Map<String, Map<String, String>> pgDetails = {
    'PG 1': {
      'rooms': '20',
      'floors': '04',
      'paid': '20(32)',
      'unpaid': '12',
    },
    'PG 2': {
      'rooms': '15',
      'floors': '03',
      'paid': '12(20)',
      'unpaid': '08',
    },
    'PG 3': {
      'rooms': '25',
      'floors': '05',
      'paid': '22(30)',
      'unpaid': '08',
    },
  };

  final Map<String, Map<String, List<String>>> mealSelections = {
    'PG 1': {
      'breakfast': ['Dosa', 'Dosa'],
      'lunch': ['Dosa', 'Dosa'],
      'dinner': ['Dosa', 'Dosa'],
    },
    'PG 2': {
      'breakfast': ['Idli', 'Idli'],
      'lunch': ['Puri', 'Puri'],
      'dinner': ['Idli', 'Idli'],
    },
    'PG 3': {
      'breakfast': ['Puri', 'Puri'],
      'lunch': ['Idli', 'Idli'],
      'dinner': ['Puri', 'Puri'],
    },
  };
}
