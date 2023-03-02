import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColor;



class Painter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
   
    Paint paint_1 = Paint()
      ..color = AppColor.ColorAppBarPainter
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .5, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .5, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);





    Paint paint_2 = Paint()
      ..color = AppColor.ColorAppBarPainter
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}














class Painter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
   
    Paint paint_1 = Paint()
      ..color = AppColor.ColorAppBarPainterB
      ..style = PaintingStyle.fill;

    // Path path_1 = Path()
    //   ..moveTo(0, 0)
    //   ..lineTo(size.width *0, 0)
    //   ..cubicTo(size.width * .0, 0, 0, 0, 0, size.width * .0);

    // Path path_2 = Path()
    //   ..moveTo(size.width, 0)
    //   ..lineTo(size.width * 0, 0)
    //   ..cubicTo(
    //       size.width * 0.99, 0, size.width, 40, size.width, size.width * .2);





         Path path_1 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .5, 0)
      ..cubicTo(size.width * .05, 0, 0, 20, 0, size.width * .08);

    Path path_2 = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width * .5, 0)
      ..cubicTo(
          size.width * .95, 0, size.width, 20, size.width, size.width * .08);






    Paint paint_2 = Paint()
      ..color =  AppColor.ColorAppBarPainterB
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width*0, 0);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}