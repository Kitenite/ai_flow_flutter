import 'package:ai_flow/components/home_screen/applet_preview.dart';
import 'package:ai_flow/models/applet.dart';
import 'package:ai_flow/models/collection.dart';
import 'package:ai_flow/sao/applets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectAppletGridView extends StatelessWidget {
  const SelectAppletGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Collection collection = context.watch<Collection>();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              collection.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 2,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              for (var appletId in collection.appletIds)
                FutureBuilder<Applet>(
                  future: AppletDataAccessor.getApplet(appletId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return AppletPreviewButton(applet: snapshot.data!);
                    }
                    return CircularProgressIndicator();
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
