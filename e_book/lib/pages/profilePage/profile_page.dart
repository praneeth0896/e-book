// import 'package:e_book/pages/homePage/home_page.dart';
// import 'package:e_book/routes/base_route.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends BaseRoute<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             profileToolBar(),
//             SizedBox(
//               height: getMediaQueryHeight(context, 0.03),
//             ),
//             profilePic(),
//             SizedBox(
//               height: getMediaQueryHeight(context, 0.04),
//             ),
//             Text(
//               'Details',
//               style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.normal),
//             ),
//             SizedBox(
//               height: getMediaQueryHeight(context, 0.02),
//             ),
//             details(),
//             SizedBox(
//               height: getMediaQueryHeight(context, 0.3),
//             ),
//             submitButton()
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget profileToolBar() {
//     return Container(
//       margin: EdgeInsets.all(2),
//       height: getMediaQueryHeight(context, 0.06),
//       decoration: BoxDecoration(color: Colors.indigoAccent, borderRadius: BorderRadius.all(Radius.circular(30))),
//       child: Row(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(30),
//               ),
//             ),
//             child: IconButton(
//               onPressed: () {
//                 Get.back(result: HomePage());
//               },
//               icon: Icon(
//                 Icons.arrow_back_sharp,
//                 size: 30,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: getMediaQueryWidth(context, 0.25),
//           ),
//           Text(
//             'PROFILE',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
//           ),
//           SizedBox(
//             width: getMediaQueryWidth(context, 0.25),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.logout_outlined),
//             color: Colors.white,
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget profilePic() {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Container(
//               height: getMediaQueryHeight(context, 0.15),
//               width: getMediaQueryWidth(context, 0.3),
//               decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage('lib/assets/images/thor.jpeg'),fit: BoxFit.cover),
//                 color: Colors.transparent,
//                 border: Border.all(color: Colors.black12),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(30),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               right: 0,
//               left: 112,
//               child: IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.camera_alt_outlined,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget details() {
//     final _formKey = GlobalKey<FormState>();
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController ageController = TextEditingController();
//     final TextEditingController mobileController = TextEditingController();
//
//     return GestureDetector(
//       onTap: () {},
//       child: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: ageController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Age',
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your age';
//                   }
//                   final age = int.tryParse(value);
//                   if (age == null || age <= 0) {
//                     return 'Please enter a valid age';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16),
//
//               // Mobile Number Field
//               TextFormField(
//                 controller: mobileController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   labelText: 'Mobile Number',
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your mobile number';
//                   }
//                   if (value.length != 10) {
//                     return 'Please enter a valid 10-digit mobile number';
//                   }
//                   return null;
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget submitButton() {
//     return Padding(
//       padding: EdgeInsets.all(10),
//       child: Container(
//         height: getMediaQueryHeight(context, 0.05),
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.indigoAccent,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: TextButton(
//             onPressed: () {},
//             child: Text(
//               'Submit',
//               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//             )),
//       ),
//     );
//   }
// }
import 'package:e_book/pages/homePage/home_page.dart';
import 'package:e_book/routes/base_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseRoute<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              profileToolBar(),
              SizedBox(
                height: getMediaQueryHeight(context, 0.03),
              ),
              profilePic(),
              SizedBox(
                height: getMediaQueryHeight(context, 0.04),
              ),
              Text(
                'Details',
                style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: getMediaQueryHeight(context, 0.02),
              ),
              details(),
              SizedBox(
                height: getMediaQueryHeight(context, 0.3),
              ),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileToolBar() {
    return Container(
      margin: EdgeInsets.all(2),
      height: getMediaQueryHeight(context, 0.06),
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Get.back(result: HomePage());
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: getMediaQueryWidth(context, 0.25),
          ),
          Text(
            'PROFILE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: getMediaQueryWidth(context, 0.25),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout_outlined),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget profilePic() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: getMediaQueryHeight(context, 0.15),
              width: getMediaQueryWidth(context, 0.3),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/thor.jpeg'),
                  fit: BoxFit.cover,
                ),
                color: Colors.transparent,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 112,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget details() {
    return GestureDetector(
      onTap: () {},
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  final age = int.tryParse(value);
                  if (age == null || age <= 0) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  if (value.length != 10) {
                    return 'Please enter a valid 10-digit mobile number';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: getMediaQueryHeight(context, 0.05),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {

            }
          },
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
