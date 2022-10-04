import 'package:flutter/material.dart';

class CompletSend extends StatelessWidget {
  const CompletSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_sharp,
              size: 80,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'تم ارسال الايميل بنحاح',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Color.fromARGB(255, 90, 68, 3),
                primary: Theme.of(context).colorScheme.onSecondary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "رجوع",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
