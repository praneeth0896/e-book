import 'dart:ui';

import 'package:e_book/pages/homePage/homepage_controller.dart';
import 'package:e_book/pages/profilePage/profile_page.dart';
import 'package:e_book/pages/searchpage/searchpage.dart';
import 'package:e_book/routes/base_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseRoute<HomePage> {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: buildDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: getMediaQueryWidth(context, 0.015)),
                color: Colors.indigoAccent,
                height: getMediaQueryHeight(context, 0.35),
                child: dashboard(context),
              ),
              SizedBox(height: getMediaQueryHeight(context, 0.04)),
              Padding(
                padding: EdgeInsets.only(right: getMediaQueryWidth(context, 0.75), left: getMediaQueryWidth(context, 0.046)),
                child: Text(
                  'Trending',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 20),
                ),
              ),
              SizedBox(height: getMediaQueryHeight(context, 0.015)),
              trendingList(context),
              Padding(
                padding: EdgeInsets.only(right: getMediaQueryWidth(context, 0.64), left: getMediaQueryWidth(context, 0.05)),
                child: Text(
                  'Your Interests',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 20),
                ),
              ),
              interests(),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboard(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(
              builder: (BuildContext newContext) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(newContext).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu_sharp,
                    color: Colors.white,
                    size: 25,
                  ),
                );
              },
            ),
            Text(
              'E-Book',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.only(right: getMediaQueryWidth(context, 0.02)),
              child: InkWell(
                onTap: () {
                  Get.to(ProfilePage());
                },
                child: Container(
                  width: getMediaQueryWidth(context, 0.09),
                  height: getMediaQueryHeight(context, 0.04),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('lib/assets/images/thor.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: getMediaQueryHeight(context, 0.02)),
        Padding(
          padding: EdgeInsets.only(right: getMediaQueryWidth(context, 0.58)),
          child: Text(
            'Good Morning, MR',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
        ),
        SizedBox(height: getMediaQueryHeight(context, 0.01)),
        Align(
          alignment: AlignmentDirectional(-0.85, 2),
          child: Text(
            'Try to read books and enhance knowledge',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        SizedBox(height: getMediaQueryHeight(context, 0.02)),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 200),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Searchpage();
                },
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, -1.0);
                  var end = Offset.zero;
                  var curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
              ),
            );
          },
          child: Container(
            height: getMediaQueryHeight(context, 0.05),
            width: getMediaQueryWidth(context, 0.95),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0, 0.5),
                        end: Offset(0, 0),
                      ).animate(animation),
                      child: child,
                    );
                  },
                  child: Text(
                    'Search for books & interests',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '',
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: getMediaQueryHeight(context, 0.025)),
        Align(
          alignment: AlignmentDirectional(-0.92, 0),
          child: Text(
            'Topics',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(height: getMediaQueryHeight(context, 0.02)),
        topics(),
      ],
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back(result: HomePage());
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white,
                    )),
                Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Dashboard'),
            onTap: () {
              Get.to(HomePage()); // Navigate to HomePage
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categories'),
            trailing: DropdownButton<String>(
              items: <String>['Fiction', 'Non fiction'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(value),
                  ),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Get.to(ProfilePage());
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () {
              // Navigate to Favorites
            },
          ),
        ],
      ),
    );
  }

  Widget topics() {
    return Container(
      height: getMediaQueryHeight(context, 0.057),
      child: Obx(
        () => ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = controller.items[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Image.asset(item['icon'] as String, width: getMediaQueryWidth(context, 0.04)),
                  SizedBox(width: getMediaQueryWidth(context, 0.025)),
                  Text(item['text'] as String),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget trendingList(BuildContext context) {
    return SizedBox(
      height: getMediaQueryHeight(context, 0.3),
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.trendingItems.length,
          itemBuilder: (context, index) {
            var item = controller.trendingItems[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: trending(item['image']!, item['title']!),
            );
          },
        ),
      ),
    );
  }

  Widget trending(String imagePath, String title) {
    return SizedBox(
      height: getMediaQueryHeight(context, 0.35),
      width: getMediaQueryWidth(context, 0.3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: getMediaQueryHeight(context, 0.22),
                width: getMediaQueryWidth(context, 0.3),
              ),
            ),
            SizedBox(height: getMediaQueryHeight(context, 0.01)),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget interests() {
    return SizedBox(
      height: getMediaQueryHeight(context, 0.8),
      child: Obx(
            () => ListView.builder(
          itemCount: controller.interestsItems.length,
          itemBuilder: (context, index) {
            var item = controller.interestsItems[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              elevation: 5,
              child: Container(
                height: getMediaQueryHeight(context, 0.2),
                width: double.infinity, // Use double.infinity to take full width of parent
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                          ),
                          image: DecorationImage(
                            image: AssetImage(item['image'] as String),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10), // Adjust padding
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'] as String,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              item['description'] as String,
                              style: TextStyle(fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 2,
                              indent: 2,
                              endIndent: 2,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        'Price: ${item['price']}',
                                        style: TextStyle(fontSize: 14, color: Colors.green),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                            size: 15,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Rating: ${item['rating']}',
                                            style: TextStyle(fontSize: 14, color: Colors.amber),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


/* Widget interests() {
    return SizedBox(
      height: getMediaQueryHeight(context, 0.8),
      child: Obx(
        () => ListView.builder(
          itemCount: controller.interestsItems.length,
          itemBuilder: (context, index) {
            var item = controller.interestsItems[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              padding: EdgeInsets.all(8),
              height: getMediaQueryHeight(context, 0.2),
              width: getMediaQueryWidth(context, 0.95),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black12.withOpacity(0.2))],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                          image: AssetImage(item['image'] as String),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] as String,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            item['description'] as String,
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price: ${item['price']}',
                                style: TextStyle(fontSize: 14, color: Colors.green),
                              ),
                              Text(
                                'Rating: ${item['rating']}',
                                style: TextStyle(fontSize: 14, color: Colors.amber),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }*/
}

// import 'package:e_book/pages/profilePage/profile_page.dart';
// import 'package:e_book/pages/searchpage/searchpage.dart';
// import 'package:e_book/routes/base_route.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'homepage_controller.dart';
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends BaseRoute<HomePage> {
//   final HomePageController controller = Get.put(HomePageController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         drawer: buildDrawer(context),
//         body: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(left: getMediaQueryWidth(context, 0.015)),
//                     color: Colors.indigoAccent,
//                     height: getMediaQueryHeight(context, 0.35),
//                     child: dashboard(context),
//                   ),
//                   SizedBox(height: getMediaQueryHeight(context, 0.04)),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       right: getMediaQueryWidth(context, 0.75),
//                       left: getMediaQueryWidth(context, 0.046),
//                     ),
//                     child: Text(
//                       'Trending',
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontWeight: FontWeight.normal,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: getMediaQueryHeight(context, 0.015)),
//                   trendingList(context),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       right: getMediaQueryWidth(context, 0.64),
//                       left: getMediaQueryWidth(context, 0.05),
//                     ),
//                     child: Text(
//                       'Your Interests',
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontWeight: FontWeight.normal,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   interests(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget dashboard(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Builder(
//               builder: (BuildContext newContext) {
//                 return IconButton(
//                   onPressed: () {
//                     Scaffold.of(newContext).openDrawer();
//                   },
//                   icon: Icon(
//                     Icons.menu_sharp,
//                     color: Colors.white,
//                     size: 25,
//                   ),
//                 );
//               },
//             ),
//             Text(
//               'E-Book',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(right: getMediaQueryWidth(context, 0.02)),
//               child: InkWell(
//                 onTap: () {
//                   Get.to(ProfilePage());
//                 },
//                 child: Container(
//                   width: getMediaQueryWidth(context, 0.09),
//                   height: getMediaQueryHeight(context, 0.04),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: AssetImage('lib/assets/images/thor.jpeg'),
//                       fit: BoxFit.cover,
//                     ),
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: getMediaQueryHeight(context, 0.02)),
//         Padding(
//           padding: EdgeInsets.only(right: getMediaQueryWidth(context, 0.58)),
//           child: Text(
//             'Good Morning, MR',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         SizedBox(height: getMediaQueryHeight(context, 0.01)),
//         Align(
//           alignment: AlignmentDirectional(-0.85, 2),
//           child: Text(
//             'Try to read books and enhance knowledge',
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         SizedBox(height: getMediaQueryHeight(context, 0.02)),
//         GestureDetector(
//           onTap: () {
//             Navigator.of(context).push(
//               PageRouteBuilder(
//                 transitionDuration: Duration(milliseconds: 200),
//                 pageBuilder: (context, animation, secondaryAnimation) {
//                   return Searchpage();
//                 },
//                 transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                   var begin = Offset(0.0, -1.0);
//                   var end = Offset.zero;
//                   var curve = Curves.easeInOut;
//
//                   var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//                   return SlideTransition(
//                     position: animation.drive(tween),
//                     child: FadeTransition(
//                       opacity: animation,
//                       child: child,
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//           child: Container(
//             height: getMediaQueryHeight(context, 0.05),
//             width: getMediaQueryWidth(context, 0.95),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             child: Stack(
//               alignment: Alignment.centerLeft,
//               children: [
//                 AnimatedSwitcher(
//                   duration: Duration(milliseconds: 300),
//                   transitionBuilder: (child, animation) {
//                     return SlideTransition(
//                       position: Tween<Offset>(
//                         begin: Offset(0, 0.5),
//                         end: Offset(0, 0),
//                       ).animate(animation),
//                       child: child,
//                     );
//                   },
//                   child: Text(
//                     'Search for books & interests',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: '',
//                   ),
//                 ),
//                 Positioned(
//                   right: 10,
//                   child: Icon(
//                     Icons.search,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: getMediaQueryHeight(context, 0.025)),
//         Align(
//           alignment: AlignmentDirectional(-0.92, 0),
//           child: Text(
//             'Topics',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         SizedBox(height: getMediaQueryHeight(context, 0.02)),
//         topics(),
//       ],
//     );
//   }
//
//   Widget buildDrawer(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.indigoAccent,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     Get.back(result: HomePage());
//                   },
//                   icon: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
//                 ),
//                 Text(
//                   'Menu',
//                   style: TextStyle(color: Colors.white, fontSize: 24),
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text('Dashboard'),
//             onTap: () {
//               Get.to(HomePage()); // Navigate to HomePage
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.category),
//             title: Text('Categories'),
//             trailing: DropdownButton<String>(
//               items: <String>['Fiction', 'Non-fiction'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Text(value),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (String? value) {
//                 // Handle category change
//               },
//             ),
//             onTap: () {
//               // Handle categories click
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text('Profile'),
//             onTap: () {
//               Get.to(ProfilePage()); // Navigate to ProfilePage
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text('Favorites'),
//             onTap: () {
//               // Handle favorites click
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget trending(String imagePath, String title) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: Image.asset(
//         imagePath.isNotEmpty ? imagePath : 'lib/assets/images/default_image.png',
//         height: getMediaQueryHeight(context, 0.22),
//         width: getMediaQueryWidth(context, 0.35),
//         fit: BoxFit.cover,
//       ),
//     );
//   }
//
//   Widget trendingList(BuildContext context) {
//     return SizedBox(
//       height: getMediaQueryHeight(context, 0.3),
//       child: Obx(
//             () {
//           if (controller.trendingItems.isEmpty) {
//             return Center(child: Text('No trending items available'));
//           }
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: controller.trendingItems.length,
//             itemBuilder: (context, index) {
//               var item = controller.trendingItems[index];
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: trending(item['image'] ?? '', item['title'] ?? ''),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget interests() {
//     return Obx(
//           () {
//         if (controller.interestsItems.isEmpty) {
//           return Center(child: Text('No interests available'));
//         }
//         return ListView.builder(
//           shrinkWrap: true,
//           itemCount: controller.interestsItems.length,
//           itemBuilder: (context, index) {
//             var item = controller.interestsItems[index];
//             return interestsListItem(index);
//           },
//         );
//       },
//     );
//   }
//
//   Widget interestsListItem(int index) {
//     var item = controller.interestsItems[index];
//     return ListTile(
//       leading: Image.asset(item['image'] ?? 'lib/assets/images/default_image.png'),
//       title: Text(item['title'] ?? 'Unknown'),
//       subtitle: Text('${item['description'] ?? 'No description'}\nPrice: ${item['price'] ?? 'N/A'}\nRating: ${item['rating'] ?? 'N/A'}'),
//     );
//   }
//
//   Widget topics() {
//     return Container(
//       height: getMediaQueryHeight(context, 0.057),
//       child: Obx(
//             () => ListView.builder(
//           itemCount: controller.items.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             var item = controller.items[index];
//             return Container(
//               margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               padding: EdgeInsets.symmetric(horizontal: 30),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(item['icon'] as String, width: getMediaQueryWidth(context, 0.04)),
//                   SizedBox(width: getMediaQueryWidth(context, 0.025)),
//                   Text(item['text'] as String),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
