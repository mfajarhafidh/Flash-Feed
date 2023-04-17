import 'package:cached_network_image/cached_network_image.dart';
import 'package:flashfeed/presentation/widgets/buttons/back_button_widget.dart';
import 'package:flashfeed/presentation/widgets/home/no_item_home_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../infrastructure/navigation/routes.dart';
import '../../controllers/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Flash Feed",
            style: TextStyle(color: Colors.black),
          ),
          leading: BackButtonWidget(),
        ),
        backgroundColor: Colors.white,
        body: Obx(
          () => controller.notFound.value
              ? NoItemHomeWidget()
              : controller.news.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: () => controller.refreshListArticle(),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Showing the News From ${controller.source.capitalizeFirst!.replaceAll('-', ' ')}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                "Showing ${controller.news.length} Results",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.SEARCH);
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: const Color(0xFFEFEEEE)),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 35, top: 21, bottom: 21),
                                          child: SizedBox(
                                            height: 18,
                                            width: 18,
                                            child: Icon(
                                              Icons.search_sharp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Container(
                                            padding:
                                                const EdgeInsets.only(left: 16),
                                            child: const Text(
                                              "Search News",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF000000)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ListView.builder(
                                  physics: PageScrollPhysics(),
                                  itemCount: controller.news.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () async => Get.toNamed(
                                          Routes.DETAIL_NEWS,
                                          arguments:
                                              controller.news[index].url),
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
                                                controller.news[index]
                                                            .urlToImage ==
                                                        null
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Image.asset(
                                                            'assets/images/img_no_image.png'))
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child:
                                                            CachedNetworkImage(
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
                                                          style:
                                                              Theme.of(context)
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15)),
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
                            ],
                          ),
                        ),
                      ),
                    ),
        ));
  }
}
