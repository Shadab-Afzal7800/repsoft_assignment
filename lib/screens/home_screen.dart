import 'package:flutter/material.dart';
import 'package:repsoft_assignment/components/widgets/info_card.dart';
import 'package:repsoft_assignment/components/widgets/meal_dropdown_button.dart';
import 'package:repsoft_assignment/models/pg_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedPG;
  PGModel? pgModel = PGModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedPG,
                hint: Text('Select PG', style: TextStyle(color: Colors.black)),
                items: pgModel!.pgList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedPG = newValue;
                  });
                },
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Breakfast'),
                        Text('Lunch'),
                        Text('Dinner'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MealDropdownButton(
                            mealType: 'breakfast',
                            index: 0,
                            pgModel: pgModel!,
                            selectedPG: selectedPG,
                            onChanged: (newValue) {
                              setState(() {
                                pgModel!.mealSelections[selectedPG]
                                    ?['breakfast']?[0] = newValue!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: MealDropdownButton(
                            mealType: 'lunch',
                            index: 0,
                            pgModel: pgModel!,
                            selectedPG: selectedPG,
                            onChanged: (newValue) {
                              setState(() {
                                pgModel!.mealSelections[selectedPG]?['lunch']
                                    ?[0] = newValue!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: MealDropdownButton(
                            mealType: 'dinner',
                            index: 0,
                            pgModel: pgModel!,
                            selectedPG: selectedPG,
                            onChanged: (newValue) {
                              setState(() {
                                pgModel!.mealSelections[selectedPG]?['dinner']
                                    ?[0] = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MealDropdownButton(
                            mealType: 'breakfast',
                            index: 1,
                            pgModel: pgModel!,
                            selectedPG: selectedPG,
                            onChanged: (newValue) {
                              setState(() {
                                pgModel!.mealSelections[selectedPG]
                                    ?['breakfast']?[1] = newValue!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: MealDropdownButton(
                            mealType: 'lunch',
                            index: 1,
                            pgModel: pgModel!,
                            selectedPG: selectedPG,
                            onChanged: (newValue) {
                              setState(() {
                                pgModel!.mealSelections[selectedPG]?['lunch']
                                    ?[1] = newValue!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: MealDropdownButton(
                            mealType: 'dinner',
                            index: 1,
                            pgModel: pgModel!,
                            selectedPG: selectedPG,
                            onChanged: (newValue) {
                              setState(() {
                                pgModel!.mealSelections[selectedPG]?['dinner']
                                    ?[1] = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('9AM to 11AM'),
                        Text('12PM to 2PM'),
                        Text('8PM to 10AM'),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //handle the onPressed
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Text(
                'My PG',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              InfoCard(
                icon: Icons.apartment,
                title:
                    'All Rooms: ${pgModel!.pgDetails[selectedPG]?['rooms'] ?? 'N/A'}',
                subtitle:
                    'All floors: ${pgModel!.pgDetails[selectedPG]?['floors'] ?? 'N/A'}',
              ),
              SizedBox(height: 32),
              Text(
                'My Rents',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              InfoCard(
                icon: Icons.monetization_on,
                title:
                    'Members paid: ${pgModel!.pgDetails[selectedPG]?['paid'] ?? 'N/A'}',
                subtitle:
                    'Members unpaid: ${pgModel!.pgDetails[selectedPG]?['unpaid'] ?? 'N/A'}',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Rents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
