import 'package:flutter/material.dart';
import 'package:nish_hair/provider/auth.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth p = Provider.of<Auth>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Consumer<Auth>(
          builder: (context, auth, child) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => p.signOut(context),
                    child: const Icon(Icons.logout, size: 50),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: Center(
                    child: Text(
                  "HOMEPAGE",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
