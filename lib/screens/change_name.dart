import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/screens/update_name_controller.dart';
import 'package:hydrogang/utilities/validators/validation.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Change Name',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //headings
            Text(
              'This name will appear on several pages',
              style: TextStyle(color: Colors.blueGrey),
            ),
            const SizedBox(
              height: 16,
            ),

            //text field and button
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.username,
                      validator: (value) =>
                          TValidator.validateEmptyText('Username', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: 'Name', prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(height: 50),

                    ///save button
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 5, 91, 12)),
                        onPressed: () => controller.updateUserName(),
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
