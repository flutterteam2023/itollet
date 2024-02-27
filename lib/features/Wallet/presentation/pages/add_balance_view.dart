// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/features/Wallet/presentation/pages/get_iframe.dart';

@RoutePage()
class AddBalanceView extends ConsumerWidget {
  const AddBalanceView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Bakiye Yükle",
          textScaleFactor: textScaleFactor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                textScaleFactor: textScaleFactor,
                "YÜKLENECEK MİKTARI SEÇİNİZ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 18,
                runSpacing: 18,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Bounceable(
                    onTap: () async {
                      String? phoneNumber;
                      String? address;

                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return SingleChildScrollView(
                              child: Container(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                              bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Ödeme Aşaması İçin Gerekli Bilgiler",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 16),
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    print(number.phoneNumber);
                                    phoneNumber = number.phoneNumber;
                                  },
                                  onInputValidated: (bool value) {
                                    print(value);
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                    useBottomSheetSafeArea: true,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle: const TextStyle(color: Colors.black),
                                  initialValue: PhoneNumber(
                                    phoneNumber: phoneNumber,
                                    isoCode: "TR",
                                  ),
                                  formatInput: true,
                                  keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                  onSaved: (PhoneNumber number) {
                                    print('On Saved: $number');
                                  },
                                ),
                                const Gap(16),
                                TextField(
                                  onChanged: (value) {
                                    address = value;
                                  },
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: "Adres",
                                    contentPadding: const EdgeInsets.all(16),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(const Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                  ),
                                ),
                                const Gap(16),
                                FilledButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: AutoSizeText(
                                    "Tamam",
                                    textScaleFactor: textScaleFactor,
                                  ),
                                ),
                                Gap(MediaQuery.of(context).viewPadding.bottom),
                              ],
                            ),
                          ));
                        },
                      ).then((value) async {
                        if (phoneNumber != null && address != null) {
                          await getIframe(context, 50, phoneNumber!, address!);
                        }
                      });
                    },
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.purple.withOpacity(.6),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              "50₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              "Yükle",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () async {
                      String? phoneNumber;
                      String? address;

                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return SingleChildScrollView(
                              child: Container(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                              bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Ödeme Aşaması İçin Gerekli Bilgiler",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 16),
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    print(number.phoneNumber);
                                    phoneNumber = number.phoneNumber;
                                  },
                                  onInputValidated: (bool value) {
                                    print(value);
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                    useBottomSheetSafeArea: true,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle: const TextStyle(color: Colors.black),
                                  initialValue: PhoneNumber(
                                    phoneNumber: phoneNumber,
                                    isoCode: "TR",
                                  ),
                                  formatInput: true,
                                  keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                  onSaved: (PhoneNumber number) {
                                    print('On Saved: $number');
                                  },
                                ),
                                const Gap(16),
                                TextField(
                                  onChanged: (value) {
                                    address = value;
                                  },
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: "Adres",
                                    contentPadding: const EdgeInsets.all(16),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(const Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                  ),
                                ),
                                const Gap(16),
                                FilledButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: AutoSizeText(
                                    "Tamam",
                                    textScaleFactor: textScaleFactor,
                                  ),
                                ),
                                Gap(MediaQuery.of(context).viewPadding.bottom),
                              ],
                            ),
                          ));
                        },
                      ).then((value) async {
                        if (phoneNumber != null && address != null) {
                          await getIframe(context, 100, phoneNumber!, address!);
                        }
                      });
                    },
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.purple.withOpacity(.8),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              "100₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              "Yükle",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () async {
                      String? phoneNumber;
                      String? address;

                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return SingleChildScrollView(
                              child: Container(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                              bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Ödeme Aşaması İçin Gerekli Bilgiler",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 16),
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    print(number.phoneNumber);
                                    phoneNumber = number.phoneNumber;
                                  },
                                  onInputValidated: (bool value) {
                                    print(value);
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                    useBottomSheetSafeArea: true,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle: const TextStyle(color: Colors.black),
                                  initialValue: PhoneNumber(
                                    phoneNumber: phoneNumber,
                                    isoCode: "TR",
                                  ),
                                  formatInput: true,
                                  keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                  onSaved: (PhoneNumber number) {
                                    print('On Saved: $number');
                                  },
                                ),
                                const Gap(16),
                                TextField(
                                  onChanged: (value) {
                                    address = value;
                                  },
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: "Adres",
                                    contentPadding: const EdgeInsets.all(16),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(const Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                  ),
                                ),
                                const Gap(16),
                                FilledButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: AutoSizeText(
                                    "Tamam",
                                    textScaleFactor: textScaleFactor,
                                  ),
                                ),
                                Gap(MediaQuery.of(context).viewPadding.bottom),
                              ],
                            ),
                          ));
                        },
                      ).then((value) async {
                        if (phoneNumber != null && address != null) {
                          await getIframe(context, 200, phoneNumber!, address!);
                        }
                      });
                    },
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.purple.withOpacity(1),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              "200₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              "Yükle",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () async {
                      String? phoneNumber;
                      String? address;

                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return SingleChildScrollView(
                              child: Container(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                              bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Ödeme Aşaması İçin Gerekli Bilgiler",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 16),
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    print(number.phoneNumber);
                                    phoneNumber = number.phoneNumber;
                                  },
                                  onInputValidated: (bool value) {
                                    print(value);
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                    useBottomSheetSafeArea: true,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle: const TextStyle(color: Colors.black),
                                  initialValue: PhoneNumber(
                                    phoneNumber: phoneNumber,
                                    isoCode: "TR",
                                  ),
                                  formatInput: true,
                                  keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                                  inputBorder: const OutlineInputBorder(),
                                  onSaved: (PhoneNumber number) {
                                    print('On Saved: $number');
                                  },
                                ),
                                const Gap(16),
                                TextField(
                                  onChanged: (value) {
                                    address = value;
                                  },
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: "Adres",
                                    contentPadding: const EdgeInsets.all(16),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(const Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                    ),
                                  ),
                                ),
                                const Gap(16),
                                FilledButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: AutoSizeText(
                                    "Tamam",
                                    textScaleFactor: textScaleFactor,
                                  ),
                                ),
                                Gap(MediaQuery.of(context).viewPadding.bottom),
                              ],
                            ),
                          ));
                        },
                      ).then((value) async {
                        if (phoneNumber != null && address != null) {
                          await getIframe(context, 20, phoneNumber!, address!);
                        }
                      });
                    },
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.purple.withOpacity(1),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              "20₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              "Yükle",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () async {
                      String? phoneNumber;
                      String? address;

                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 16,
                                bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Ödeme Aşaması İçin Gerekli Bilgiler",
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 16),
                                  InternationalPhoneNumberInput(
                                    onInputChanged: (PhoneNumber number) {
                                      print(number.phoneNumber);
                                      phoneNumber = number.phoneNumber;
                                    },
                                    onInputValidated: (bool value) {
                                      print(value);
                                    },
                                    selectorConfig: const SelectorConfig(
                                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                      useBottomSheetSafeArea: true,
                                    ),
                                    ignoreBlank: false,
                                    autoValidateMode: AutovalidateMode.disabled,
                                    selectorTextStyle: const TextStyle(color: Colors.black),
                                    initialValue: PhoneNumber(
                                      phoneNumber: phoneNumber,
                                      isoCode: "TR",
                                    ),
                                    formatInput: true,
                                    keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                                    inputBorder: const OutlineInputBorder(),
                                    onSaved: (PhoneNumber number) {
                                      print('On Saved: $number');
                                    },
                                  ),
                                  const Gap(16),
                                  TextField(
                                    onChanged: (value) {
                                      address = value;
                                    },
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: "Adres",
                                      contentPadding: const EdgeInsets.all(16),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(const Radius.circular(8)),
                                        borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                                        borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                                        borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                                        borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                                        borderSide: BorderSide(color: Colors.grey.withOpacity(.6)),
                                      ),
                                    ),
                                  ),
                                  const Gap(16),
                                  FilledButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: AutoSizeText(
                                      "Tamam",
                                      textScaleFactor: textScaleFactor,
                                    ),
                                  ),
                                  Gap(MediaQuery.of(context).viewPadding.bottom),
                                ],
                              ),
                            ),
                          );
                        },
                      ).then((value) async {
                        if (phoneNumber != null && address != null) {
                          await getIframe(context, 10, phoneNumber!, address!);
                        }
                      });
                    },
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.purple.withOpacity(1),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              "10₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              "Yükle",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
