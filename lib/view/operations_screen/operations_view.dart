import 'package:SutasPersonel/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/extension/context_entension.dart';
import 'operations_view_model.dart';
import '../../core/extension/string_extension.dart';

class OperationsScreenView extends OperationsScreenViewModel {
  List<Map<String, Object>> operations = [
    {
      "icon": null,
      "title": LocaleKeys.operation_permissionProcedures.locale.toString(),
    },
    {
      "icon": null,
      "title": LocaleKeys.operation_administrativeOperations.locale.toString()
    },
    {
      "icon": null,
      "title": LocaleKeys.operation_serviceOperations.locale.toString()
    },
    {
      "icon": null,
      "title": LocaleKeys.operation_passwordOperations.locale.toString()
    },
    {
      "icon": null,
      "title": LocaleKeys.operation_collectionTransactions.locale.toString()
    },
    {
      "icon": null,
      "title": LocaleKeys.operation_chillerOperations.locale.toString()
    },
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
          LocaleKeys.operation_operationName.locale,
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
            title: operations[index]["title"].toString(),
            icon: operations[index]["icon"],
          );
        }),
      )),
    );
  }
}

class OperationsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  const OperationsCard({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
    );
  }
}
