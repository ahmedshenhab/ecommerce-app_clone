
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/details_screen/data/models/product_color_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsColor extends StatelessWidget {
  final List<DataColor>? colors;
  final int? selectedIndex;
  final Function(int index, DataColor color) onColorSelected;

  const DetailsColor({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'يرجي اختيار اللون',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 24.sp,
            ),
          ),
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: colors?.length ?? 0,
            itemBuilder: (context, index) {
              final colorItem = colors![index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () => onColorSelected(index, colorItem),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Container(
                    width: 80.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? AppColor.blue : Colors.transparent,
                        width: 2.r,
                      ),
                      borderRadius: BorderRadius.circular(17.r),
                    ),
                    child: Container(
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: colorItem.imageUrl ?? '',
                        placeholder:
                            (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        errorWidget:
                            (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
