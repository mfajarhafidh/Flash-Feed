import 'package:flashfeed/presentation/controllers/list_source/list_source_controller.dart';
import 'package:flashfeed/presentation/widgets/buttons/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/navigation/routes.dart';

class ListSourcePage extends GetView<ListSourceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButtonWidget(),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Flash Feed',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Showing the List Source of ${controller.category.capitalizeFirst} Category",
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
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Showing ${controller.sourceList.length} Results",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Form(
                          key: controller.listSourceKey,
                          child: Container(
                            padding: const EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  icon: Icon(Icons.search_sharp),
                                  hintText: "Search News Source",
                                  border: InputBorder.none),
                              scrollPadding: EdgeInsets.all(5),
                              onChanged: (value) {
                                controller.searchForItem(searchParam: value);
                              },
                              onFieldSubmitted: (value) =>
                                  controller.searchForItem(searchParam: value),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: PageScrollPhysics(),
                          itemCount: controller.sourceList.length,
                          itemBuilder: (context, index) {
                            final source = controller.sourceList[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.HOME, arguments: source.id);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 10,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        source.name!,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    subtitle: Text(
                                      source.description!,
                                      textAlign: TextAlign.justify,
                                    ),
                                    trailing:
                                        Text('Language ${source.language!}'),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
