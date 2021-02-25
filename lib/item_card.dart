import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String image;
  final bool isChecked;
  const ItemCard({Key key, this.name, this.image, this.isChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        this.name,
                        style: GoogleFonts.roboto(
                            color: (this.isChecked)
                                ? Color(0xFF0073D8)
                                : Color(0xFF202428)),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
                          child: AspectRatio(
                            aspectRatio: 1/1,
                            child: SvgPicture.asset(
                              this.image,
                              fit: BoxFit.fill,
                            ),
                          )))
                ],
              ),
            ),
          ),
          Container(
              alignment: Alignment.topRight,
              child: (this.isChecked) ? Stack(
                children: [
                  Icon(
                      Icons.circle,
                      color: Color(0xFF0073D8)
                  ),
                  Icon(
                    Icons.check,
                    color: Color(0xFFFFFFFF),
                  )
                ],
              ) : Container())
        ],
      ),
    );
  }
}