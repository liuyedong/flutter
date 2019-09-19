import 'package:flutter/material.dart';

class TabBarDemoPage extends StatefulWidget {
  @override
  _TabBarDemoPageState createState() => _TabBarDemoPageState();
}

class _TabBarDemoPageState extends State<TabBarDemoPage>
    with SingleTickerProviderStateMixin {

  TabController tabController;
  List<String> tabDatas;

  @override
  void initState() {
    super.initState();

    tabDatas = [
      '销售',
      '采购',
      '仓库',
      '资金',
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
          title: Text('TabBar Demo'),
          centerTitle: true,            ///标题居中显示
          bottom: PreferredSize(
            preferredSize: Size( double.maxFinite, 40),
            child: TabBar(            ///
              controller: tabController,
              tabs: tabDatas.map((item){      ///遍历生成可点击的Tab项
                return Tab( text:item );
              }).toList(),
            )
          ),
      ),
      body: TabBarView(
        controller: tabController,
        ///生成对应的页面 children类型 List<Widget>
        children: tabDatas.map((item){
        return Center( child: Text( item ), );
        }).toList(),
      )
    );
  }
}
