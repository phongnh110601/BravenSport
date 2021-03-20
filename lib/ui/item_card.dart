import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String image;
  final bool check;
  final double size;
  final String imageType;

  const ItemCard({Key key, this.name, this.image, this.check, this.size, this.imageType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            this.name,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                                color:
                                    Color(this.check ? 0xFF0073D8 : 0xFF202428),
                                fontSize: 10 + 6 * this.size,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                            alignment: Alignment.bottomRight,
                            width: 40 * size,
                            height: 40 * size,
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: (this.imageType == 'svg') ? SvgPicture.network(
                                image,
                                fit: BoxFit.fill,
                              ) : Image.network(image, fit: BoxFit.fill,),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            alignment: Alignment.topRight,
            child: (this.check)
                ? Stack(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(0xFF0073D8),
                      ),
                      Icon(
                        Icons.check,
                        color: Color(0xFFFFFFFF),
                      )
                    ],
                  )
                : Container())
      ],
    );
  }
}
