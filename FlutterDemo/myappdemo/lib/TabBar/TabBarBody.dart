import 'package:flutter/material.dart';
import 'package:myappdemo/ListView/RandomWordsBody.dart';

class TabBarBodyPage extends StatefulWidget {
  @override
  _TabBarBodyPageState createState() => _TabBarBodyPageState();
}

class _TabBarBodyPageState extends State<TabBarBodyPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<String> tabDatas;

  @override
  void initState() {
    super.initState();

    tabDatas = [
      '通知',
      '公告',
    ];

    ///
    tabController = new TabController(
      length: tabDatas.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: null,
          centerTitle: null,

          ///标题居中显示
          bottom: PreferredSize(
              //preferredSize: Size(double.maxFinite, 40),
              preferredSize: null,
              child: TabBar(
                ///
                controller: tabController,
                tabs: tabDatas.map((item) {
                  ///遍历生成可点击的Tab项
                  return Tab(text: item);
                }).toList(),
              )),
        ),
        body: TabBarView(
          controller: tabController,

          ///生成对应的页面 children类型 List<Widget>
          children: tabDatas.map((item) {
            switch (item) {
              case '通知':
                return Center(
                  child: RandomWordsBody(),
                );
                break;
              default:
                return Center(
                  child: Text(item),
                );
                break;
            }
          }).toList(),
        ));
  }
}
