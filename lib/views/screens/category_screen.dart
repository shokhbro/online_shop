import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/controllers/categories_controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final categoriesController = CategoriesController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categoriesController.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: Text("Mahsulotlar topilmadi!"),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.hasError.toString()),
          );
        }
        final categories = snapshot.data;

        return categories == null || categories.isEmpty
            ? const Center(
                child: Text("Mahsulotlar mavjud emas!"),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 260,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6,
                itemBuilder: (ctx, index) {
                  final category = categories[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(category.image),
                        Row(
                          children: [
                            const Gap(5),
                            Text(
                              category.name,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const Gap(15),
                        Row(
                          children: [
                            const Gap(5),
                            Text(
                              category.creationAt,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
