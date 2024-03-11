import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Map is here',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lime, // Background color of the button
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25), // Button padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Button border radius
              ),
            ),
            child: Text(
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
