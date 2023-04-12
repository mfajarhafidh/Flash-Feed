import 'package:flashfeed/infrastructure/navigation/routes.dart';
import 'package:flashfeed/presentation/controllers/category/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/constants/news_constant.dart';

class CategoryPage extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Hello Folks, Welcome to Flash Feed 📖',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Please choose category below, which one do you wanna read? 💡',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                  child: GridView.builder(
                      physics: PageScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listOfCategory.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: GestureDetector(
                            onTap: () async {
                              controller.category.value =
                                  listOfCategory[index]['id']!;
                              Get.toNamed(Routes.LIST_SOURCE,
                                  arguments: controller.category.value);
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Image.asset(
                                    listOfCategory[index]['photo']!,
                                    height: 50,
                                    width: 50,
                                  ),
                                  Text(
                                    listOfCategory[index]['name']!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
