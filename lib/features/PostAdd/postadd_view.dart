import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Categories/providers/category_notifier.dart';
import 'package:validatorless/validatorless.dart';

@RoutePage()
class PostAddView extends HookConsumerWidget {
  const PostAddView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cat = ref.read(categoryProvider);
    final formKey = GlobalKey<FormState>();
    final tit = useTextEditingController();
    final min = useTextEditingController();
    final max = useTextEditingController();
    final des = useTextEditingController();
    final list = <String>[];
    return Scaffold(
      appBar: AppBar(
        title: const Text("İLAN EKLE"),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                StatefulBuilder(builder: (context, setStateButton) {
                  return TextButton(
                    onPressed: () {
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
                                                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
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
                                                                  setStateButton(() {});
                                                                  Navigator.of(context).pop();
                                                                },
                                                                title: Text(mainCategory.subCategories[subindex].name),
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
                                            title: Text(mainCategory.name),
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
                    child: Text("Kategori seç $list"),
                  );
                }),
                TextFormField(
                  autocorrect: true,
                  controller: tit,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(999),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: secondary, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(999),
                      ),
                    ),
                    hintText: "İlan Başlığı",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(999),
                      ),
                    ),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required("Doldurmak zorunludur."),
                  ]),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  autocorrect: true,
                  controller: min,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(999),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: secondary, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(999),
                      ),
                    ),
                    hintText: "Bütçe en az",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(999),
                      ),
                    ),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.number("Sayı girmek zorunludur."),
                    Validatorless.min(1, "1'den daha düşük bir değer giremezsiniz"),
                  ]),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  autocorrect: true,
                  controller: max,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(999),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: secondary, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(999),
                      ),
                    ),
                    hintText: "Bütçe en fazla",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(999),
                      ),
                    ),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.number("Sayı girmek zorunludur."),
                    Validatorless.min(1, "1'den daha düşük bir değer giremezsiniz"),
                  ]),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  autocorrect: true,
                  controller: des,
                  keyboardType: TextInputType.number,
                  minLines: 4,
                  maxLines: 10,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 9,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: secondary, width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    hintText: "Açıklama giriniz",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required("Açıklama girmek zorunludur."),
                  ]),
                ),
                const SizedBox(height: 18),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'KAYDET',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
