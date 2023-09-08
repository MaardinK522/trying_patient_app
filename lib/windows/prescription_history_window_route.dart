import 'package:flutter/material.dart';
import 'package:phyzzicare/list_items/prescription_route_listview_item.dart';

class PrescriptionsHistoryWindowRoute extends StatefulWidget {
  const PrescriptionsHistoryWindowRoute({Key? key}) : super(key: key);

  @override
  State<PrescriptionsHistoryWindowRoute> createState() =>
      _PrescriptionsHistoryWindowRouteState();
}

class _PrescriptionsHistoryWindowRouteState
    extends State<PrescriptionsHistoryWindowRoute> {
  final TextEditingController searchTextController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        leading: (isSearching)
            ? IconButton(
                onPressed: () {
                  openCloseSearch();
                },
                icon: const Icon(Icons.search_off_rounded),
              )
            : const Center(),
        actions: [
          (isSearching)
              ? Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    onPressed: () {
                      searchTextController.clear();
                    },
                    icon: const Icon(Icons.close_rounded),
                  ),
                )
              : IconButton(
                  onPressed: () {
                    openCloseSearch();
                  },
                  icon: const Icon(Icons.search_rounded)),
        ],
        centerTitle: true,
        title: (isSearching)
            ? TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                showCursor: true,
                cursorColor: Colors.white,
                controller: searchTextController,
                expands: false,
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 5,
                    ),
                  ),
                ),
              )
            : const Text("PhyzziCare"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onVerticalDragCancel: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast,
                  ),
                  itemCount: 10,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  itemBuilder: (context, index) =>
                      const PrescriptionRouteListviewItem(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  openCloseSearch() {
    setState(() {
      isSearching = !isSearching;
    });
  }
}
