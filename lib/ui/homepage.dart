import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testbank/constant.dart';
import 'package:testbank/manager/cache_manager.dart';
import 'package:testbank/manager/userlog_cache_manager.dart';
import 'package:testbank/modal/userlogmodal.dart';
import 'package:testbank/ui/depositmoneypage.dart';
import 'package:testbank/ui/withdrawmoneypage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ICacheManager<UserLogModel> cacheManager;
  late Timer _timer;
  @override
  void initState() {
    cacheManager = new UserLogCacheManager("UserNewLogCache1");
    cachInit();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        var userLog = cacheManager.getValues();
      });
    });
    super.initState();
  }

  void cachInit() async {
    await cacheManager.init();
  }

  @override
  Widget build(BuildContext context) {
    var userLog = cacheManager.getValues();
    double toplam = 0;
    if (userLog != null) {
      for (var i = 0; i < userLog.length; i++) {
        if (userLog[i].userId != AppLoginUser.loginUserIndex) continue;
        if (userLog[i].islem == "1") {
          toplam += double.parse(userLog[i].amount!);
        } else {
          toplam -= double.parse(userLog[i].amount!);
        }
      }
    }
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Container(
        child: SafeArea(
          child: userLog == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/logo.png",
                                  height: 38,
                                  width: 90,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (Platform.isAndroid) {
                                      SystemNavigator.pop();
                                    } else if (Platform.isIOS) {
                                      exit(0);
                                    }
                                  },
                                  child: Icon(
                                    Icons.exit_to_app,
                                    color: AppColors.whiteGrey,
                                    size: 38,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              toplam.toStringAsFixed(2) + " TL",
                              style: TextStyle(
                                  color: AppColors.whiteGrey,
                                  fontSize: AppFonst.bigSize * 1.21),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Toplam Para",
                              style: TextStyle(
                                  color: AppColors.whiteGrey,
                                  fontSize: AppFonst.mediumSize),
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DepositeMoneyPage(
                                              model: cacheManager,
                                              totalAmount: toplam,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color:
                                              Colors.blueGrey.withOpacity(.5)),
                                      child: Center(
                                        child: Text(
                                          "Para Çek",
                                          style: TextStyle(
                                              color: AppColors.whiteGrey,
                                              fontSize: AppFonst.bigSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WithdrawMoneyPage(
                                              model: cacheManager,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color:
                                              Colors.blueGrey.withOpacity(.5)),
                                      child: Center(
                                        child: Text(
                                          "Para Yatır",
                                          style: TextStyle(
                                              color: AppColors.whiteGrey,
                                              fontSize: AppFonst.bigSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Hesap Hareketleri",
                              style: TextStyle(color: AppColors.whiteGrey),
                            ),
                            Divider(
                              height: 3,
                              color: AppColors.whiteGrey,
                            ),
                            Card(
                              elevation: 2,
                              color: AppColors.grey.withOpacity(.6),
                              shadowColor: AppColors.whiteGrey,
                              child: Container(
                                height: 300,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      for (var i = 0; i < userLog.length; i++)
                                        if (userLog[i].userId ==
                                            AppLoginUser.loginUserIndex)
                                          HesapHareket(
                                            islemType:
                                                userLog[i].islem.toString(),
                                            islemDate: userLog[i].islemDate!,
                                            miktar: double.parse(
                                                userLog[i].amount!),
                                          ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class HesapHareket extends StatefulWidget {
  const HesapHareket({
    Key? key,
    required this.islemDate,
    required this.islemType,
    required this.miktar,
  }) : super(key: key);
  final DateTime islemDate;
  final String islemType;
  final double miktar;
  @override
  _HesapHareketState createState() => _HesapHareketState();
}

class _HesapHareketState extends State<HesapHareket> {
  @override
  Widget build(BuildContext context) {
    String date = DateFormat('yyyy-MM-dd – kk:mm').format(widget.islemDate);
    String islemType = widget.islemType == "1" ? "Para Yatırma" : "Para Çekme";
    String miktari = widget.miktar.toStringAsFixed(2).toString();
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              date,
              style: TextStyle(
                  color: AppColors.whiteGrey, fontSize: AppFonst.smallSize),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              islemType,
              style: TextStyle(
                  color: AppColors.whiteGrey, fontSize: AppFonst.smallSize),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              (widget.islemType == "1" ? "+" : "-") + miktari + "TL",
              style: TextStyle(
                  color: AppColors.whiteGrey, fontSize: AppFonst.smallSize),
            ),
          )
        ],
      ),
    );
  }
}
