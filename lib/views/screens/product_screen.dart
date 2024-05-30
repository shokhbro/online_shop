import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/controllers/product_controller.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: productController.getProduct(),
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
            child: Text(snapshot.error.toString()),
          );
        }

        final products = snapshot.data;

        return products == null || products.isEmpty
            ? const Center(
                child: Text("Mahsulotlar mavjud emas!"),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300,
                  childAspectRatio: 0.75,
                ),
                itemCount: 16,
                itemBuilder: (ctx, index) {
                  final product = products[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(product.images[0]),
                        const Gap(5),
                        Row(
                          children: [
                            const Gap(10),
                            Text(
                              "${product.price.toString()} \$",
                              style: const TextStyle(
                                fontFamily: 'Lato',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Gap(10),
                            Expanded(
                              child: Text(
                                product.title,
                                style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const Gap(15),
                        Row(
                          children: [
                            const Gap(10),
                            Text(
                              product.creationAt,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Gap(10),
                            Text(
                              product.updatedAt,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 11,
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
