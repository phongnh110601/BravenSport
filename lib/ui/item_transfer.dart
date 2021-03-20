import 'package:demo_180121_bloc/models/feeds_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemTransfer extends StatelessWidget {
  final Transfer transfer;

  const ItemTransfer({Key key, this.transfer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 13, 20, 13),
          child: Divider(),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Image(
                      image: NetworkImage(transfer.playerImage),
                      fit: BoxFit.fill,
                    ),
                  )),
              Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 14, 0),
                    child: Text(
                      transfer.playerName,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Color(0xFF202428),
                          fontWeight: FontWeight.w500),
                    ),
                  )),
              Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: SvgPicture.network(
                              transfer.sellTeamLogo,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            alignment: Alignment.center,
                            child: Icon(Icons.arrow_right)),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: SvgPicture.network(
                              transfer.buyTeamLogo,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Text(
                    transfer.price,
                    style: GoogleFonts.roboto(
                        fontSize: 18, color: Color(0xFF202428)),
                    maxLines: 1,
                    textAlign: TextAlign.end,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
