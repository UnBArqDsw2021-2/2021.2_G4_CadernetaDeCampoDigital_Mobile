import 'package:caderneta_campo_digital/pages/property/property_page.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlantationCard extends StatefulWidget {
  final Plantation plantation;
  const PlantationCard({Key? key, required this.plantation}) : super(key: key);

  @override
  State<PlantationCard> createState() => _PlantationCardState();
}

class _PlantationCardState extends State<PlantationCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * (!widget.plantation.empty ? 0.11 : 0.08),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: !widget.plantation.empty
                  ? Image.network(
                      widget.plantation.imageUrl.isNotEmpty
                          ? widget.plantation.imageUrl
                          : 'https://blog.chbagro.com.br/user-files/blog/174577.jpg',
                      loadingBuilder: (
                        BuildContext context,
                        Widget child,
                        ImageChunkEvent? loadingProgress,
                      ) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: Shimmer.fromColors(
                            baseColor: Color(0xFFEBEBF4),
                            highlightColor: Color(0xFFF4F4F4),
                            child: Container(
                              color: Color(0xFFFFFFFF),
                              height: 50,
                              width: 50,
                            ),
                          ),
                        );
                      },
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    )
                  : Container(
                      color: Color(0xFFFFFFFF),
                      width: 50,
                      height: 50,
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 26),
            width: size.width * 0.3,
            child: !widget.plantation.empty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.plantation.name,
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 10),
                      ),
                      Text(
                        widget.plantation.plantingDate,
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 10),
                      ),
                      Text(
                        widget.plantation.serieNumber,
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 10),
                      ),
                    ],
                  )
                : Text(
                    'Vazio',
                    style: TextStyle(
                      fontFamily: 'Roboto-regular',
                      fontSize: 12,
                      color: Color(0xFF000000),
                    ),
                  ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 5, right: 5),
            height: size.height * 0.04,
            width: size.width * 0.45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.plantation.buttons.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: size.width * 0.42 / widget.plantation.buttons.length,
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    onPressed: () {
                      widget.plantation.buttons[index].onPressed();
                    },
                    splashColor: Color(0XFF00B4D8).withOpacity(0.2),
                    highlightColor: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xFF00B4D8),
                      ),
                      child: Center(
                        child: Text(
                          widget.plantation.buttons[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0XFFFFFFFF),
                            fontSize: 9,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          color: Color(0xFF000000).withOpacity(0.5),
          width: 1.0,
          style: BorderStyle.solid,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(134, 0, 0, 0),
            offset: Offset(
              0.0,
              3.0,
            ),
            blurRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
    );
  }
}
