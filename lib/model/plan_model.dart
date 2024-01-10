import 'dart:convert';

class PlanModel {
  final List<Plans>? plans;
  PlanModel({
    this.plans,
  });

  PlanModel copyWith({
    List<Plans>? plans,
  }) {
    return PlanModel(
      plans: plans ?? this.plans,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'plans': plans!.map((x) => x.toMap()).toList(),
    };
  }

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
      plans: map['plans'] != null
          ? List<Plans>.from(
              (map['plans'] as List<int>).map<Plans?>(
                (x) => Plans.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanModel.fromJson(String source) =>
      PlanModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Plans {
  String? name;
  double? range;
  Plans({
    this.name,
    this.range,
  });

  Plans copyWith({
    String? name,
    double? range,
  }) {
    return Plans(
      name: name ?? this.name,
      range: range ?? this.range,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'range': range,
    };
  }

  factory Plans.fromMap(Map<String, dynamic> map) {
    return Plans(
      name: map['name'] != null ? map['name'] as String : null,
      range: map['range'] != null ? map['range'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Plans.fromJson(String source) =>
      Plans.fromMap(json.decode(source) as Map<String, dynamic>);
}
