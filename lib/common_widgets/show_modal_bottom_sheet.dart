import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itollet/common_widgets/ads_edit_textfield.dart';
import 'package:itollet/common_widgets/offer_balance.dart';
import 'package:itollet/common_widgets/small_filled_balance.dart';
import 'package:itollet/constants/app_image.dart';

class CustomBottomSheet{
  void ModalBottomSheet(BuildContext context){
    showModalBottomSheet(
                    enableDrag: true,
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Container(
                          width: 400.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(22.r),
                                  topRight: Radius.circular(22.r))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 22.w, bottom: 28.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'DÜZENLE',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 128.r,
                                  width: 128.r,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: const AssetImage(
                                            'assets/images/phone.png'),
                                        fit: BoxFit.fill,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5),
                                            BlendMode.srcOver),
                                      )),
                                      child: Center(
                                        child: Bounceable(
                                          onTap: () {
                                            
                                          },
                                          child: SvgPicture.asset(AppImage.pencil)),
                                      ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                AdsEditTextField(
                                  label: 'İlan Başlığı',
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                AdsEditTextField(
                                  label: 'Bütçe',
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                AdsEditTextField(
                                  label: 'Açıklama',
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  height: 55.h,
                                ),
                                Bounceable(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(113.r),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xffFF533C),
                                          Color(0xffFF884B)
                                        ])),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 13.h),
                                      child: Center(
                                        child: Text(
                                          'KAYDET',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
  }
  void AdsModalBottomSheet(BuildContext context){
    showModalBottomSheet(
                    enableDrag: true,
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Container(
                          width: 400.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(22.r),
                                  topRight: Radius.circular(22.r))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 22.w, bottom: 28.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'TEKLİF VER',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                const SmaillFilledBalance(),
                                SizedBox(
                                  height: 18.h,
                                ),
                                const OfferBalance(),
                                SizedBox(height: 26.h,),
                                AdsEditTextField(
                                  label: 'İlan bağlantınız',
                                  onPressed: () {},
                                ),SizedBox(height: 12.h,),
                                Text('Sadece bağlantı paylaşabilirsiniz.',
                                style: TextStyle(
                                  color: Color(0xff49454F),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400
                                ),
                                ),
                                SizedBox(
                                  height: 55.h,
                                ),
                                Bounceable(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(113.r),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xffFF533C),
                                          Color(0xffFF884B)
                                        ])),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 13.h),
                                      child: Center(
                                        child: Text(
                                          'TEKLİF VER (3.75₺)',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
  }
}