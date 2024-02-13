import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itollet/constants/constant_colors.dart';

@RoutePage()
class ProfilePhotoChangeView extends HookConsumerWidget {
  const ProfilePhotoChangeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final des = useTextEditingController();
    final imageFile = useValueNotifier<File?>(null);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;


    return Scaffold(
      appBar: AppBar(
        title:  AutoSizeText("PROFİL FOTOĞRAFI",
        textScaleFactor: textScaleFactor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Bounceable(
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
                                          cropStyle: CropStyle.circle,
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
                                    child:  CircleAvatar(
                                      radius: 64,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.photo_camera),
                                            AutoSizeText(
                                              textScaleFactor:textScaleFactor,
                                              "Kameradan Ekle",
                                              textAlign: TextAlign.center,
                                            )
                                          ],
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
                                          cropStyle: CropStyle.circle,
                                          aspectRatioPresets: [
                                            CropAspectRatioPreset.square,
                                          ],
                                        ).then((value) async {
                                          if (value != null) {
                                            final path = value.path;
                                            imageFile.value = File(path);
                                          }
                                          Navigator.of(context).pop();
                                        });
                                      }
                                    },
                                    child:  CircleAvatar(
                                      radius: 64,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.photo_album),
                                            AutoSizeText(
                                              textScaleFactor:textScaleFactor,
                                              "Galeriden Ekle",
                                              textAlign: TextAlign.center,


                                             
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
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
                        CircleAvatar(
                          radius: 64,
                          child: imageFile.value != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(999),
                                  child: Image.file(imageFile.value!),
                                )
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                  ],
                                ),
                        ),
                         AutoSizeText("Fotoğraf Değiştir",
                         textScaleFactor: textScaleFactor,
                         )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.h),
              child: InkWell(
                onTap: () async {
                  FirebaseStorage storage = FirebaseStorage.instance;
                  Reference storageReference =
                      storage.ref().child('profilePhoto/${FirebaseAuth.instance.currentUser?.uid}');

                  UploadTask uploadTask = storageReference.putFile(imageFile.value!);
                  await uploadTask.whenComplete(() => null);

                  String imageUrl = await storageReference.getDownloadURL();

                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .update({'photoUrl': imageUrl});
                  if (kDebugMode) {
                    print('Image uploaded to Firebase Storage: $imageUrl');
                  }
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 9,
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
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          textScaleFactor:textScaleFactor,
                          'KAYDET',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1.40,
                          ),


                         
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
