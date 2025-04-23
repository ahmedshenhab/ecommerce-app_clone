import 'dart:async';
import 'dart:developer';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  List<String> messages = [
    'يوجد خصم 20% على قسم الإلكترونيات',
    'أهلاً بك في متجر MY HOME',
  ];
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % messages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('build home banner');
    log(_currentIndex.toString());

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder:
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      child: Container(
        key: ValueKey<String>(messages[_currentIndex]),
        color: AppColor.grey,
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text(
            maxLines: 1,
            messages[_currentIndex],
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
