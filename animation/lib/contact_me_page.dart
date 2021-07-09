import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A2E36),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close_outlined,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(60.0, 50.0)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF303036)),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Twitter",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Github"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("LinkedIn"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
