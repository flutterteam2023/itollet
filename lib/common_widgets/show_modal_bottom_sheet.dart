import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itollet/common_widgets/ads_edit_textfield.dart';
import 'package:itollet/common_widgets/offer_balance.dart';
import 'package:itollet/common_widgets/small_filled_balance.dart';
import 'package:itollet/constants/app_image.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';
import 'package:validatorless/validatorless.dart';

class CustomBottomSheet {
  Future<bool?> modalBottomSheet(
      BuildContext context,
      TextEditingController titleController,
      TextEditingController maxbalance,
      TextEditingController minbalance,
      TextEditingController descriptionController,
      PostModel postmodel) async {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    const locale = 'tr';
    String formatNumber(String s) => NumberFormat.decimalPattern(locale).format(int.parse(s));
    String currency = NumberFormat.compactSimpleCurrency(locale: locale).currencySymbol;

    File? image;
    ValueNotifier<ImageProvider?> myImageProvider = ValueNotifier(null);
    titleController.text = postmodel.title;
    maxbalance.text = postmodel.balanceMax.toString();
    minbalance.text = postmodel.balanceMin.toString();
    descriptionController.text = postmodel.description!;
    ValueNotifier<bool> isloading = ValueNotifier(false);
    return await showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.r),
                  topRight: Radius.circular(22.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        textScaleFactor: textScaleFactor,
                        'DÜZENLE',
                        style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Bounceable(
                        onTap: () {
                          final postImage = ImagePicker().pickImage(source: ImageSource.gallery);
                          postImage.then((value) {
                            image = File(value!.path);
                            myImageProvider.value = FileImage(image!);
                          });
                        },
                        child: ValueListenableBuilder(
                            valueListenable: myImageProvider,
                            builder: (context, _, __) {
                              return Container(
                                height: 128.r,
                                width: 128.r,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: myImageProvider.value ?? NetworkImage(postmodel.photoUrl!),
                                      fit: BoxFit.fill,
                                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcOver),
                                    )),
                                child: Center(
                                  child: Bounceable(onTap: () {}, child: SvgPicture.asset(AppImage.pencil)),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    textAlign: TextAlign.center,
                    autocorrect: true,
                    controller: titleController,
                    decoration: InputDecoration(labelText: "İLAN BAŞLIĞI", suffixText: currency),
                    validator: Validatorless.multiple([
                      Validatorless.required("İlan başlığı girmek zorunludur."),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    textAlign: TextAlign.center,
                    autocorrect: true,
                    controller: minbalance,
                    keyboardType: TextInputType.number,
                    onChanged: (string) {
                      string = formatNumber(string.replaceAll('.', ''));
                      minbalance.value = TextEditingValue(
                        text: string,
                        selection: TextSelection.collapsed(offset: string.length),
                      );
                    },
                    decoration: InputDecoration(labelText: "BÜTÇE EN AZ", suffixText: currency),
                    validator: Validatorless.multiple([
                      Validatorless.number("Sayı girmek zorunludur."),
                      Validatorless.min(1, "1'den daha düşük bir değer giremezsiniz"),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    textAlign: TextAlign.center,
                    autocorrect: true,
                    controller: maxbalance,
                    keyboardType: TextInputType.number,
                    onChanged: (string) {
                      string = formatNumber(string.replaceAll('.', ''));
                      maxbalance.value = TextEditingValue(
                        text: string,
                        selection: TextSelection.collapsed(offset: string.length),
                      );
                    },
                    decoration: InputDecoration(labelText: "BÜTÇE EN FAZLA", suffixText: currency),
                    validator: Validatorless.multiple([
                      Validatorless.number("Sayı girmek zorunludur."),
                      Validatorless.min(1, "1'den daha düşük bir değer giremezsiniz"),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    textAlign: TextAlign.center,
                    autocorrect: true,
                    controller: descriptionController,
                    keyboardType: TextInputType.number,
                    onChanged: (string) {
                      string = formatNumber(string.replaceAll('.', ''));
                      descriptionController.value = TextEditingValue(
                        text: string,
                        selection: TextSelection.collapsed(offset: string.length),
                      );
                    },
                    minLines: 5,
                    maxLines: 15,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      labelText: "AÇIKLAMA",
                      suffixText: currency,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.number("Sayı girmek zorunludur."),
                      Validatorless.min(1, "1'den daha düşük bir değer giremezsiniz"),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  Bounceable(
                    onTap: () async {
                      isloading.value = true;
                      final storage = FirebaseStorage.instance.ref().child('posts/${postmodel.postId}');
                      if (image != null) {
                        await storage.putFile(image!);
                        final url = await storage.getDownloadURL();
                        FirebaseFirestore.instance.collection('posts').doc(postmodel.postId).update({
                          'title': titleController.text,
                          'balanceMax': maxbalance.text.replaceAll(".", ""),
                          'balanceMin': minbalance.text.replaceAll(".", ""),
                          'description': descriptionController.text,
                          'photoUrl': url
                        }).then((value) {
                          isloading.value = false;
                          Navigator.pop(context, true);
                        });
                      } else {
                        await FirebaseFirestore.instance.collection('posts').doc(postmodel.postId).update({
                          'title': titleController.text,
                          'balanceMax': maxbalance.text.replaceAll(".", ""),
                          'balanceMin': minbalance.text.replaceAll(".", ""),
                          'description': descriptionController.text,
                        }).then((value) {
                          isloading.value = false;
                          Navigator.pop(context, true);
                        });
                      }
                    },
                    child: ValueListenableBuilder(
                        valueListenable: isloading,
                        builder: (context, _, __) {
                          return Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(113.r), color: secondary),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 13.h),
                              child: Center(
                                child: isloading.value == false
                                    ? AutoSizeText(
                                        textScaleFactor: textScaleFactor,
                                        'KAYDET',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w400),
                                      )
                                    : const CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }

  void AdsModalBottomSheet(
      BuildContext context, CategoryModel categoryModel, TextEditingController controller, void Function()? onTap) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.r),
                  topRight: Radius.circular(22.r),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
                bottom: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 18),
                  Center(
                    child: AutoSizeText(
                      textScaleFactor: textScaleFactor,
                      'TEKLİF VER',
                      style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SmaillFilledBalance(
                    categoryModel,
                  ),
                  const SizedBox(height: 18),
                  const OfferBalance(),
                  const SizedBox(height: 18),
                  AdsEditTextField(
                    controller: controller,
                    label: 'İlan bağlantınız',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 18),
                  AutoSizeText(
                    textScaleFactor: textScaleFactor,
                    'Sadece bağlantı paylaşabilirsiniz.',
                    style: TextStyle(
                      color: const Color(0xff49454F),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Bounceable(
                    onTap: onTap,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(113.r),
                        gradient: LinearGradient(
                          colors: [
                            categoryModel.primaryColor,
                            categoryModel.secondaryColor,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 13.h),
                        child: Center(
                          child: AutoSizeText(
                            textScaleFactor: textScaleFactor,
                            'TEKLİF VER (3.75₺)',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
