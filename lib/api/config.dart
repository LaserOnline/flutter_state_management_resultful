const IP = "192.168.1.70";

class Path {
  static const String requestLogin =
      "http://${IP}/apache/PHP-Api-Restful/lib/post/login.php";
  static const String requestProduct =
      "http://${IP}/apache/PHP-Api-Restful/lib/get/get.php";
  static const String requestMessageSend =
      "http://${IP}/apache/PHP-Api-Restful/lib/post/message.php";
  static const String requestMessageLoad =
      "http://${IP}/apache/PHP-Api-Restful/lib/get/get_message.php";
  static const String requesMessageDelete =
      "http://${IP}/apache/PHP-Api-Restful/lib/delete/delete.php";
}
