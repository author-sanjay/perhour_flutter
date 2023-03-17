import 'package:flutter/material.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';

class ManageSupport extends StatefulWidget {
  const ManageSupport({Key? key}) : super(key: key);

  @override
  State<ManageSupport> createState() => _ManageSupportState();
}

class _ManageSupportState extends State<ManageSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      ConstrainedBox(constraints:
        BoxConstraints(minHeight: MediaQuery.of(context).size.height),child:
          Container(width: MediaQuery.of(context).size.width,child:
            Column(children: [
              Topbar(title: "Manage Support",)
            ],
            ),
          ),
      ),
    );
  }
}
