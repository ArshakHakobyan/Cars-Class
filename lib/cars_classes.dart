enum CarTypes {
  crossover,
  hatchback,
  coupe,
  sedan,
  minivan,
}

enum DrivingWheels {
  fwd,
  rwd,
  fourWd,
}

enum TuningType { amg, m, harmanKardon, lorinser, no }

enum EngineType {
  v4, //?
  v6,
  v8,
  v12,
}

abstract class Vehicle {
  String fuelType;
  String color;
  int weight;

  Vehicle({required this.fuelType, required this.color, required this.weight});
  Vehicle.disel({required this.color, required this.weight})
      : fuelType = "disel";

  void drive() {}
}

class Car extends Vehicle {
  CarTypes type;
  DrivingWheels driveUnit;
  TuningType tuning;
  EngineType engine;

  Car(String fuelType, String color, int weight, this.type, this.driveUnit,
      this.tuning, this.engine)
      : super(fuelType: fuelType, color: color, weight: weight);

  @override
  void drive() {
    print("the Car is driveing");
  }
}

//Mercedess in jargon "Merin"
class Merin extends Car {
  bool compressor;
  bool fourMatic;

  static final instances = <Merin>[
    Merin("Benzin", "red", 1000, CarTypes.sedan, DrivingWheels.rwd,
        TuningType.amg, EngineType.v6, true, true),
    Merin("Benzin", "green", 1000, CarTypes.coupe, DrivingWheels.fwd,
        TuningType.amg, EngineType.v12, true, true)
  ];

  Merin(
      String fuelType,
      String color,
      int weight,
      CarTypes type,
      DrivingWheels driveUnit,
      TuningType tuning,
      EngineType engine,
      this.compressor,
      this.fourMatic)
      : super(fuelType, color, weight, type, driveUnit, tuning, engine);

  factory Merin.instance(int id) {
    if (id == 1) {
      return instances[0];
    } else {
      return instances[1];
    }
  }

  @override
  void drive() {
    print("Merin is driveing");
  }

  void about() {
    print(
        "Mercedes-Benz commonly referred to as Mercedes and sometimes as Benz");
  }
}

//BMW in jargon "Becha"
class Becha extends Car {
  bool turbo;
  bool xDrive;
  Becha(
      String fuelType,
      String color,
      int weight,
      CarTypes type,
      DrivingWheels driveUnit,
      TuningType tuning,
      EngineType engine,
      this.turbo,
      this.xDrive)
      : super(fuelType, color, weight, type, driveUnit, tuning, engine);
  @override
  void drive() {
    print("Becha is driveing");
  }
}

class Audi extends Car {
  bool quattro;
  Audi(
      String fuelType,
      String color,
      int weight,
      CarTypes type,
      DrivingWheels driveUnit,
      TuningType tuning,
      EngineType engine,
      this.quattro)
      : super(fuelType, color, weight, type, driveUnit, tuning, engine);
  @override
  void drive() {
    print("Audi is driving");
  }
}

//
class Eraz extends Car {
  Eraz(String fuelType, String color, int weight, CarTypes type,
      DrivingWheels driveUnit, TuningType tuning, EngineType engine)
      : super(fuelType, color, weight, type, driveUnit, tuning, engine);

  @override
  void drive() {
    print("is Eraz driveing??????");
  }
}

class ClassC extends Merin {
  String yearMade;
  String model;
  var owners = <String>[];

  ClassC(
      String fuelType,
      String color,
      int weight,
      CarTypes type,
      DrivingWheels driveUnit,
      TuningType tuning,
      EngineType engine,
      bool compressor,
      bool fourMatic,
      {required this.yearMade,
      required this.model})
      : super(fuelType, color, weight, type, driveUnit, tuning, engine,
            compressor, fourMatic);

  factory ClassC.fromJson(Map<String, dynamic> fromJson) {
    return ClassC('gas', 'black', 1500, CarTypes.minivan, DrivingWheels.rwd,
        TuningType.amg, EngineType.v6, true, true,
        yearMade: fromJson["yearMade"], model: fromJson["model"]);
  }

  @override
  void drive() {
    print("C class Mersedes is driving");
  }

  get info {
    return ('Your Mercedes-Benz info -Model - $model Yearmade - $yearMade');
  }

  void addOwners(String name) {
    owners.add(name);
  }
}
