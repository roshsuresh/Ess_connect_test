import 'package:Ess_test/Application/AdminProviders/FlashNewsProviders.dart';
import 'package:Ess_test/Constants.dart';
import 'package:Ess_test/utils/constants.dart';
import 'package:Ess_test/utils/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FlashNewsHistory extends StatelessWidget {
  const FlashNewsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var p = Provider.of<FlashNewsProviderAdmin>(context, listen: false);
      p.flashlist.clear();
      p.getFlashnewsList();
    });
    var size = MediaQuery.of(context).size;
    return Consumer<FlashNewsProviderAdmin>(
      builder: (context, provider, child) {
        return provider.loading
            ? spinkitLoader()
            : ListView.builder(
                itemCount: provider.flashlist.length == null
                    ? 0
                    : provider.flashlist.length,
                itemBuilder: (context, index) {
                  String date = provider.flashlist[index].createdAt ?? '--';
                  var updatedDate = DateFormat('yyyy-MM-dd').parse(date);
                  String even = provider.flashlist[index].id.toString();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: size.width,
                      height: 105,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: UIGuide.light_Purple, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  Text('Created Date: '),
                                  Text(
                                    provider.flashlist[index].createdAt ?? '--',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                  Spacer(),
                                  kWidth,
                                  GestureDetector(
                                    onTap: () async {
                                      // String event = provider.noticeList[index].id
                                      //     .toString();
                                      // await provider.noticeDelete(event, context);

                                      // provider.noticeList.clear();
                                      // await provider.getNoticeListView(context);
                                    },
                                    child: Icon(
                                      Icons.delete_forever_outlined,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  Text('News: '),
                                  Flexible(
                                    child: Text(
                                      provider.flashlist[index].news ?? '--',
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  Text('Start Date: '),
                                  Flexible(
                                    child: Text(
                                      provider.flashlist[index].startDate ??
                                          '--',
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  Text('End Date: '),
                                  Flexible(
                                    child: Text(
                                      provider.flashlist[index].endDate ?? '--',
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
