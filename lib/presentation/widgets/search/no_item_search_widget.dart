import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/constants/colors_constants.dart';
import '../../../domain/core/constants/content_constant.dart';
import '../../../domain/core/constants/snackbar_constants.dart';

class NoItemSearchWidget extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    height: 30,
                    width: 300,
                    child: TextFormField(
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 175,
            ),
            Column(
              children: [
                Image.asset('assets/images/img_search.png',
                    color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  SnackBarConstants.snackbarEmpty,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(ContentConstants.trysearch,
                    style: TextStyle(fontSize: 18, color: contentTrySearch)),
                const Text(ContentConstants.trysearch2,
                    style: TextStyle(fontSize: 18, color: contentTrySearch)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
