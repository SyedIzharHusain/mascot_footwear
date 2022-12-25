class Demo {
  Employee? employee;

  Demo({this.employee});

  Demo.fromJson(Map<String, dynamic> json) {
    employee = json['employee'] != null
        ? Employee.fromJson(json['employee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employee != null) {
      data['employee'] = employee!.toJson();
    }
    return data;
  }
}

class Employee {
  String? name;
  int? salary;
  bool? married;

  Employee({this.name, this.salary, this.married});

  Employee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    salary = json['salary'];
    married = json['married'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['salary'] = salary;
    data['married'] = married;
    return data;
  }
}
