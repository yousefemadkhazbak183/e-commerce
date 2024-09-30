import 'package:e_commerce_app/presentation/home/tabs/home_tab/view/home_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeTab(),
    );
  }
}
