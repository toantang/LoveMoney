class ComputerIP {
  //use real device ro connect with local database.
  //conditions: real device and your computer is the same network and real device is connected with your computer by charging cable
  //static const String computerIP = '192.168.1.225'; // ip address computer of wifi on lab 914
  static const String computerIP = '192.168.1.4'; // ip address computer of wifi at home
}
class EnvConfig {
  static const String baseUrlLocal = "http://10.0.2.2:3000";
  static const String baseUrlProduction = "";
  static const String baseUrlRealDevice = "http://" + ComputerIP.computerIP + ":3000";
}