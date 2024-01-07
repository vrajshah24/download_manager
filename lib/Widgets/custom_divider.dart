import 'package:download_manager/Global%20Components/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerWithName extends StatelessWidget {
  final String name;
  const DividerWithName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h10(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: GoogleFonts.montserrat(
                fontSize: 18 * getResponsiveText(context)),
          ),
          SizedBox(
            width: 15 * getResponsive(context),
          ),
          const Expanded(
            child: Divider(color: Colors.grey, thickness: 1.3),
          )
        ],
      ),
    );
  }
}
