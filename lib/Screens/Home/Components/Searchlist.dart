import 'package:flutter/material.dart';
import 'package:perhour_flutter/Colors.dart';
import 'package:perhour_flutter/Modals/Jobs/JobsModedapi.dart';
import 'package:perhour_flutter/Modals/Jobs/JobsModel.dart';
import 'package:perhour_flutter/Screens/Home/Components/ListProjects.dart';
import 'package:perhour_flutter/Screens/ListBids/ListBids.dart';

class Searchlist extends StatefulWidget {
  Searchlist({required this.search,Key? key}) : super(key: key);
  String search;
  @override
  State<Searchlist> createState() => _SearchlistState();
}

class _SearchlistState extends State<Searchlist> {

  bool _isloading = true;
  late List<Jobs> _getdeals;
  @override
  void initState() {
    super.initState();
    getDeals();
  }

  Future<void> getDeals() async {
    _getdeals = await JobsModelapi.getforsearch(widget.search);
    setState(() {
      _isloading = false;
    });
    print(_getdeals);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints:BoxConstraints(
            minHeight: MediaQuery.of(context).size.height),
        child: SingleChildScrollView(
          child: _isloading?Center(child: CircularProgressIndicator(),): Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundwhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Topbar(title: "Search Results",),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            Text("Your Search Results"),
                           ListProjects(getjobs: _getdeals)
                          ],
                        )
                ),
              )


            ],
            ),
          ),
        ),
      ),
    );
  }
}
