import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:hydrogang/utilities/constants/text_strings.dart';

class TermsCheckBox extends StatelessWidget {
  const TermsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: '${CustomTexts.iAgree} '),
            TextSpan(
                text: '${CustomTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 5, 91, 12))),
            TextSpan(text: '${CustomTexts.and} '),
            TextSpan(
                text: '${CustomTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 5, 91, 12))),
          ],
        )),
      ],
    );
  }
}
