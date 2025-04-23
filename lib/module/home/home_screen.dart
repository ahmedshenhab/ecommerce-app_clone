import 'dart:developer';

import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/widgets/almost_done.dart';
import 'package:ecomerce_app/module/home/widgets/drawer.dart';
import 'package:ecomerce_app/module/home/widgets/electrons.dart';
import 'package:ecomerce_app/module/home/widgets/footer.dart';
import 'package:ecomerce_app/module/home/widgets/home_banner.dart';
import 'package:ecomerce_app/module/home/widgets/kitchen.dart';
import 'package:ecomerce_app/module/home/widgets/offers.dart';
import 'package:ecomerce_app/module/home/widgets/search_bar.dart';
import 'package:ecomerce_app/module/home/widgets/status.dart';
import 'package:ecomerce_app/module/home/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static const String homeScreen = "homeScreen";

  const HomeScreen({super.key});
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    log('build home screen');
    return Scaffold(
      drawer: CustomDrawer(),
      key: BlocProvider.of<HomeCubit>(context).scafoldKey,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25.h),

            // Top bar (fixed)
            TopBar(),

            // Search bar (fixed)
            CUSTOMSearchBar(),
            SizedBox(height: 10.h),

            Divider(color: Colors.black, thickness: 0.5.h),
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 25.h),
                    // Banner
                    HomeBanner(),
                    // Category/Stories (Horizontal List)
                    // Category/Stories (Horizontal List)
                    SizedBox(height: 20.h),

                    //STATUS
                    Status(),

                    SizedBox(height: 20.h),

                    // emptycontainer
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      height: 300,
                      decoration: BoxDecoration(
                        color: AppColor.grey.withValues(alpha: 0.13),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // kitchen
                    Kitchen(),

                    SizedBox(height: 70.h),
                    // Electrons
                    Electrons(),

                    //offers
                    SizedBox(height: 45.h),

                    Offers(),

                    SizedBox(height: 70.h),

                    AlmostDone(),
                    SizedBox(height: 70.h),

                    Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





  

// class CarouselExampleApp extends StatelessWidget {
//   const CarouselExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
       
//         body: const CarouselExample(),
//       ),
//     );
//   }
// }

// class CarouselExample extends StatefulWidget {
//   const CarouselExample({super.key});

//   @override
//   State<CarouselExample> createState() => _CarouselExampleState();
// }

// class _CarouselExampleState extends State<CarouselExample> {
//   final CarouselController controller = CarouselController(initialItem: 1);

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.sizeOf(context).height;

//     return ListView(
//       children: <Widget>[
//         ConstrainedBox(
//           constraints: BoxConstraints(maxHeight: height / 2),
//           child: CarouselView.weighted(
//             controller: controller,
//             itemSnapping: true,
//             flexWeights: const <int>[1, 7, 1],
//             children:
//                 ImageInfo.values.map((ImageInfo image) {
//                   return HeroLayoutCard(imageInfo: image);
//                 }).toList(),
//           ),
//         ),
//         const SizedBox(height: 20),
//         const Padding(
//           padding: EdgeInsetsDirectional.only(top: 8.0, start: 8.0),
//           child: Text('Multi-browse layout'),
//         ),
//         ConstrainedBox(
//           constraints: const BoxConstraints(maxHeight: 50),
//           child: CarouselView.weighted(
//             flexWeights: const <int>[1, 2, 3, 2, 1],
//             consumeMaxWeight: false,
//             children: List<Widget>.generate(20, (int index) {
//               return ColoredBox(
//                 color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.8),
//                 child: const SizedBox.expand(),
//               );
//             }),
//           ),
//         ),
//         const SizedBox(height: 20),
//         ConstrainedBox(
//           constraints: const BoxConstraints(maxHeight: 200),
//           child: CarouselView.weighted(
//             flexWeights: const <int>[3, 3, 3, 2, 1],
//             consumeMaxWeight: false,
//             children:
//                 CardInfo.values.map((CardInfo info) {
//                   return ColoredBox(
//                     color: info.backgroundColor,
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Icon(info.icon, color: info.color, size: 32.0),
//                           Text(
//                             info.label,
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                             overflow: TextOverflow.clip,
//                             softWrap: false,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//           ),
//         ),
//         const SizedBox(height: 20),
//         const Padding(
//           padding: EdgeInsetsDirectional.only(top: 8.0, start: 8.0),
//           child: Text('Uncontained layout'),
//         ),
//         ConstrainedBox(
//           constraints: const BoxConstraints(maxHeight: 200),
//           child: CarouselView(
//             itemExtent: 330,
//             shrinkExtent: 200,
//             children: List<Widget>.generate(20, (int index) {
//               return UncontainedLayoutCard(index: index, label: 'Show $index');
//             }),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class HeroLayoutCard extends StatelessWidget {
//   const HeroLayoutCard({super.key, required this.imageInfo});

//   final ImageInfo imageInfo;

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.sizeOf(context).width;
//     return Stack(
//       alignment: AlignmentDirectional.bottomStart,
//       children: <Widget>[
//         ClipRect(
//           child: OverflowBox(
//             maxWidth: width * 7 / 8,
//             minWidth: width * 7 / 8,
//             child: Image(
//               fit: BoxFit.cover,
//               image: NetworkImage(
//                 'https://flutter.github.io/assets-for-api-docs/assets/material/${imageInfo.url}',
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Text(
//                 imageInfo.title,
//                 overflow: TextOverflow.clip,
//                 softWrap: false,
//                 style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 imageInfo.subtitle,
//                 overflow: TextOverflow.clip,
//                 softWrap: false,
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class UncontainedLayoutCard extends StatelessWidget {
//   const UncontainedLayoutCard({super.key, required this.index, required this.label});

//   final int index;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return ColoredBox(
//       color: Colors.primaries[index % Colors.primaries.length].withOpacity(0.5),
//       child: Center(
//         child: Text(
//           label,
//           style: const TextStyle(color: Colors.white, fontSize: 20),
//           overflow: TextOverflow.clip,
//           softWrap: false,
//         ),
//       ),
//     );
//   }
// }

// enum CardInfo {
//   camera('Cameras', Icons.video_call, Color(0xff2354C7), Color(0xffECEFFD)),
//   lighting('Lighting', Icons.lightbulb, Color(0xff806C2A), Color(0xffFAEEDF)),
//   climate('Climate', Icons.thermostat, Color(0xffA44D2A), Color(0xffFAEDE7)),
//   wifi('Wifi', Icons.wifi, Color(0xff417345), Color(0xffE5F4E0)),
//   media('Media', Icons.library_music, Color(0xff2556C8), Color(0xffECEFFD)),
//   security('Security', Icons.crisis_alert, Color(0xff794C01), Color(0xffFAEEDF)),
//   safety('Safety', Icons.medical_services, Color(0xff2251C5), Color(0xffECEFFD)),
//   more('', Icons.add, Color(0xff201D1C), Color(0xffE3DFD8));

//   const CardInfo(this.label, this.icon, this.color, this.backgroundColor);
//   final String label;
//   final IconData icon;
//   final Color color;
//   final Color backgroundColor;
// }

// enum ImageInfo {
//   image0('The Flow', 'Sponsored | Season 1 Now Streaming', 'content_based_color_scheme_1.png'),
//   image1(
//     'Through the Pane',
//     'Sponsored | Season 1 Now Streaming',
//     'content_based_color_scheme_2.png',
//   ),
//   image2('Iridescence', 'Sponsored | Season 1 Now Streaming', 'content_based_color_scheme_3.png'),
//   image3('Sea Change', 'Sponsored | Season 1 Now Streaming', 'content_based_color_scheme_4.png'),
//   image4('Blue Symphony', 'Sponsored | Season 1 Now Streaming', 'content_based_color_scheme_5.png'),
//   image5('When It Rains', 'Sponsored | Season 1 Now Streaming', 'content_based_color_scheme_6.png');

//   const ImageInfo(this.title, this.subtitle, this.url);
//   final String title;
//   final String subtitle;
//   final String url;
// }