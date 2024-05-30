import 'package:flutter/material.dart';
import 'package:online_shop/views/screens/category_screen.dart';
import 'package:online_shop/views/screens/product_screen.dart';
import 'package:online_shop/views/screens/users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text("Home Screen"),
        bottom: TabBar(
          labelStyle: const TextStyle(
            fontFamily: 'lato',
            fontSize: 16,
          ),
          controller: _tabController,
          tabs: const [
            Tab(text: 'Products'),
            Tab(text: 'Categories'),
            Tab(text: 'Users'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ProductScreen(),
          CategoriesScreen(),
          UsersScreen(),
        ],
      ),
    );
  }
}
