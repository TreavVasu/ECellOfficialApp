import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/res/colors.dart';
import '../../core/res/dimens.dart';
import '../../core/res/strings.dart';
import '../../widgets/raisedButton.dart';

class ESummitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double top = MediaQuery.of(context).viewPadding.top;
    double heightFactor = height / 1000;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: EdgeInsets.only(left: D.horizontalPadding - 10, top: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: DefaultTextStyle.merge(
        style:
            GoogleFonts.roboto().copyWith(color: C.primaryUnHighlightedColor),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [C.backgroundTop1, C.backgroundBottom1],
            ),
          ),
          child: Container(
            height: height,
            padding: EdgeInsets.only(top: 56 + top + 20 * heightFactor),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: D.horizontalPadding -20),
                  child: Image.asset(S.assetEsummitLogoWhite,
                      width: width * 0.3 * heightFactor),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: D.horizontalPadding-20, top: 20),
                  child: RichText(
                    text: TextSpan(
                      text: "E-Summit '22",
                      style: TextStyle(
                          fontSize: 45 * heightFactor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 30, bottom: 15),
                  child: RichText(
                    text: TextSpan(
                      text: "Eminence in Ingenuity",
                      style: TextStyle(
                          fontSize: 32 * heightFactor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: D.horizontalPadding, vertical:0),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "To learn is to grow.",
                          style: TextStyle(
                              fontSize: 21 * heightFactor,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "To innovate is to Pioneer.",
                          style: TextStyle(
                              fontSize: 21 * heightFactor,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "To be an entrepreneur is to be a leader.",
                          style: TextStyle(
                              fontSize: 21 * heightFactor,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  )
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(
                      horizontal: D.horizontalPadding+18, vertical: 20),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: "At ",
                        style: TextStyle(
                            fontSize: 20 * heightFactor,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                            wordSpacing: 4),
                        children: <TextSpan>[
                          TextSpan(
                            text: "E-Summit ",
                            style: TextStyle(
                              color: C.speakerButtonColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: S.esummitPara)
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: D.horizontalPadding, top: 40),
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: C.authButtonColor.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: Offset(0, 12),
                        ),
                      ],
                    ),
                    child: LegacyRaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      color: C.speakerButtonColor,
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, S.routeSpeaker),
                      child: Container(
                        height: 50,
                        width: 120,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Speakers",
                              style: TextStyle(
                                color: C.primaryUnHighlightedColor,
                                fontSize: 20 * heightFactor,
                                fontWeight: FontWeight.w300,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0.5),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: heightFactor * 10),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: C.primaryUnHighlightedColor,
                              size: heightFactor * 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
