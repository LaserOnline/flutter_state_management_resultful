class Message {
  int message_id;
  String str_message;
  String create_time;

  Message({
    required this.message_id,
    required this.str_message,
    required this.create_time,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message_id: json["message_id"] ?? 0,
      str_message: json["str_message"] ?? "",
      create_time: json["create_time"] ?? "",
    );
  }
}
