import 'dart:async';

import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int _currentIndex = 0;
  Timer? _timer;

  void _startTimer(List<String> messages) {
    _timer?.cancel();
    if (messages.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (!mounted) return;
        setState(() {
          _currentIndex = (_currentIndex + 1) % messages.length;
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen:
          (previous, current) =>
              current is NewsSuccessStates ||
              current is NewsErrorStates ||
              current is NewsLoadingStates,
      builder: (context, state) {
        if (state is NewsLoadingStates) {
          return const SizedBox.shrink(); // Or a shimmer/loading widget
        } else if (state is NewsSuccessStates) {
          final messages = state.news;

          if (messages.isEmpty) {
            return const SizedBox.shrink(); // nothing to show
          }

          _startTimer(messages); // start timer only when messages are available

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder:
                (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
            child: Container(
              key: ValueKey<String>(messages[_currentIndex]),
              color: AppColor.grey,
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  messages[_currentIndex],
                  maxLines: 1,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        } else if (state is NewsErrorStates) {
          return SizedBox.shrink();
        } else {
          return const SizedBox.shrink(); // Fallback or initial state
        }
      },
    );
  }
}
