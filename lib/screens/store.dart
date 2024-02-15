import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrogang/Widgets/errorwidget.dart';
import 'package:hydrogang/Widgets/loader.dart';
import 'package:hydrogang/Widgets/productwidget.dart';
import 'package:hydrogang/controllers/productcontroller.dart';
import 'package:hydrogang/models/categoriesmodel.dart';
import 'package:hydrogang/models/productmodel.dart';

// class Store extends ConsumerWidget {
//   const Store({Key? key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       height: 150,
//       child: ref.watch(getProductsGPTProvider('Horizontal System')).when(
//           data: (data) {
//             return ListView.builder(
//               shrinkWrap: true,
//               physics: const ClampingScrollPhysics(),
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(children: []),
//                 );
//               },
//             );
//           },
//           error: (error, stackTrace) => ErrorText(error: error.toString()),
//           loading: () => const Loader()),
//     );
//   }
// }

class Store extends ConsumerWidget {
  final String categoryname;
  const Store(this.categoryname, {Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 150,
      child: StreamBuilder<List<Product>>(
        stream: ref.watch(getProductsGPTProvider("Horizontal System").stream),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          } else if (snapshot.hasError) {
            return ErrorText(error: snapshot.error.toString());
          } else {
            final products = snapshot.data ?? [];
            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ProductWidget(categoryname)],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
