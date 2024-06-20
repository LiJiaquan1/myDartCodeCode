import 'dart:math';

class Spacecraft {
  String name;
  DateTime? launchDate; // 可选的发射日期

  // 只读非最终属性
  int? get launchYear => launchDate?.year; // 发射年份

  // 构造函数，利用语法糖为成员变量赋值
  Spacecraft(this.name, this.launchDate) {
    // 初始化代码可以放在这里
  }

  // 命名构造函数，用于转发给默认构造函数
  Spacecraft.unlaunched(String name) : this(name, null);

  // 方法
  void describe() {
    print('Spacecraft: $name');
    // 类型推断对getter方法不起作用
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years 年前)');
    } else {
      print('未发射');
    }
  }
}

void main() {
  var voyager = Spacecraft('旅行者1号', DateTime(1977, 9, 5));
  voyager.describe(); // 输出旅行者1号的发射信息

  var voyager3 = Spacecraft.unlaunched('旅行者3号');
  voyager3.describe(); // 输出旅行者3号的发射信息
}
