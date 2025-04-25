import 'dart:developer';

import 'package:ecomerce_app/cities.dart';
import 'package:ecomerce_app/core/di/di.dart';
import 'package:ecomerce_app/core/services/shared_prefrence/cach_helper.dart';
import 'package:ecomerce_app/key_constant.dart';
import 'package:ecomerce_app/module/details_screen/data/models/order_model.dart';
import 'package:ecomerce_app/module/details_screen/widget/show_bottum_sheet/cubit.dart';
import 'package:ecomerce_app/module/details_screen/widget/show_bottum_sheet/repo.dart';
import 'package:ecomerce_app/module/details_screen/widget/show_bottum_sheet/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowBottumSheetForm extends StatefulWidget {
  const ShowBottumSheetForm({super.key});

  @override
  State<ShowBottumSheetForm> createState() => _ShowBottumSheetFormState();
}

class _ShowBottumSheetFormState extends State<ShowBottumSheetForm> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final formState = GlobalKey<FormState>();

  Map<String, dynamic>? selectedCity;
  Map<String, dynamic>? selectedArea;
  int? selectedCityId;
  int? selectedAreaId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowBottumCubit(getIt<RepoShowBottum>()),
      child: Builder(
        builder:
            (context) => BlocListener<ShowBottumCubit, ShowBottumState>(
              listener: (context, state) {
                if (state is DetailsOrderSuccessState) {
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: Text('تم الطلب بنجاح'),
                          content: Text('رقم الطلب: ${state.orderId}'),
                        ),
                  ).then((_) {
                    if (context.mounted) Navigator.pop(context);
                  });
                } else if (state is DetailsOrderErrorState) {
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: Text('فشل في الطلب'),
                          content: Text(state.message),
                        ),
                  );
                }
              },
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formState,
                    child: Column(
                      children: [
                        TextFormField(
                          validator:
                              (value) =>
                                  value == null || value.isEmpty
                                      ? 'الاسم مطلوب'
                                      : null,
                          controller: nameController,
                          decoration: InputDecoration(labelText: 'الاسم'),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator:
                              (value) =>
                                  value == null || value.isEmpty
                                      ? 'رقم الهاتف مطلوب'
                                      : null,
                          controller: phoneController,
                          decoration: InputDecoration(labelText: 'رقم الهاتف'),
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField<Map<String, dynamic>>(
                          validator:
                              (value) =>
                                  value == null || value.isEmpty
                                      ? 'المحافظة مطلوبة'
                                      : null,
                          value: selectedCity,
                          hint: Text('اختر المحافظة'),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                          ),
                          items:
                              cities.map((city) {
                                return DropdownMenuItem<Map<String, dynamic>>(
                                  value: city,
                                  child: Text(city['nameInArabic']),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value;
                              selectedCityId = value?['id'];
                              selectedArea = null;
                              selectedAreaId = null;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        if (selectedCity != null)
                          DropdownButtonFormField<Map<String, dynamic>>(
                            validator:
                                (value) =>
                                    value == null || value.isEmpty
                                        ? 'المنطقة مطلوبة'
                                        : null,
                            value: selectedArea,
                            hint: Text('اختر المنطقة'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                            ),
                            items:
                                (selectedCity?['citiesAndVillages']
                                        as List<dynamic>?)
                                    ?.map<
                                      DropdownMenuItem<Map<String, dynamic>>
                                    >((area) {
                                      return DropdownMenuItem<
                                        Map<String, dynamic>
                                      >(
                                        value: area,
                                        child: Text(area['nameInArabic']),
                                      );
                                    })
                                    .toList() ??
                                [],
                            onChanged: (value) {
                              setState(() {
                                selectedArea = value;
                                selectedAreaId = value?['id'];
                              });
                            },
                          ),
                        SizedBox(height: 15.h),
                        TextFormField(
                          validator:
                              (value) =>
                                  value == null || value.isEmpty
                                      ? 'العنوان مطلوب'
                                      : null,
                          controller: addressController,
                          decoration: InputDecoration(
                            labelText: 'عنوان تفصيلي',
                          ),
                        ),
                        SizedBox(height: 30.h),
                        BlocBuilder<ShowBottumCubit, ShowBottumState>(
                          builder: (context, state) {
                            final isLoading = state is DetailsOrderLoadingState;
                            return ElevatedButton(
                              onPressed:
                                  isLoading
                                      ? null
                                      : () async {
                                        if (formState.currentState!
                                            .validate()) {
                                          await Future.wait([
                                            CachHelper.setData(
                                              key: KeyConstant.clientName,
                                              value: nameController.text,
                                            ),
                                            CachHelper.setData(
                                              key: KeyConstant.clientPhone,
                                              value: phoneController.text,
                                            ),
                                            CachHelper.setData(
                                              key: KeyConstant.address,
                                              value: addressController.text,
                                            ),
                                            CachHelper.setData(
                                              key: KeyConstant.cityId,
                                              value: selectedCityId,
                                            ),
                                            CachHelper.setData(
                                              key: KeyConstant.areaId,
                                              value: selectedAreaId,
                                            ),
                                          ]);

                                          final orderItem = OrderItem(
                                            color:
                                                CachHelper.getData(
                                                  key: KeyConstant.color,
                                                ) ??
                                                '',
                                            imageUrl:
                                                CachHelper.getData(
                                                  key: KeyConstant.imageUrl,
                                                ) ??
                                                '',
                                            price:
                                                int.tryParse(
                                                  CachHelper.getData(
                                                        key: KeyConstant.price,
                                                      )?.toString() ??
                                                      '0',
                                                ) ??
                                                0,
                                            productId:
                                                int.tryParse(
                                                  CachHelper.getData(
                                                        key:
                                                            KeyConstant
                                                                .productId,
                                                      )?.toString() ??
                                                      '0',
                                                ) ??
                                                0,
                                            productName:
                                                CachHelper.getData(
                                                  key: KeyConstant.productName,
                                                ) ??
                                                '',
                                            quantity:
                                                int.tryParse(
                                                  CachHelper.getData(
                                                        key:
                                                            KeyConstant
                                                                .quantity,
                                                      )?.toString() ??
                                                      '0',
                                                ) ??
                                                0,
                                            sizeId:
                                                int.tryParse(
                                                  CachHelper.getData(
                                                        key: KeyConstant.sizeId,
                                                      )?.toString() ??
                                                      '0',
                                                ) ??
                                                0,
                                          );

                                          final orderModel = OrderModel(
                                            address:
                                                CachHelper.getData(
                                                  key: KeyConstant.address,
                                                ) ??
                                                '',
                                            clientName:
                                                CachHelper.getData(
                                                  key: KeyConstant.clientName,
                                                ) ??
                                                '',
                                            clientPhone:
                                                CachHelper.getData(
                                                  key: KeyConstant.clientPhone,
                                                ) ??
                                                '',
                                            cityId: selectedCityId ?? 0,
                                            areaId: selectedAreaId ?? 0,
                                            items: [orderItem],
                                          );
                                          log(
                                            '${orderModel.toJson()}i log it ',
                                          );

                                          BlocProvider.of<ShowBottumCubit>(
                                            context,
                                          ).makeOrder(orderModel);

                                          await CachHelper.clear();
                                          log(
                                            'Selected City ID: $selectedCityId',
                                          );
                                          log(
                                            'Selected Area ID: $selectedAreaId',
                                          );
                                        }
                                      },
                              child:
                                  isLoading
                                      ? SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                      : Text('إتمام عملية الشراء'),
                            );
                          },
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
