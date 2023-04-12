import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/constants/colors_constants.dart';

class NoItemHomeWidget extends GetWidget {
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
                const Text('Article Not Found!',
                    style: TextStyle(fontSize: 18, color: contentTrySearch)),
                const SizedBox(
                  height: 20,
                ),
                const Text('Please Search on Another News Source',
                    style: TextStyle(fontSize: 18, color: contentTrySearch)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
