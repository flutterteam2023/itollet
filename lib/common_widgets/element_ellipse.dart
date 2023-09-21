import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itollet/constants/constant_colors.dart';

class ElementEllipse extends StatelessWidget {
  const ElementEllipse({
    super.key,
    required this.title,
    required this.colors,
    required this.onTap,
    required this.iconUrl,
  });
  final String title;
  final List<Color> colors;
  final void Function() onTap;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 18 * 3) / 3,
        height: 128,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Bounceable(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: colors),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: CachedNetworkImage(
                        imageUrl: iconUrl,
                        color: Colors.white,
                        progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox.square(
                          dimension: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                            value: downloadProgress.progress,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
