import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ProductController.dart';
import '../style/Style.dart';
import '../service/shared_preferences_service.dart';
import '../routes/utils/PageRoute.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "${TextString.pageHome_Appbar_Title}",
          style: TextStyle(
            fontSize: TextFontSize.pageHome_Appbar_Size,
            color: Color.fromARGB(255, 245, 244, 243),
          ),
        ),
        leading: InkWell(
          child: Icon(Icons.message),
          onTap: () => PageMessage.GoPageMessage(),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Remove.Logout();
              },
              child: Icon(Icons.logout_outlined),
            ),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: const Text(
                  "${TextString.pageHome_Product_Recommend}",
                  style: TextStyle(
                      fontSize: TextFontSize.pageHome_Product_Sized_Recommend),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GetX<ProductController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.product.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.product[index].Product_Name}",
                              style: const TextStyle(
                                  fontSize: TextFontSize
                                      .pageHome_Produict_Name_Sized),
                            ),
                            Center(
                              child: Image.network(
                                "${controller.product[index].Product_Images}",
                              ),
                            ),
                            Text(
                              "Price ${controller.product[index].Product_Price}",
                              style: const TextStyle(
                                  fontSize:
                                      TextFontSize.pageHome_Product_Price_Size),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
