import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen:
          (previous, current) =>
              current is StorySuccessStates ||
              current is StoryErrorStates ||
              current is StoryLoadingStates,
      builder: (context, state) {
        if (state is StoryLoadingStates) {
          return Center(child: CircularProgressIndicator(color: Colors.blue));
        } else if (state is StorySuccessStates) {
          if (state.storyImage.isEmpty) {
            return SizedBox.shrink();
          }
          return SizedBox(
            height: 70.h,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.storyImage.length - 3,
                    itemBuilder:
                        (context, index) => GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: InteractiveViewer(
                                      child: CachedNetworkImage(
                                        imageUrl: state.storyImage[index],
                                        fit: BoxFit.contain,
                                        placeholder:
                                            (context, url) => const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                        errorWidget:
                                            (context, url, error) =>
                                                const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: Container(
                              clipBehavior: Clip.hardEdge,

                              width: 70.w,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),

                                border: Border.all(
                                  color: AppColor.pink,
                                  width: 1.5.r,
                                ),
                              ),
                              child: ClipOval(
                                clipBehavior: Clip.hardEdge,

                                child: CachedNetworkImage(
                                  fit: BoxFit.contain,
                                  imageUrl: state.storyImage[index],
                                  placeholder:
                                      (context, url) => const Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                  errorWidget:
                                      (context, url, error) =>
                                          const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is StoryErrorStates) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
