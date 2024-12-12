import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/utils/app_routes.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/home/widgets/hotel.dart';

import '../../base/res/media.dart';
import '../../base/res/styles/app_styles.dart';
import '../../base/utils/app_jason.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Coloum
    //ListView
    //ListView Builder
    return Scaffold(
      // We want a scrollable effect
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good morning",
                          style: AppStyles.headLineStyle2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Book tickets",
                          style: AppStyles.headLineStyle1,
                        )
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage(AppMedia.logo),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD),
                  ),
                  child: const Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(FluentSystemIcons.ic_fluent_search_regular,
                          color: Color(0xFFBFC205)),
                      Text("Search")
                    ],
                  ),
                ),
                Container(),
                const SizedBox(height: 40),
                AppDoubleText(
                  bigText: "Upcoming Flights",
                  smallText: "View all",
                  func: () =>
                      Navigator.pushNamed(context, AppRoutes.allTickets),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ticketList
                          .take(2)
                          .map((singleTicket) => GestureDetector(
                              onTap: () {
                                var index = ticketList.indexOf(singleTicket);

                                print("I am tapped on the ticket $index");
                                Navigator.pushNamed(
                                    context, AppRoutes.ticketScreen,
                                    arguments: {"index": index});
                              },
                              child: TicketView(ticket: singleTicket)))
                          .toList(),
                    )),
                const SizedBox(height: 40),
                AppDoubleText(
                  bigText: "Hotels",
                  smallText: "View all",
                  func: () {
                    Navigator.pushNamed(context, AppRoutes.allHotels);
                  },
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: hotelList
                          .take(2)
                          .map((singleHotel) =>
                              GestureDetector(
                                  onTap: (){
                                    var index = hotelList.indexOf(singleHotel);
                                    Navigator.pushNamed(context, AppRoutes.hotelDetail, arguments: {
                                      "index":index
                                    });
                                  },
                                  child: Hotel(hotel: singleHotel)))
                          .toList(),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
