import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportDoneScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'KIỂM TRA CHẤT LƯỢNG SẢN PHẨM',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          )),
          backgroundColor: Color(0xff001D37),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 24,
            onPressed: () {
              Navigator.pop(context);       
            },
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: Color(0xff00294D),
          child: Column(
            children: [
              Container(
                width: 310,
                height: 200,
                decoration: BoxDecoration(color: Color(0xff001D37)),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 200.0,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 310,
                height: 100,
                //margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Color(0xff001D37)),
                child: Center(
                  child: Text(
                    'Người Kiểm Tra: nhinguyen',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
              Divider(
                height: 20.0,
                color: Colors.white,
                thickness: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 60.0, top: 60),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Cài Đặt',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 60.0, top: 40.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Đăng Xuất',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Column(children: [
          Container(
              padding: EdgeInsets.only(top: 150, left: 280),
              child: Icon(
                Icons.check_circle_outline_rounded,
                color: Color(0xff001D37),
                size: 200.0,
              )),
          Container(
            width: 1000,
            height: 100,
            padding: EdgeInsets.only(left: 400),
              child: Text(
                'Xác Nhận Thành Công',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
            width: 500,
            height: 170,
            padding: EdgeInsets.only(bottom: 100, left: 300),
            child: SizedBox(
              width: 200,
              height: 80,
              child: ElevatedButton(
                  onPressed: () {
                       Navigator.pushNamed(context, '/third');
                  },
                  child: Center(
                    child: Text(
                      'TIẾP TỤC',
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.bottomLeft,
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff001D37)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                  )),
            ),
          )
        ]));
  }

}