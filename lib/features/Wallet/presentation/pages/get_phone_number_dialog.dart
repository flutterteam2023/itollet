/* import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

Future<String?> getPhoneNumberDialog(context) async {
  return showModalBottomSheet<String?>(
    context: context,
    builder: (context) {
      return const BuildGetPhoneNumberAlertDialog();
    },
  );
}

class BuildGetPhoneNumberAlertDialog extends HookWidget {
  const BuildGetPhoneNumberAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final phoneNumberControler = useTextEditingController();
    return Padding(
      padding: const EdgeInsets.all(9),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: const Text(
              "Telefon numaranızı ekleyin",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  print(phoneNumberControler);
                  if (phoneNumberControler.text.isNotEmpty) {
                    Navigator.of(context).pop(phoneNumberControler.text);
                  }
                },
                child: const Text("Kaydet"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {},
              onInputValidated: (bool value) {},
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
                useBottomSheetSafeArea: true,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              initialValue: PhoneNumber(dialCode: "90"),
              textFieldController: phoneNumberControler,
              formatInput: true,
              countries: const ["TR"],
              keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: const OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
          ),
          const Gap(18 * 2),
        ],
      ),
    );
  }
}
 */