import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/heading_text.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Padding(padding: EdgeInsets.only(top: 40)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shows the logo
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage(AppMedia.logo))),
              ),
              const SizedBox(
                width: 10,
              ),
              // Shows the column text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(text: "Book Tickets", isColor: false,),
                  Text(
                    "New York",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    //decoration
                    decoration: BoxDecoration(
                      color: AppStyles.profileLocationColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    //child -> row->icon,text
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppStyles.profileTextColor),
                          child: const Icon(
                            FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Premium status",
                          style: TextStyle(
                              color: AppStyles.profileTextColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(child: Container()),
              Text(
                "Edit",
                style: TextStyle(
                  color: AppStyles.primaryColor, fontWeight: FontWeight.w300
                ),
              )
            ],
          ),
          const SizedBox(height: 8,),
          //divider
          Divider(color: Colors.grey.shade300,
          ),
          //Show the card
          Stack(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(18)
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                        color: AppStyles.primaryColor,
                        size: 27,
                      ),
                    ),
                    const SizedBox(width: 12,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyleFourth(
                            text: "You\'v got a new award",
                          isColor: null,
                        ),
                        TextStyleFourth(
                          text: "You have 95 flights in a year",
                          isColor: false,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: -40,
                  right: -45,
                  child: Container(
                    padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 18, color: Color(0xFF2646D2)),
                  ),
              ))
            ],
          ),
          const SizedBox(height: 25,),
          Text("Accumulated miles", style: AppStyles.headLineStyle3,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppStyles.bgColor
            ),
            child: Column(
              children: [
                const SizedBox(height: 15,),
                Text("192802", style: TextStyle(
                  fontSize: 45, color: AppStyles.textColor, fontWeight: FontWeight.w600
                ),),
                //row -> text,
                Row(
                  children: [
                    Text(
                      "Miles acciured",
                      style: AppStyles.headLineStyle4,
                    )
                  ],
                )
                //row -> column
                //row -> column
                //text

              ],
            ),
          )
        ],
      ),
    );
  }
}
