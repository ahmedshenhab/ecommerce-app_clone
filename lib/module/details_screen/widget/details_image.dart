import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsImage extends StatefulWidget {
  const DetailsImage({super.key, required this.images});

  final List<String?> images;

  @override
  State<DetailsImage> createState() => _DetailsImageState();
}

class _DetailsImageState extends State<DetailsImage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final validImages = widget.images.whereType<String>().toList();

    if (validImages.isEmpty) {
      return const Center(child: Text("No images available"));
    }

    return Column(
      children: [
        /// Large Image
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.r)),
          child: CachedNetworkImage(
            imageUrl: validImages[selectedIndex],
            fit: BoxFit.cover,
            placeholder:
                (context, url) =>
                    const Center(child: CircularProgressIndicator()),
            errorWidget:
                (context, url, error) => const Icon(Icons.error, size: 40),
          ),
        ),
        const SizedBox(height: 12),

        /// Thumbnail List
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: validImages.length,
            itemBuilder: (context, index) {
              final imageUrl = validImages[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: Container(
                    width: 90.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            selectedIndex == index
                                ? AppColor.blue
                                : Colors.grey.shade300,
                        width: 2.r,
                      ),
                      borderRadius: BorderRadius.circular(17.r),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: imageUrl,
                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
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
