import 'package:cached_network_image/cached_network_image.dart';
import 'package:flashfeed/presentation/controllers/search/search_controller.dart';
import 'package:flashfeed/presentation/widgets/buttons/back_button_widget.dart';
import 'package:flashfeed/presentation/widgets/search/no_item_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/navigation/routes.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(),
        title: Padding(
          padding: EdgeInsets.only(left: 5, right: 30),
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
                hintText: "Search Here", border: InputBorder.none),
            scrollPadding: EdgeInsets.all(5),
            onChanged: (val) {
              controller.findNews.value = val;
            },
            onFieldSubmitted: (value) =>
                controller.getSearchNews(searchParams: value),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () => controller.news.isEmpty
            ? NoItemSearchWidget()
            : controller.isLoading.value
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
                            'Showing "${controller.findNews.value}"',
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
                            "Found ${controller.news.length} Results",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: ListView.builder(
                              physics: PageScrollPhysics(),
                              itemCount: controller.news.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async => Get.toNamed(
                                      Routes.DETAIL_NEWS,
                                      arguments: controller.news[index].url),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      elevation: 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(children: [
                                            controller.news[index].urlToImage ==
                                                    null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.asset(
                                                        'assets/images/img_no_image.png'))
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: CachedNetworkImage(
                                                      placeholder: (context,
                                                              url) =>
                                                          Container(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                      imageUrl: controller
                                                              .news[index]
                                                              .urlToImage ??
                                                          '',
                                                    ),
                                                  ),
                                            Positioned(
                                              bottom: 8,
                                              right: 8,
                                              child: Card(
                                                elevation: 0,
                                                color: Colors.white,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 8),
                                                  child: Text(
                                                      "${controller.news[index].source.name}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall),
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Container(
                                            margin: const EdgeInsets.all(8),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15)),
                                            ),
                                            child: Text(
                                              controller.news[index].title,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
