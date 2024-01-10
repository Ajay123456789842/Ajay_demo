// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo/screens/region_card.dart';
import 'package:demo/screens/customize_plans.dart';
import 'package:demo/text_field.dart';
import 'package:demo/widgets/build_welcome_note.dart';
import 'package:demo/widgets/button.dart';
import 'package:demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<String> localList = ['India', 'US', 'UK', 'AUS', 'LONDON'];
  final List<String> regionsList = [
    'Asia',
    'Africa',
    'Europe',
    'North America',
    'America'
  ];

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? controller;
  List<String> resultsList = [];
  void performSearch({required String? keyWord, required int currentIndex}) {
    //searching
    List<String> list = [];
    list.addAll(widget.localList);
    list.addAll(widget.regionsList);
    if (keyWord!.isNotEmpty) {
      resultsList = list
          .where(
            (element) => element.toLowerCase().contains(
                  keyWord.toLowerCase(),
                ),
          )
          .toList();
    } else {
      resultsList = list;
    }

    setState(() {});
  }

  final Color? background = const Color.fromARGB(255, 11, 10, 10);
  final Color? fill = const Color.fromARGB(255, 214, 208, 208);
  List<Color>? gradient;
  final double? fillPercent = 73; // fills 56.23% for container from bottom
  double? fillStop;
  final List<String> simTypes = ['Local eSIMs', 'Regional eSIMs'];
  List<double>? stops;
  int selectedIndex = 1;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    resultsList = widget.localList;
    fillStop = (100 - fillPercent!) / 100;
    gradient = [
      background!,
      background!,
      fill!,
      fill!,
    ];
    stops = [0.0, fillStop!, fillStop!, 1.0];
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width * .45;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient!,
            stops: stops,
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                top: 50,
              ),
              child: Row(
                children: [
                  //
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        255,
                        138,
                        138,
                        136,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(
                        width: 3,
                        // color: Colors.green,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Row(
                      children: [
                        MyButton(
                          width: 100,
                          height: 40,
                          applyPrimaryColor: true,
                          callback: () {},
                          label: 'eSIM',
                        ),
                        const SizedBox.square(
                          dimension: 20,
                        ),
                        MyButton(
                          height: 40,
                          callback: () {},
                          label: 'Physical SIM',
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.notification_important,
                    color: Colors.white,
                    size: 35,
                  ),
                  const Spacer(),
                ],
              ),
            ), // search box
            const BuildWelcomeNote(),
            TextFieldWidget(
              controller: controller,
              label: 'search....',
              onSubmit: (value) async {
                debugPrint('entered $value');
                performSearch(
                  keyWord: value,
                  currentIndex: selectedIndex,
                );
              },
            ),
            //
            // const BuildTabBar(),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int index = 1; index <= 2; index++)
                  MyButton(
                    callback: () {
                      setState(
                        () {
                          controller!.clear();
                          selectedIndex = index;
                          performSearch(
                            keyWord: '',
                            currentIndex: index,
                          );
                          resultsList = index == 1
                              ? widget.localList
                              : widget.regionsList;
                        },
                      );
                    },
                    height: 50,
                    width: wid,
                    applyPrimaryColor: index == selectedIndex,
                    color: index == selectedIndex ? Colors.black : Colors.white,
                    label: simTypes[index - 1],
                  ),
              ],
            ),
            if (resultsList.isEmpty)
              SizedBox(
                height: wid * 2,
                child: const Center(
                  child: TextWidget(
                    'No results found ',
                  ),
                ),
              ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: resultsList.length,
              itemBuilder: (context, index) {
                return RegionCard(
                  label: resultsList[index],
                  callback: () async {
                    //
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectPlans(
                          label: resultsList[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
