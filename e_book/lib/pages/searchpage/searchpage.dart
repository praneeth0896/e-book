import 'dart:async';
import 'package:e_book/pages/homePage/home_page.dart';
import 'package:e_book/routes/base_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'hintTextController.dart';


class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}
class _SearchpageState extends BaseRoute<Searchpage> {
  final HintTextController hintTextController = Get.put(HintTextController());
  final TextEditingController _textController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  var historyItems = <String>['Harry potter and the order of phoenix', 'Good dad Bad dad', 'The wings of fire', 'The alchemist'];

  bool _isHintAtBottom = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _isHintAtBottom = !_isHintAtBottom;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: -1, end: getMediaQueryHeight(context, 0.15)),
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          builder: (context, double height, child) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                height: getMediaQueryHeight(context, 0.35),
                width: double.infinity,
                color: Colors.orangeAccent,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back(result: HomePage());
                          },
                          icon: const Icon(
                            Icons.arrow_back_sharp,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: getMediaQueryWidth(context, 0.06)),
                        const Expanded(
                          child: Text(
                            'Search for new books & interests',
                            style: TextStyle(fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getMediaQueryHeight(context, 0.02)),
                    Container(
                      height: getMediaQueryHeight(context, 0.05),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          _textController.text.isEmpty
                              ? AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            bottom: _isHintAtBottom ? 10 : null,
                            top: !_isHintAtBottom ? 5 : null,
                            left: 10,
                            right: 20,
                            child: Text(
                              'Search for ${hintTextController.hintText.value}',
                              key: ValueKey<String>(hintTextController.hintText.value),
                              style: const TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          )
                              : const SizedBox.shrink(),
                          TextField(
                            controller: _textController,
                            focusNode: _searchFocusNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              hintText: '',
                            ),
                            autofocus: true,
                            onChanged: (text) {
                              setState(() {});
                            },
                            textAlign: TextAlign.start,
                          ),
                          const Positioned(
                            right: 10,
                            top: 0,
                            bottom: 0,
                            child: Icon(Icons.search, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getMediaQueryHeight(context, 0.02)),
                    Row(
                      children: [
                        Text('Recent search results'),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: Divider(
                              color: Colors.black.withOpacity(0.3),
                              height: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: history(historyItems),
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

  Widget history(List<String> historyItems) {
    assert(historyItems.length == 4);
    return Container(
      padding: EdgeInsets.all(6),
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: historyItems.map((item) {
          return Container(
            width: getMediaQueryWidth(context, 0.42),
            height: getMediaQueryHeight(context, 0.044),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              boxShadow: [BoxShadow(color: Colors.white, blurRadius: 2)],
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Image.asset('lib/assets/icons/refresh.png', height: getMediaQueryHeight(context, 0.024), color: Colors.grey.withOpacity(0.5)),
                SizedBox(width: getMediaQueryWidth(context, 0.025)),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}


