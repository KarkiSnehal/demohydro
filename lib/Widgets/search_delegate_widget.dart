import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hydrogang/Widgets/errorwidget.dart';
import 'package:hydrogang/Widgets/loader.dart';
import 'package:hydrogang/controllers/productcontroller.dart';

import 'package:hydrogang/screens/product_details/widgets/product_details.dart';

class SearchProducts extends SearchDelegate {
  final WidgetRef ref;
  SearchProducts(this.ref);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    final products = ref.watch(searchProductsProvider(query));
    return products.when(
        data: (data) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2.0 / 3.0),
              itemCount: data.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final product = data[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetail(product: (product)));
                      },
                      child: Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            Stack(
                              children: [
                                Image.network(
                                  data[index].image,
                                  fit: BoxFit.fitHeight,
                                  height: 150,
                                  width: double.infinity,
                                ),
                                Positioned(
                                    top: 0,
                                    right: 5,
                                    child: Stack(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              // ref
                                              //     .watch(cartControllerProvider
                                              //         .notifier)
                                              //     .addProductToCart(
                                              //         data[index], context);
                                            },
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromARGB(
                                                        255, 5, 91, 12)),
                                                child: const Icon(
                                                  Icons.shopping_cart_outlined,
                                                  color: Colors.white,
                                                  size: 20,
                                                ))),
                                      ],
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: data[index].isAvailable != false
                                        ? const Text("")
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blueGrey,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Text(
                                              "Out Of Stock",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          )),
                              ],
                            ),
                            Center(
                                child: Text(
                              data[index].name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${data[index].price}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              });
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final products = ref.watch(searchProductsProvider(query));
    return products.when(
        data: (data) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2.0 / 3.0),
              itemCount: data.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final product = data[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                      product: product,
                                    ),
                                settings:
                                    RouteSettings(arguments: data[index])));
                      },
                      child: Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            Stack(
                              children: [
                                Image.network(
                                  data[index].image,
                                  fit: BoxFit.fitHeight,
                                  height: 150,
                                  width: double.infinity,
                                ),
                                Positioned(
                                    top: 0,
                                    right: 5,
                                    child: Stack(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              // ref
                                              //     .watch(cartControllerProvider
                                              //         .notifier)
                                              //     .addProductToCart(
                                              //         data[index], context);
                                            },
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromARGB(
                                                        255, 5, 91, 12)),
                                                child: const Icon(
                                                  Icons.shopping_cart_outlined,
                                                  color: Colors.white,
                                                  size: 20,
                                                ))),
                                      ],
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: data[index].isAvailable != false
                                        ? const Text("")
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blueGrey,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Text(
                                              "Out Of Stock",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          )),
                              ],
                            ),
                            Center(
                                child: Text(
                              data[index].name,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            )),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\रु ${data[index].price}/-",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              });
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
