import 'package:flutter/material.dart';
import 'package:news_application/models/category_model.dart';
import 'package:news_application/screens/categories.dart';
import 'package:news_application/screens/drawer_widget.dart';
import 'package:news_application/screens/news_Screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(onDrawerClicked),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            )),
        backgroundColor: Color(0xFF39A552),
        title: Text(categoryModel == null ? "News App" : categoryModel!.name),
      ),
      body: categoryModel == null
          ? CategoriesScreen(onCategorySelected)
          : NewsScreen(categoryModel!),
    );
  }

  CategoryModel? categoryModel = null;

  void onDrawerClicked(number) {
    if (number == DrawerWidget.CATEGORY) {
      categoryModel = null;
    } else if (number == DrawerWidget.SETTINGS) {
      // open settings tab
    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void onCategorySelected(category) {
    categoryModel = category;
    setState(() {});
  }
}
