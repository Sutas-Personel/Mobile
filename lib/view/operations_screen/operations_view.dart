import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/extension/context_entension.dart';
import 'operations_view_model.dart';

class OperationsScreenView extends OperationsScreenViewModel {
  List<Map<String,dynamic>> operations = [
    {
      "icon": null,
      "title": "İzin İşlemleri",
      "click": () {
        print("izin işlemleri");
      }
    },
    {"icon": null, "title": "Yönetici İşlemleri"},
    {"icon": null, "title": "Servis İşlemleri"},
    {"icon": null, "title": "Parola İşlemleri"},
    {"icon": null, "title": "Tahsilat İşlemleri"},
    {"icon": null, "title": "Soğutucu İşlemleri"},
  ];

  @override
  Widget build(BuildContext context) {
    double cardWidth = context.width * 0.4;
    double cardHeight = context.height * 0.2;
    return Scaffold(
      // backgroundColor: ,//????????????????????????????????

      appBar: AppBar(
        leading: Icon(Icons.chevron_left, color: AllColors.MAIN_GREEN),
        title: Text(
          "İŞLEMLER".toUpperCase(),
          style:
              context.textTheme.headline6.copyWith(color: AllColors.MAIN_GREEN),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.normalValue),
            child: Icon(Icons.menu, color: AllColors.MAIN_GREEN),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: operationsLists(context, cardWidth, cardHeight),
    );
  }

  Padding operationsLists(
      BuildContext context, double cardWidth, double cardHeight) {
    return Padding(
      padding: EdgeInsets.only(
          right: context.normalValue, left: context.normalValue),
      child: Container(
          child: GridView.count(
        childAspectRatio: cardWidth / cardHeight,
        crossAxisCount: 2,
        children: List.generate(operations.length, (index) {
          return OperationsCard(
              title: operations[index]["title"],
              icon: operations[index]["icon"],
              click: operations[index]["click"]);
        }),
      )),
    );
  }
}

class OperationsCard extends StatelessWidget {
  final Function click;
  final IconData icon;
  final String title;
  const OperationsCard({
    Key key,
    this.icon,
    this.title,
    this.click,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: GestureDetector(
        onTap: click != null ? click : null,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 1,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AllColors.NASTY_GREEN, AllColors.MAIN_GREEN],
                  tileMode: TileMode.repeated,
                ),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: context.lowValue),
                  child: Icon(icon == null ? Icons.settings : icon,
                      color: AllColors.BUTTON_WHITE),
                ),
                Text(
                  title,
                  style: context.textTheme.bodyText1
                      .copyWith(fontWeight: FontWeight.normal)
                      .copyWith(color: AllColors.BUTTON_WHITE),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
