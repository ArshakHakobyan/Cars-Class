import "package:cars_classes/cars_classes.dart";
import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {
  //Json file path
  String curFilePath = ("${Directory.current.path}/lib/carProps.json");
  //gettin file as jsonString
  String jsonString = File(curFilePath).readAsStringSync();
  //converting jsonString to Map
  Map<String, dynamic> jsonToMap = jsonDecode(jsonString);

  ClassC car = ClassC("Benzin", "Black", 1340, CarTypes.hatchback,
      DrivingWheels.fwd, TuningType.amg, EngineType.v8, true, true,
      yearMade: "2000", model: "C180");
  print(car.info);
  //
  ClassC c220 = ClassC.fromJson(jsonToMap);
  print(c220.info);
}
