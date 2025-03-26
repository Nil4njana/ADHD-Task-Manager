import 'package:flutter/material.dart';

class InterestSelector extends StatefulWidget {
  @override
  _InterestSelectorState createState() => _InterestSelectorState();
}

class _InterestSelectorState extends State<InterestSelector> {
  List<String> interests = [
    'Music', 'Sports', 'Travel', 'Art', 'Technology', 'Cooking'
  ];
  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Your Interests')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: interests.length,
              itemBuilder: (context, index) {
                final interest = interests[index];
                final isSelected = selectedInterests.contains(interest);
                return ListTile(
                  title: Text(interest),
                  trailing: Icon(
                    isSelected ? Icons.check_circle : Icons.check_circle_outline,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedInterests.remove(interest);
                      } else {
                        selectedInterests.add(interest);
                      }
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                print('Selected Interests: $selectedInterests');
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: InterestSelector(),
//   ));
// }