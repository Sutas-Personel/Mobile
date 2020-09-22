import 'dart:convert';

import 'package:SutasPersonel/core/components/list_tile_card.dart';
import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/model/message_servis_model.dart';
import 'package:flutter/material.dart';
import '../../core/extension/context_entension.dart';
import 'notifications_view_model.dart';

List<Message> message = [
  Message(header: "Zachery", desc: "P.O. Box 260, 9464 Risus. Av."),
  Message(header: "Laith", desc: "6777 Semper Street"),
  Message(header: "Alexander", desc: "P.O. Box 207, 6433 Nascetur Rd."),
  Message(header: "Justin", desc: "5263 Nulla Ave"),
  Message(header: "Gabriel", desc: "8582 Sed St."),
  Message(header: "Burton", desc: "P.O. Box 658, 645 Arcu Avenue"),
  Message(header: "Henry", desc: "P.O. Box 431, 9785 Nunc St."),
  Message(header: "Rudyard", desc: "P.O. Box 884, 6309 Erat. Road"),
  Message(header: "Quinlan", desc: "173-8386 Pellentesque St."),
  Message(header: "Ferdinand", desc: "P.O. Box 289, 2668 Felis Avenue"),
  Message(header: "Brennan", desc: "1566 Velit. Avenue"),
  Message(header: "Tobias", desc: "977 Neque St."),
  Message(header: "Omar", desc: "Ap #693-1175 Duis Road"),
  Message(header: "Harrison", desc: "P.O. Box 953, 7775 Hendrerit Road")
];

class NotificationsScreenView extends NotificationsScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left, color: AllColors.MAIN_GREEN),
        title: Text(
          "BİLDİRİMLER",
          style:
              context.textTheme.headline6.copyWith(color: AllColors.MAIN_GREEN),
        ),
        actions: [Icon(Icons.menu, color: AllColors.MAIN_GREEN)],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: message.length,
        itemBuilder: (context, index) => Dismissible(
          key: UniqueKey(),
          child: ListTileCard(
            message: message[index],
          ),
          onDismissed: (direction) {
            setState(() {
              message.removeAt(index);
            });
          },
          secondaryBackground: Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: context.lowValue),
                child: Icon(Icons.cancel, color: Colors.white),
              ),
              color: context.colors.error),
          background: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: context.lowValue),
                child: Icon(Icons.cancel, color: Colors.white),
              ),
              color: context.colors.error),
        ),
      ),
    );
  }
}
