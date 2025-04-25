import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextFormField buildLoginField(
  BuildContext context, {
  void Function(String)? onSubmit,
  required TextEditingController controller,
  String? hintText,
  required String labelText,
  bool readOnly = false,
  bool isHiddenPassword = false,
  Widget? sufixIconBotton,
  required String? Function(String?) validator,
  TextInputType? type,
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.disabled,

    // autovalidateMode: AutovalidateMode.onUserInteraction,
    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, height: 0),

    readOnly: readOnly,
    onFieldSubmitted: onSubmit,
    obscureText: isHiddenPassword,
    controller: controller,
    keyboardType: type ?? TextInputType.none,
    validator: validator,
    decoration: InputDecoration(
      errorMaxLines: 3,

      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,

        overflow: TextOverflow.ellipsis,
      ),
      suffixIcon: sufixIconBotton,

      // hintText: hintText,
      alignLabelWithHint: true,

      floatingLabelBehavior: FloatingLabelBehavior.never,

      labelText: labelText,

      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontFamily: 'Poppins',
        fontSize: 13.sp,
        fontWeight: FontWeight.w100,
        color: AppColor.fieldColorHint,
      ),

      // hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
      //   height: 0,
      //   fontFamily: 'Poppins',
      //   fontSize: 13.sp,
      //   fontWeight: FontWeight.w100,
      //   color: AppColor.fieldColorHint,
      // ),
      // border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.grey),
      ),
    ),
  );
}

Future<bool?> buildshowToast({required String msg, required Color color}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 13.0.sp,
  );
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColor.deepOrange,
    this.textColor = AppColor.white,
    this.elevation = 0,
    this.shadowColor = Colors.transparent,
    this.overlayColor = Colors.transparent,
    this.alignment = Alignment.center,
    this.borderRadius = 16.0,
  });
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double elevation;
  final Color shadowColor;
  final Color overlayColor;
  final AlignmentGeometry alignment;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        overlayColor: overlayColor,
        shadowColor: shadowColor,
        elevation: elevation,
        alignment: alignment,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        backgroundColor: backgroundColor,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
          fontFamily: 'SofiaPro',
          fontSize: 16.sp,
          color: textColor,
        ),
      ),
    );
  }
}
// TextFormField buildtextFormField({
//   void Function(String)? onSubmit,
//   required TextEditingController controller,
//   required String label,
//   bool readOnly = false,
//   bool isHiddenPassword = false,
//   required IconData prefixIcon,
//   IconButton? sufixIconBotton,
//   required String? Function(String?) validator,
//   required TextInputType type,
// }) =>
//     TextFormField(
//       readOnly: readOnly,
//       onFieldSubmitted: onSubmit,
//       obscureText: isHiddenPassword,
//       style: const TextStyle(),
//       controller: controller,
//       keyboardType: TextInputType.emailAddress,
//       validator: validator,
//       decoration: InputDecoration(
//           constraints: const BoxConstraints(),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           labelText: label,
//           prefixIcon: Icon(prefixIcon),
//           suffixIcon: sufixIconBotton),
//     );

// Widget buildHashTag(BuildContext context, String text) {
//   return
//       // ignore: sized_box_for_whitespace
//       Container(
//     padding: const EdgeInsetsDirectional.only(end: 6),
//     height: 20,
//     child: MaterialButton(
//       minWidth: 1,
//       padding: EdgeInsets.zero,
//       onPressed: () {},
//       child: Text(
//         text,
//         style: Theme.of(context).textTheme.bodySmall!.copyWith(
//             fontSize: 13.7, color: Colors.blue, height: 1.4),
//       ),
//     ),
//   );
// }
