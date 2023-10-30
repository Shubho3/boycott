import 'package:flutter/material.dart';

class DefaultTab extends StatelessWidget {
  final List tabItem;
  final List<Widget> tabWidget;
  final Function(int) onTap;
  const DefaultTab(
      {Key? key,
        required this.tabItem,
        required this.tabWidget,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: DefaultTabController(
        length: tabItem.length,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TabBar(
                physics: ScrollPhysics(),
                onTap: onTap,
                labelPadding: EdgeInsets.only(left: 5, right: 0),
                labelColor: Color(0xffFFAF00),
                unselectedLabelColor: Color(0xff000000),
                isScrollable: false,
                indicator: UnderlineTabIndicator(
                    borderSide:
                    BorderSide(width: 1.5, color: Color(0xffFFAF00)),
                    insets: EdgeInsets.symmetric(horizontal: 8, vertical: 0)),
                // duration: 0,
                labelStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 0.2,
                  fontFamily: "Poppins",
                ),
                unselectedLabelStyle: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 0.2,
                  fontFamily: "Poppins",
                ),

                tabs: [
                  for (int i = 0; i < tabItem.length; i++)
                    Tab(text: '${tabItem[i]}'),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,//height of
                // TabBarView
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: tabWidget),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
