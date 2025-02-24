import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/home_controller.dart';
import 'package:primeshop/core/class/handledataview.dart';
import 'package:primeshop/core/constants/imageasset.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/linkapi.dart';
import 'package:primeshop/view/widgets/inapp/home/searchButton.dart';
import 'package:primeshop/view/widgets/inapp/home/searchTextField.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.login);
            },
            icon: const SizedBox(
              height: 70,
              width: 30,
              child: Icon(Icons.notifications),
            ),
          ),
        ],
        centerTitle: true,
        title: SizedBox(
          height: 200,
          width: 200,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset("assets/images/Logo-removebg-preview.png"),
          ),
        ),
      ),
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) => HandledataviewRequest(
          statusRequest: controller.statusRequest,
          widget: Center(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Column(
                  children: [
                    const Row(
                      children: [
                        Expanded(child: SearchTextField()),
                        SizedBox(width: 10),
                        Searchbutton(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(255, 35, 37, 48),
                          ),
                          child: const ListTile(
                            title: Text("test"),
                            subtitle: Text("Disasfacount"),
                            leading: Icon(Icons.scale),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              imageAsset.PSlogo,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 90,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 15),
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 222, 106, 242),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height: 50,
                                width: 50,
                                child: SvgPicture.network(
                                  "${AppLinks.imagecategories}/${controller.categories[index]['categories_image']}",
                                ),
                              ),
                              Text(
                                "${controller.categories[index]['categories_name']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // const SizedBox(height: 20),
                    Container(
                      color: Colors.black,
                      height: 100,
                      width: 150,
                      child: Center(
                        child: Stack(
                          children: [
                            Image.asset(
                              imageAsset.PSlogo,
                              fit: BoxFit.contain,
                            ),
                            Container(
                              color: const Color.fromARGB(75, 0, 0,
                                  0), // Overlay with semi-transparency
                            ),
                            const Positioned(
                              top: 10, // Adjust positioning as needed
                              left: 10,
                              child: Text(
                                "afasfa",
                                style: TextStyle(
                                  color:
                                      Colors.white, // White color for contrast
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
