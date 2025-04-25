import 'package:ecomerce_app/module/details_screen/details_screen.dart';
import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/cubit/states.dart';
import 'package:ecomerce_app/module/home/data/models/product_by_category_model.dart';
import 'package:ecomerce_app/module/home/data/models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              controller: cubit.controller,
              decoration: InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12.h,
                  horizontal: 16.w,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (query) {
                BlocProvider.of<HomeCubit>(context).getSerch(query);
              },
            ),
          ),

          Expanded(
            child: BlocBuilder<HomeCubit, HomeStates>(
              buildWhen:
                  (previous, current) =>
                      current is SearchLoading ||
                      current is SearchError ||
                      current is SearchSuccess,
              builder: (context, state) {
                if (cubit.controller.text.trim().isEmpty) {
                  return const SizedBox.shrink(); // Hide if search bar is empty
                }

                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                } else if (state is SearchSuccess) {
                  List<Items> results = state.search ?? [];

                  if (results.isEmpty) {
                    return const Center(child: Text("No items found"));
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      Items item = results[index];
                      Products? product = Products(
                        id: item.id,
                        description: item.description,
                        price: item.price,
                        imageCover: item.imageCover,
                        name: item.name,
                      );

                      return Container(
                        padding: EdgeInsets.all(10.w),
                        child: ListTile(
                          trailing: Text(
                            item.name ?? 'No Name',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontSize: 22.w),
                          ),
                          // title:,
                          onTap: () {
                            cubit.controller.clear();
  cubit.clearSearch();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailsScreen(product: product),
                              ),
                            );
                            
                          },
                        ),
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
