import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopbarArrowBack extends StatelessWidget implements PreferredSizeWidget {
  final Size topbarHeight;
  final String title;
  final bool hasToolbar;
  const TopbarArrowBack({
    Key? key,
    required this.topbarHeight,
    required this.title,
    required this.hasToolbar,
  }) : super(key: key);

  @override
  Size get preferredSize => topbarHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: size.height * 0.11,
      leadingWidth: 100,
      leading: Row(children: [
        IconButton(
          padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/arrow_back.svg',
            width: 24,
            height: 22.5,
            color: Color(0XFFFFFFFF),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 27),
          height: 50,
          width: 1,
          color: Color(0xFFFFFFFF),
        ),
      ]),
      centerTitle: false,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        softWrap: true,
        style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 22,
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            colors: const [Color(0xFF0077B6), Color(0xFF90E0EF)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      actions: hasToolbar
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                      child: TextButton(
                        onPressed: () {
                          print('editar');
                        },
                        child: Text(
                          'editar',
                          style:
                              TextStyle(color: Color(0xFFFFFFFF), fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                      child: TextButton(
                        onPressed: () {
                          print('histórico');
                        },
                        child: Text(
                          'histórico',
                          style:
                              TextStyle(color: Color(0xFFFFFFFF), fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          : [],
    );
  }
}
