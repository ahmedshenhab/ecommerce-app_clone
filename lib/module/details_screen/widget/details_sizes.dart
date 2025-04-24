import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/details_screen/data/models/size_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsSizes extends StatefulWidget {
  const DetailsSizes({super.key, this.sizes, this.onSizeSelected});

  final List<DataSize>? sizes;
  final Function(DataSize selectedSize)? onSizeSelected;

  @override
  State<DetailsSizes> createState() => _DetailsSizesState();
}

class _DetailsSizesState extends State<DetailsSizes> {
  int? selectedIndex;

  void selectSize(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (widget.onSizeSelected != null) {
      widget.onSizeSelected!(widget.sizes![index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizes = widget.sizes ?? [];

    if (sizes.isEmpty) {
      return const SizedBox(); // or a fallback message
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'يرجي اختيار القياس',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 24.sp,
            ),
          ),
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final size = sizes[index];
              final isSelected = index == selectedIndex;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: TextButton(
                  onPressed: () => selectSize(index),
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isSelected
                            // ignore: deprecated_member_use
                            ? AppColor.blue.withOpacity(0.1)
                            : Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: isSelected ? AppColor.blue : AppColor.gray,
                        width: 1.4.r,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    size.size ?? 'N/A',
                    style: TextStyle(
                      color: isSelected ? AppColor.blue : AppColor.black,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16.sp,
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
