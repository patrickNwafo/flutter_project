import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/app_jason.dart';
import 'package:ticket_app/bloc/text_expansion_blocs.dart';
import 'package:ticket_app/bloc/text_expansion_events.dart';
import 'package:ticket_app/bloc/text_expansion_states.dart';
import 'package:ticket_app/controller/text_expansion_controller.dart';
import 'package:get/get.dart';
import 'package:ticket_app/provider/text_expansion_provider.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;
  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args["index"]);
    index = args["index"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppStyles.primaryColor),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(hotelList[index]["place"]),
              background: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    "assets/images/${hotelList[index]["image"]}",
                    fit: BoxFit.cover,
                  )),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          hotelList[index]["place"],
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.red,
                                offset: Offset(2.0, 2.0),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ExpandedTextWidget(
                text: hotelList[index]["detail"],
              ),
              //   Text(
              //       "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop  including versions of Lorem Ipsum."),
              //
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "More Images",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              child: Container(
                height: 200.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotelList[index]["images"].length,
                    itemBuilder: (context, imagesIndex) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        color: Colors.red,
                        child:
                            Image.asset(
                              "assets/images/${hotelList[index]["images"][imagesIndex]}"
                            ),
                      );
                    }),
              ),
            )
          ]))
        ],
      ),
    );
  }
}

class ExpandedTextWidget extends StatelessWidget {
  ExpandedTextWidget({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    //var provider = ref.watch(textExpansionNotifierProvider);



    return BlocBuilder<TextExpansionBlocs, TextExpansionStates>(builder: (context, state){
      if(state is IsExpandedState){
        var isExpanded = state.isExpanded;
        var textWidget = Text(
          text,
          maxLines: isExpanded?null:4,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget,
            GestureDetector(
              onTap: () {
                //ref.watch(textExpansionNotifierProvider.notifier).toggleText(provider);
                context.read<TextExpansionBlocs>().add(IsExpandedEvent(!isExpanded));
              },
              child: Text(
                isExpanded ? "Less" : "More",
                style: AppStyles.textStyle.copyWith(
                  color: AppStyles.primaryColor,
                ),
              ),
            )
          ],
        );
      }else {
        return Container();
      }

    });
  }
}
