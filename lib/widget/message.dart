import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/utils/PageRoute.dart';
import '../controller/MessageSendController.dart';
import '../controller/MessageLogadControllert.dart';
import '../controller/MessageDeleteControllert.dart';

class Message extends StatelessWidget {
  final sendController = Get.put(MessageSend());
  final loadController = Get.put(MessageLoadController());
  final deleteController = Get.put(MessageDeleteController());
  final TextEditingController SendController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
          ),
          onTap: () => PageMessage.BackPage(),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: loadController.messageController.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                  "${loadController.messageController[index].create_time}"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width / 2,
                                  child: Text(
                                    "${loadController.messageController[index].str_message}",
                                    style: const TextStyle(
                                      fontSize: 22,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  child: InkWell(
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    ),
                                    onTap: () => deleteController.Delete(
                                        "${loadController.messageController[index].message_id}"),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Color.fromARGB(255, 10, 10, 10),
                  width: 340,
                  child: TextField(
                    controller: SendController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 2, 2, 2)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 3, color: Color.fromARGB(255, 2, 2, 2)),
                      ),
                      fillColor: Color.fromARGB(206, 248, 248, 250),
                      filled: true,
                      hintText: 'Message',
                      hintStyle: TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                      prefixIcon: const Icon(
                        Icons.message,
                        color: Color.fromARGB(255, 5, 5, 5),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width / 8,
                  height: 60,
                  color: Color.fromARGB(255, 3, 3, 3),
                  child: InkWell(
                    child: const Icon(
                      Icons.send,
                      color: Color.fromARGB(255, 250, 249, 249),
                    ),
                    onTap: () => sendController.Send(SendController.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
