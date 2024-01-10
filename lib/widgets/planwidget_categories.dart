import 'package:flutter/material.dart';

class BuildPlansCategory extends StatelessWidget {
  const BuildPlansCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            indicator: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              BuildTab(label: 'Popular'),
              BuildTab(label: 'Family'),
              BuildTab(label: 'Business'),
              BuildTab(label: 'Student'),
            ],
          ),
          Expanded(
            child: TabBarView(
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                ...List.generate(
                  4,
                  (index) => SizedBox(
                    // padding: const EdgeInsets.only(bottom: 620),
                    child: SizedBox(
                      height: 200,
                      width: 300,
                      child: Card(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'India Explorer Pack',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.sim_card_alert,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                'Plan expires on Nov14,2023 7:25pm',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 20),
                                child: Row(
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '3 GB   ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          'Data    ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 50.0,
                                      width: 1.0,
                                      color: Colors.white,
                                      margin: const EdgeInsets.only(
                                        left: 30.0,
                                        right: 20.0,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1000 mins   ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              'voice call    ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 50.0,
                                          width: 1.0,
                                          color: Colors.white,
                                          margin: const EdgeInsets.only(
                                            left: 30.0,
                                            right: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '100 sms   ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              'sms    ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  height: 50,
                                  width: 320,
                                  child: ElevatedButton(
                                    clipBehavior: Clip.hardEdge,
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: const BeveledRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.white))),
                                    onPressed: () {},
                                    child: const Center(
                                      child: Text(
                                        'Buy now -\$16 USD ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildTab extends StatelessWidget {
  const BuildTab({required this.label, super.key});
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      height: 30,
      child: Center(
        child: Text(
          label!,
          // style: getTextStyle(),
        ),
      ),
    );
  }
}
