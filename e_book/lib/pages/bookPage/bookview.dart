import 'package:e_book/pages/bookPage/bookController.dart';
import 'package:e_book/pages/homePage/home_page.dart';
import 'package:e_book/routes/base_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class Bookview extends StatefulWidget {
  const Bookview({super.key});

  @override
  State<Bookview> createState() => _BookviewState();
}

class _BookviewState extends BaseRoute<Bookview> {
  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          height: getMediaQueryHeight(context, 0.5),
          color: Colors.blueAccent,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back(result: HomePage());
                    },
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Back',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_sharp,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(
                height: getMediaQueryHeight(context, 0.02),
              ),
              Container(
                height: getMediaQueryHeight(context, 0.18),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/images/atomic.jpeg'),
                    )),
              ),
              SizedBox(
                height: getMediaQueryHeight(context, 0.02),
              ),
              Text(
                '${bookController.bookName.value}',
                style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getMediaQueryHeight(context, 0.01),
              ),
              Text(
                'Author : ${bookController.author.value}',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(
                height: getMediaQueryHeight(context, 0.02),
              ),
              Text('${bookController.description.value}'),
              SizedBox(height: getMediaQueryHeight(context, 0.05),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Rating', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                      Obx(() => Text('${bookController.rating.value}', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white))),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Pages', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                      Obx(() => Text('${bookController.pages.value}', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white))),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Language', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                      Obx(() => Text('${bookController.language.value}', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white))),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Bottom Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
           /* Book book = bookController.getBook();
            Get.snackbar("Book Saved", "Book: ${book.name}");*/
          },
          child: Text('Read Book',style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigoAccent,
            padding: EdgeInsets.symmetric(vertical: 15),
            textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
