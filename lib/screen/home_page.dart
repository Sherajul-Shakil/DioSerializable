import 'package:dio_and_json/screen/list_user_screen.dart';
import 'package:dio_and_json/screen/single_user_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleUserScreen()));
                  },
                  child: Text("Single User")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListUserScreen()),
                    );
                  },
                  child: Text("List Of User"))
            ],
          ),
        ),
      ),
    );
  }
}
