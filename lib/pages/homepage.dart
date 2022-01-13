import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_imp/provider/homepage_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider<HomePageProvider>(
            create: (context) => HomePageProvider(),
            child: Consumer<HomePageProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    Text(
                      provider.eligibilityMsg.toString(),
                      style: TextStyle(
                        color: (provider.isEligible == true)
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: "Enter your age"),
                      onChanged: (val) {
                        provider.checkEligibility(
                          int.parse(val),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
