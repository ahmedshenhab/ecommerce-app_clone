import 'package:ecomerce_app/core/di/di.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/details_screen/cubit/details_screen_cubit.dart';
import 'package:ecomerce_app/module/details_screen/cubit/details_screen_state.dart';
import 'package:ecomerce_app/module/details_screen/data/repo/repo_details_screen.dart';
import 'package:ecomerce_app/module/details_screen/widget/description_product.dart';
import 'package:ecomerce_app/module/details_screen/widget/details_appbar.dart';
import 'package:ecomerce_app/module/details_screen/widget/details_color.dart';
import 'package:ecomerce_app/module/details_screen/widget/details_image.dart';
import 'package:ecomerce_app/module/details_screen/widget/details_sizes.dart';
import 'package:ecomerce_app/module/details_screen/widget/name_product.dart';
import 'package:ecomerce_app/module/details_screen/widget/policies.dart';
import 'package:ecomerce_app/module/details_screen/widget/price_product.dart';
import 'package:ecomerce_app/module/home/data/models/product_by_category_model.dart';
import 'package:ecomerce_app/module/home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, this.product});
  final Products? product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int? selectedColorIndex;
  // List<DataSize>? currentSizes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              Detailsscreencubit(repoDetailsScreen: getIt<RepoDetailsScreen>())
                ..getProductImage(id: widget.product!.id!)
                ..getProductcolors(id: widget.product!.id!),
      child: BlocBuilder<Detailsscreencubit, DetailsscreenState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: detail_appBar(context),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<Detailsscreencubit, DetailsscreenState>(
                      buildWhen:
                          (previous, current) =>
                              current is DetailsImageLoadingState ||
                              current is DetailsImageErrorState ||
                              current is DetailsImageSuccessState,
                      builder: (context, state) {
                        if (state is DetailsImageLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is DetailsImageErrorState) {
                          return DetailsImage(images: []);
                        } else if (state is DetailsImageSuccessState) {
                          final images = state.images;
                          return DetailsImage(images: images);
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),

                    /// Main Product Image
                    SizedBox(height: 15.h),

                    /// Product Name
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        children: [
                          NameProduct(
                            image: widget.product!.imageCover ?? '',
                            price: widget.product!.price ?? 0,
                            name: widget.product!.name ?? 'default',
                            productId: widget.product!.id!,
                          ),
                          SizedBox(height: 15.h),

                          /// Product Description
                          DescriptionProduct(
                            description:
                                widget.product!.description ?? 'default',
                          ),

                          SizedBox(height: 30.h),

                          // Price
                          PriceProduct(
                            price:
                                widget.product!.price?.toString() ?? 'default',
                          ),
                          SizedBox(height: 30.h),

                          // Color Selection
                          BlocBuilder<Detailsscreencubit, DetailsscreenState>(
                            buildWhen:
                                (previous, current) =>
                                    current is DetailsColorLoadingState ||
                                    current is DetailsColorErrorState ||
                                    current is DetailsColorSuccessState,
                            builder: (context, state) {
                              if (state is DetailsColorLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is DetailsColorErrorState) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'حدث خطأ أثناء تحميل الألوان.',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                );
                              } else if (state is DetailsColorSuccessState) {
                                final colors = state.colors;
                                return DetailsColor(
                                  colors: colors,
                                  selectedIndex: selectedColorIndex,
                                  onColorSelected: (index, color) {
                                    setState(() {
                                      selectedColorIndex = index;
                                    });
                                    context.read<Detailsscreencubit>().getSize(
                                      id: color.id!,
                                    ); // 👈 Assuming color.id is the id needed for sizes
                                  },
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),

                          SizedBox(height: 18.h),

                          //القياس
                          BlocBuilder<Detailsscreencubit, DetailsscreenState>(
                            buildWhen:
                                (previous, current) =>
                                    current is DetailsSizeLoadingState ||
                                    current is DetailsSizeErrorState ||
                                    current is DetailsSizeSuccessState,
                            builder: (context, state) {
                              if (state is DetailsSizeLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is DetailsSizeErrorState) {
                                return DetailsSizes(sizes: []);
                              } else if (state is DetailsSizeSuccessState) {
                                final sizes = state.sizes;
                                return DetailsSizes(sizes: sizes ?? []);
                              } else {}

                              return DetailsSizes();
                            },
                          ),

                          SizedBox(height: 18.h),

                          // quantity
                          Align(
                            alignment: Alignment.centerRight,

                            child: Text(
                              'الكمية',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w800,

                                fontSize: 24.sp,
                              ),
                            ),
                          ),

                          SizedBox(height: 18.h),
                          Row(
                            spacing: 10.w,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,

                                height: 40.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.black.withValues(
                                      alpha: 0.3,
                                    ),
                                    width: 1.r,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        context
                                            .read<Detailsscreencubit>()
                                            .changeQuantity('-');
                                      },
                                      icon: Icon(Icons.remove, size: 24.sp),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.all(0),

                                      onPressed: () {
                                        context
                                            .read<Detailsscreencubit>()
                                            .changeQuantity('+');
                                      },
                                      icon: Icon(Icons.add, size: 24.sp),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                height: 40.h,
                                // width: ,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.black.withValues(
                                      alpha: 0.3,
                                    ),
                                    width: 1.r,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: BlocBuilder<
                                  Detailsscreencubit,
                                  DetailsscreenState
                                >(
                                  buildWhen:
                                      (previous, current) =>
                                          current
                                              is DetailsQuantityChangesState,
                                  builder: (context, state) {
                                    if (state is DetailsQuantityChangesState) {
                                      return Text(
                                        context
                                            .read<Detailsscreencubit>()
                                            .quantity
                                            .toString(),
                                      );
                                    } else {
                                      return Text(
                                        context
                                            .read<Detailsscreencubit>()
                                            .quantity
                                            .toString(),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 25.h),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 45.h,

                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.black.withValues(alpha: 0.3),
                                ),
                                color: AppColor.gray.withValues(alpha: 0.18),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart_rounded,
                                    size: 25.w,
                                  ),
                                  Text(
                                    'اضف الي السله',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 30.h),

                          Policies(),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),

                    Footer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
