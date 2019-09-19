import 'package:flutter/material.dart';
import 'package:myappdemo/TabBar/TabBarBody.dart';

class ScaffoldDemoPage extends StatefulWidget {
  @override
  _ScaffoldDemoPageState createState() => _ScaffoldDemoPageState();
}

class _ScaffoldDemoPageState extends State<ScaffoldDemoPage> {
  ///当前选中的页面
  int _selectedIndex = 0;

  ///
  var _pageController = PageController();

  TextEditingController textEditingController = TextEditingController();

  ///下面tabBar列表
  List tabDatas;

  ///tabBar对应的页面
  List<Widget> tabPages;

  ///下拉菜单默认值
  String dropdownValue = '客户';

  @override
  void initState() {
    super.initState();

    ///
    tabDatas = [
      {'name': '首页', 'icon': Icons.computer},
      {'name': '消息', 'icon': Icons.assignment},
      {'name': '我的', 'icon': Icons.format_list_bulleted},
    ];

    tabPages = tabDatas.map((tab) {
      return PageDemoWidget(
        data: tab['name'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///上面标题栏
      appBar: AppBar(
        ///leading:     drawer 默认会添加按钮

        ///中间搜索
        title: _buildSelectSearch(),
        centerTitle: true,

        ///右侧
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              print("点击了设置");
            },
            child: Icon(
              Icons.settings,
              size: 24,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              print("点击了消息");
            },
            child: Icon(
              Icons.email,
              size: 24,
            ),
          ),
          SizedBox(
            width: 6,
          ),
        ],
      ),

      ///中间具体内容页面
      body: PageView.builder(
        itemBuilder: (ctx, index) => tabPages[index],
        itemCount: tabPages.length,
        controller: _pageController,
//          physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          ///当前显示页改变
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      ///侧边栏
      drawer: _buildDrawer(),

      ///下面模块按钮
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: tabDatas.map((tab) {
          return BottomNavigationBarItem(
            icon: Icon(tab['icon']),
            title: Text(tab['name']),
          );
        }).toList(),
        currentIndex: _selectedIndex,
        onTap: (index) {
          ///点击tabBar
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  ///侧滑栏内容
  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          ///用户账户信息
          UserAccountsDrawerHeader(
            accountName: Text(
              "来肯云商",
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: Text("jack@163.com"),

            ///背景装饰
            decoration: BoxDecoration(
                gradient: new LinearGradient(
              colors: [Colors.blue, Colors.deepPurple],
            )),

            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
              backgroundColor: Colors.black26,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            title: Text(
              "账号信息",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => () {},
          ),

          ///分割线
          Divider(
            color: Colors.grey,
            height: 0.5,
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.blue),
            title: Text("帮助中心"),
            onTap: () => () {},
          ),

          ///分割线
          Divider(
            color: Colors.grey,
            height: 0.5,
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text("设置"),
            onTap: () => () {},
          ),
          Spacer(),

          ///占据生育空间
          ///退出当前账号
          Container(
            height: 48,
            width: double.infinity,
            color: Colors.blue,
            child: Center(
              child: Text(
                '退出当前账号',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///中间选择搜索功能
  Widget _buildSelectSearch() {
    return Container(
      ///圆弧矩形,白色背景
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(

          ///装饰器
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))

          ///圆弧矩形
          ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          children: <Widget>[
            ///下拉菜单
            DropdownButton<String>(
              value: dropdownValue,

              ///默认显示值
              underline: SizedBox(),

              ///下划线样式，默认是一条横线，这里去掉
              onChanged: (String newValue) {
                ///点击后选择结果
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                '客户',
                '库存',
              ]

                  ///构建下拉菜单列表
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            ///分割线
            Container(
              height: 24,
              width: 0.5,
              color: Colors.grey,
            ),

            ///搜索框
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 20),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(),

                      ///
                      hintText: '请输入关键字',

                      ///提示文本
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),

                      ///提示文属性
                      border: InputBorder.none,

                      ///隐藏输入框的线
                      prefixIcon: Icon(
                        Icons.search,
                        size: 16,
                      ),

                      ///前面的搜索提示图标
                    ),
                    onEditingComplete: () {
                      ///输入完成时调用
                      print("input text = ${textEditingController.text}");
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///页面Demo
class PageDemoWidget extends StatelessWidget {
  final String data;
  PageDemoWidget({
    Key key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    switch (data) {
      case "消息":
        return Container(
          child: Center(
            child: TabBarBodyPage(),
          ),
        );
        break;
      default:
        return Container(
          child: Center(
            child: Text(data ?? 'Demo'),
          ),
        );
        break;
    }
  }
}
