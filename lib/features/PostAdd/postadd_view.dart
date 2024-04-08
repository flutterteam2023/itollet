import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Categories/providers/category_notifier.dart';
import 'package:itollet/features/PostAdd/post_model.dart';
import 'package:itollet/iberkeugur/Log/log.dart';
import 'package:uuid/uuid.dart';
import 'package:validatorless/validatorless.dart';

@RoutePage()
class PostAddView extends HookConsumerWidget {
  PostAddView({super.key});
  final formKey = GlobalKey<FormState>();
  final list = <String>[];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const locale = 'tr';
    String formatNumber(String s) => NumberFormat.decimalPattern(locale).format(int.parse(s));
    String currency = NumberFormat.compactSimpleCurrency(locale: locale).currencySymbol;

    final cat = ref.read(categoryProvider);

    final tit = useTextEditingController();
    final min = useTextEditingController();
    final max = useTextEditingController();
    final des = useTextEditingController();

    final imageFile = useValueNotifier<File?>(null);
    final categoryID = useValueNotifier<String?>(null);
    final isloading = useState(false);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "İLAN EKLE",
          textScaleFactor: textScaleFactor,
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                _photoSelect(context, imageFile, textScaleFactor),
                const SizedBox(height: 18),
                StatefulBuilder(
                  builder: (context, setStateButton) {
                    return InkWell(
                      onTap: () {
                        setStateButton(() {
                          list.clear();
                        });
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                children: [
                                  const SizedBox(height: 18),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Opacity(
                                        opacity: 0.40,
                                        child: Container(
                                          width: 32,
                                          height: 4,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF79747E),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 18),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return const Divider(
                                              height: 1,
                                              thickness: 1,
                                            );
                                          },
                                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: cat.categories.length,
                                          itemBuilder: (context, index) {
                                            final mainCategory = cat.categories[index];
                                            return ListTile(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                list.add(cat.categories[index].name);
                                                setStateButton(() {});
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) => Column(
                                                    children: [
                                                      Expanded(
                                                        child: SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(height: 18),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Opacity(
                                                                    opacity: 0.40,
                                                                    child: Container(
                                                                      width: 32,
                                                                      height: 4,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFF79747E),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(100),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(height: 18),
                                                              ListView.separated(
                                                                separatorBuilder: (context, index) {
                                                                  return const Divider(
                                                                    height: 1,
                                                                    thickness: 1,
                                                                  );
                                                                },
                                                                shrinkWrap: true,
                                                                physics: const NeverScrollableScrollPhysics(),
                                                                padding: EdgeInsets.only(
                                                                    bottom: MediaQuery.of(context).viewPadding.bottom),
                                                                itemCount: mainCategory.subCategories.length,
                                                                itemBuilder: (context, subindex) => ListTile(
                                                                  leading: CircleAvatar(
                                                                      child: Image.network(
                                                                    mainCategory.subCategories[subindex].iconUrl,
                                                                    height: 24,
                                                                    width: 24,
                                                                  )),
                                                                  onTap: () {
                                                                    setStateButton(() {});
                                                                    if (list.length == 2) {
                                                                      list.removeLast();
                                                                    }
                                                                    list.add(mainCategory.subCategories[subindex].name);
                                                                    categoryID.value =
                                                                        mainCategory.subCategories[subindex].id;
                                                                    setStateButton(() {});
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  title: AutoSizeText(
                                                                    mainCategory.subCategories[subindex].name,
                                                                    textScaleFactor: textScaleFactor,
                                                                  ),
                                                                  trailing: const Icon(
                                                                    Icons.arrow_forward,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              leading: CircleAvatar(
                                                  child: Image.network(
                                                mainCategory.iconUrl,
                                                height: 24,
                                                width: 24,
                                              )),
                                              title: AutoSizeText(
                                                textScaleFactor: textScaleFactor,
                                                mainCategory.name,
                                                maxLines: 1,
                                              ),
                                              trailing: const Icon(
                                                Icons.arrow_forward,
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
                        decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              textAlign: TextAlign.center,
                              textScaleFactor: textScaleFactor,
                              "${list.isEmpty ? "KATEGORİ SEÇ" : ""} ${list.isNotEmpty ? list.toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", " →") : ""}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 18),
                TextFormField(
                  textAlign: TextAlign.center,
                  autocorrect: true,
                  controller: tit,
                  decoration: const InputDecoration(
                    hintText: "İLAN BAŞLIĞI",
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required("Doldurmak zorunludur."),
                  ]),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  textAlign: TextAlign.center,
                  autocorrect: true,
                  controller: min,
                  keyboardType: TextInputType.number,
                  onChanged: (string) {
                    string = formatNumber(string.replaceAll('.', ''));
                    min.value = TextEditingValue(
                      text: string,
                      selection: TextSelection.collapsed(offset: string.length),
                    );
                  },
                  decoration: InputDecoration(hintText: "BÜTÇE EN AZ", suffixText: currency),
                  validator: Validatorless.multiple([
                    Validatorless.number("Sayı girmek zorunludur."),
                    Validatorless.min(1, "1'den daha düşük bir değer giremezsiniz"),
                  ]),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  textAlign: TextAlign.center,
                  autocorrect: true,
                  controller: max,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "BÜTÇE EN FAZLA",
                    suffixText: currency,
                  ),
                  onChanged: (string) {
                    string = formatNumber(string.replaceAll('.', ''));
                    max.value = TextEditingValue(
                      text: string,
                      selection: TextSelection.collapsed(offset: string.length),
                    );
                  },
                  validator: Validatorless.multiple([
                    Validatorless.number("Sayı girmek zorunludur."),
                    Validatorless.min(1, "1'den daha düşük bir değer giremezsiniz"),
                  ]),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  textAlign: TextAlign.center,
                  autocorrect: true,
                  controller: des,
                  keyboardType: TextInputType.multiline,
                  minLines: 4,
                  maxLines: 10,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 9,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    hintText: "AÇIKLAMA GİRİNİZ",
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required("Açıklama girmek zorunludur."),
                  ]),
                ),
                const SizedBox(height: 18),
                InkWell(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      if (tit.text.isNotEmpty &&
                          categoryID.value != null &&
                          imageFile.value != null &&
                          des.text.isNotEmpty) {
                        try {
                          isloading.value = true;
                          final docRef = FirebaseFirestore.instance.collection("posts").doc();
                          final imageData = await XFile(imageFile.value!.path).readAsBytes();
                          final featuredPhoto = imageData;
                          var ref = FirebaseStorage.instance.ref().child(
                                'posts/${docRef.id}',
                              );
                          final id = const Uuid().v1();
                          ref = ref.child(id);

                          final uploadTask = ref.putData(
                            featuredPhoto,
                            SettableMetadata(contentType: 'image/png'),
                          );
                          final snapshot = await uploadTask;
                          final downloadUrl = await snapshot.ref.getDownloadURL();

                          await docRef
                              .set(
                            PostModel(
                              postId: docRef.id,
                              endDate: DateTime.now(),
                              fromUID: FirebaseAuth.instance.currentUser!.uid,
                              title: tit.text,
                              photoUrl: downloadUrl,
                              categoryID: categoryID.value!,
                              balanceMin: min.text.isEmpty ? null : min.text.replaceAll(".", ""),
                              balanceMax: max.text.isEmpty ? null : max.text.replaceAll(".", ""),
                              description: des.text,
                              createdAt: Timestamp.now().toDate(),
                            ).toJson(),
                          )
                              .then((value) {
                            Log.instance.success("Post add success");
                            tit.clear();
                            min.clear();
                            max.clear();
                            des.clear();
                            list.clear();
                            imageFile.value = null;
                            categoryID.value = null;
                            isloading.value = false;
                            context.popRoute();
                          });
                        } catch (e) {
                          Log.instance.error(e.toString());
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: AutoSizeText(
                              textScaleFactor: textScaleFactor,
                              'Hiçbir Alan Boş Bırakılamaz.Resim Eklenmesi Zorunludur!',
                              style: TextStyle(
                                fontSize: 17.sp,
                              )),
                          backgroundColor: secondary,
                        ));
                      }
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 18,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(0.00, -1.00),
                          end: const Alignment(0, 1),
                          colors: [
                            secondary,
                            secondary.withOpacity(.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      child: isloading.value == false
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  textScaleFactor: textScaleFactor,
                                  'KAYDET',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    height: 1.40,
                                  ),
                                ),
                              ],
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Bounceable _photoSelect(BuildContext context, ValueNotifier<File?> imageFile, double textScaleFactor) {
    return Bounceable(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ValueListenableBuilder(
                valueListenable: imageFile,
                builder: (context, _, __) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: 0.40,
                            child: Container(
                              width: 32,
                              height: 4,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF79747E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Bounceable(
                            onTap: () async {
                              final picker = ImagePicker();

                              final image = await picker.pickImage(source: ImageSource.camera);

                              if (image != null) {
                                await ImageCropper().cropImage(
                                  sourcePath: image.path,
                                  cropStyle: CropStyle.rectangle,
                                  aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
                                  aspectRatioPresets: [
                                    CropAspectRatioPreset.square,
                                  ],
                                ).then((value) {
                                  if (value != null) {
                                    final path = value.path;
                                    imageFile.value = File(path);
                                  }
                                  Navigator.of(context).pop();
                                });
                              }
                            },
                            child: SizedBox(
                              width: 64 * 2,
                              height: 64 * 2,
                              child: Card(
                                color: const Color(0xffffd8f5),
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.photo_camera),
                                      AutoSizeText(
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                        textScaleFactor: textScaleFactor,
                                        "Kameradan Ekle",
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Bounceable(
                            onTap: () async {
                              final picker = ImagePicker();

                              final image = await picker.pickImage(source: ImageSource.gallery);

                              if (image != null) {
                                await ImageCropper().cropImage(
                                  sourcePath: image.path,
                                  cropStyle: CropStyle.rectangle,
                                  aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
                                  aspectRatioPresets: [
                                    CropAspectRatioPreset.square,
                                  ],
                                ).then((value) {
                                  if (value != null) {
                                    final path = value.path;
                                    imageFile.value = File(path);
                                  }
                                  Navigator.of(context).pop();
                                });
                              }
                            },
                            child: SizedBox(
                              width: 64 * 2,
                              height: 64 * 2,
                              child: Card(
                                color: const Color(0xffffd8f5),
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.photo_album),
                                      AutoSizeText(
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                        textScaleFactor: textScaleFactor,
                                        "Galeriden Ekle",
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 18),
                    ],
                  );
                });
          },
        );
      },
      child: ValueListenableBuilder(
          valueListenable: imageFile,
          builder: (context, _, __) {
            return Column(
              children: [
                if (imageFile.value != null)
                  Container(
                    width: 64 * 2,
                    height: 64 * 2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        image: FileImage(imageFile.value!),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                if (imageFile.value == null)
                  Container(
                    width: 64 * 2,
                    height: 64 * 2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Iconsax.gallery_add,
                      size: 32,
                    ),
                  ),
              ],
            );
          }),
    );
  }
}
