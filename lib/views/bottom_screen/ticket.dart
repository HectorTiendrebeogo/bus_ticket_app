import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Code QR'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Retour'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes tickets",style: TextStyle(color: Theme.of(context).primaryColorLight),),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Container(
          height: 220,
          margin: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: TicketPainter(
              borderColor: Colors.black,
              bgColor: Theme.of(context).primaryColor.withOpacity(0.8),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'COMPANY',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColorLight
                        ),
                      ),
                      Text(
                        'CAR 5, Siège 12',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColorLight
                        ),
                      ),
                      Text(
                        '\7500 FCFA',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColorLight
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '30 Aout, 2023',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColorLight
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 4, 0, 4),
                        child: Icon(
                          Icons.circle_outlined,
                          size: 18,
                            color: Colors.white
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            /*Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: CustomPaint(
                                painter: HorizontalDottedLinePainter(),
                                size: const Size(double.infinity, 1),
                              ),
                            ),
                          ),*/
                            const Center(
                              child: Icon(
                                Icons.directions_bus_outlined,
                                color: Colors.white,
                                size: 28,
                              ),/*RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  Icons.directions_bus_outlined,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),*/
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 4, 8, 4),
                        child: Icon(
                          Icons.circle_outlined,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '30 Aout 2022',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColorLight
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bobo-dioulasso',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorLight
                        ),
                      ),
                      Text(
                        'Ouagadougou',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorLight
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '10:40',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorLight
                        ),
                      ),
                      Text(
                        '5H',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColorLight
                        ),
                      ),
                      Text(
                        '15:40',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorLight
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tiendrebeogo Hector',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorLight
                        ),
                      ),
                   TextButton(onPressed: () async {
                     _showMyDialog();
                   },
                       child: Text("Voir le code",style: GoogleFonts.poppins(
                           fontSize: 12,
                           fontWeight: FontWeight.w400,
                           color: Theme.of(context).primaryColorLight
                       ),)
                   )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 5,)
    );
  }
}
class TicketPainter extends CustomPainter{
  final Color borderColor;
  final Color bgColor;

  static const _cornerGap = 20.0;
  static const _cutoutRadius = 20.0;
  static const _cutoutDiameter = _cutoutRadius * 2;

  TicketPainter({
    required this.bgColor,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final maxWidth = size.width;
    final maxHeight = size.height;


    final cutoutStartPos = maxHeight - maxHeight * 0.2;
    final leftCutoutStartY = cutoutStartPos;
    final rightCutoutStartY = cutoutStartPos - _cutoutDiameter;
    final dottedLineY = cutoutStartPos - _cutoutRadius;
    double dottedLineStartX = _cutoutRadius;
    final double dottedLineEndX = maxWidth - _cutoutRadius;
    const double dashWidth = 8.5;
    const double dashSpace = 4;

    final paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = bgColor;

    final paintBorder = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = borderColor;

    final paintDottedLine = Paint()
      ..color = borderColor.withOpacity(0.5)
      ..strokeWidth = 1.2;
    var path = Path();
    path.moveTo(_cornerGap, 0);
    path.lineTo(maxWidth - _cornerGap, 0);
    _drawCornerArc(path, maxWidth, _cornerGap);
    path.lineTo(maxWidth, rightCutoutStartY);
    _drawCutout(path, maxWidth, rightCutoutStartY + _cutoutDiameter);
    path.lineTo(maxWidth, maxHeight - _cornerGap);
    _drawCornerArc(path, maxWidth - _cornerGap, maxHeight);
    path.lineTo(_cornerGap, maxHeight);
    _drawCornerArc(path, 0, maxHeight - _cornerGap);
    path.lineTo(0, leftCutoutStartY);
    _drawCutout(path, 0.0, leftCutoutStartY - _cutoutDiameter);
    path.lineTo(0, _cornerGap);
    _drawCornerArc(path, _cornerGap, 0);

    canvas.drawPath(path, paintBg);
    canvas.drawPath(path, paintBorder);

    while (dottedLineStartX < dottedLineEndX) {
      canvas.drawLine(
        Offset(dottedLineStartX, dottedLineY),
        Offset(dottedLineStartX + dashWidth, dottedLineY),
        paintDottedLine,
      );
      dottedLineStartX += dashWidth + dashSpace;
    }
  }

  _drawCutout(Path path, double startX, double endY) {
    path.arcToPoint(
      Offset(startX, endY),
      radius: const Radius.circular(_cutoutRadius),
      clockwise: false,
    );
  }

  _drawCornerArc(Path path, double endPointX, double endPointY) {
    path.arcToPoint(
      Offset(endPointX, endPointY),
      radius: const Radius.circular(_cornerGap),
    );
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

  @override
  bool shouldRebuildSemantics(TicketPainter oldDelegate) => false;

}