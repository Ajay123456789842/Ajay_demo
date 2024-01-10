import 'package:demo/constants/app_colors.dart';
import 'package:demo/model/plan_model.dart';
import 'package:demo/styles/get_text_style.dart';
import 'package:demo/widgets/button.dart';
import 'package:demo/widgets/man_widget.dart';
import 'package:demo/widgets/plans_selector.dart';
import 'package:demo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SelectPlans extends StatefulWidget {
  const SelectPlans({
    required this.label,
    super.key,
  });
  final String? label;
  @override
  State<SelectPlans> createState() => _SelectPlansState();
}

class _SelectPlansState extends State<SelectPlans> {
  PlanModel? selectedPlans;
  @override
  void initState() {
    super.initState();
    selectedPlans = PlanModel(
      plans: [
        Plans(
          name: 'Data',
          range: 100,
        ),
        Plans(
          name: 'Voice',
          range: 100,
        ),
        Plans(
          name: 'SMS',
          range: 100,
        ),
        Plans(
          name: 'Validity',
          range: 100,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            300,
          ),
          child: Container(
            color: Colors.black,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                MyButton(
                  callback: () {
                    Navigator.pop(context);
                  },
                  height: 50,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                TextWidget(
                  widget.label,
                  style: getTextStyle(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                const Spacer(),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //
              Card(
                color: AppColors.white,
                // decoration: BoxDecoration(
                //   borderRadius: const BorderRadius.all(Radius.circular(10)),
                //   border: Border.all(
                //     width: 3,
                //     color: const Color.fromARGB(255, 243, 245, 245),
                //     style: BorderStyle.solid,
                //   ),
                // ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextWidget(
                        'Customize your plan',
                        style: getTextStyle(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: selectedPlans!.plans!.length,
                      itemBuilder: (man, index) {
                        var plan = selectedPlans!.plans![index];
                        return PlansSelector(
                          planModel: plan,
                          callback: (selected) {
                            //
                            selectedPlans!.plans!.removeWhere((element) =>
                                element.name!.toLowerCase() ==
                                selected.name!.toLowerCase());
                            selectedPlans!.plans!.add(selected);
                             selectedPlans?.plans?.forEach(
                              (element) {
                                debugPrint(
                                  element.toMap().toString(),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: BuildPlansCategory(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
