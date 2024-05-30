import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop/controllers/users_controller.dart';
class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});
  final userContoller = UsersController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userContoller.getUsers(),
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
        final users = snapshot.data;

        return users == null || users.isEmpty
            ? const Center(
                child: Text("Mahsulotlar mavjud emas!"),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 350,
                  childAspectRatio: 0.75,
                ),
                itemCount: 10,
                itemBuilder: (ctx, index) {
                  final user = users[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(user.avatar),
                        Row(
                          children: [
                            const Gap(5),
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Gap(5),
                            Text(
                              user.role,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const Gap(8),
                        Row(
                          children: [
                            const Gap(5),
                            Expanded(
                              child: Text(
                                "email: ${user.email}",
                                style: const TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Gap(5),
                            Text(
                              "password:  ${user.password}",
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const Gap(15),
                        Row(
                          children: [
                            const Gap(5),
                            Text(
                              user.creationAt,
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
