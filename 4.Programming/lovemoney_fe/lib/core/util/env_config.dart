class ComputerIP {
  //static const String computerIP = '192.168.1.225'; // ip address of wifi on lab 914
  static const String computerIP = '192.168.1.4'; // ip address of wifi at home
}
class EnvConfig {
  static const String baseUrlLocal = "http://10.0.2.2:3000";
  static const String baseUrlProduction = "";
  static const String baseUrlRealDevice = "http://" + ComputerIP.computerIP + ":3000"; //192.168.1.22 is your computer ip address
}