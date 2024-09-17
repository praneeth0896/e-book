import 'package:e_book/routes/base_route.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends BaseRoute<WelcomePage> {
  String heading = 'Disclaimer';
  String text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat';
  String subtext = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.indigo.withOpacity(0.8),
                  height: getMediaQueryHeight(context, 0.6),
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 2),
                        child: Text(
                          'Welcome',
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25, color: Colors.white60),
                        ),
                      ),
                      Image.asset(
                        'lib/assets/icons/books.png',
                      ),
                      // SizedBox(
                      //   height: getMediaQueryHeight(context, 0.01),
                      // ),
                      Text(
                        'E-Books',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: getMediaQueryHeight(context, 0.01),),
                      Text(subtext,style: TextStyle(fontSize: 14,color: Colors.white),)
                    ],
                  ),
                ),
                SizedBox(height: getMediaQueryHeight(context, 0.02),),
                Text(heading,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: getMediaQueryHeight(context, 0.01),),
                Padding(padding: EdgeInsets.all(10),child:Text(text,style: TextStyle(fontSize: 17),)),
                SizedBox(height: getMediaQueryHeight(context, 0.02),),
                button()
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget button(){
    return MaterialButton(onPressed: (){},color: Colors.indigoAccent,height: getMediaQueryHeight(context, 0.05),minWidth: getMediaQueryWidth(context, 0.9),shape: RoundedRectangleBorder(),child: Text('Continue',style: TextStyle(fontSize: 20,color: Colors.white),),);
  }
}
