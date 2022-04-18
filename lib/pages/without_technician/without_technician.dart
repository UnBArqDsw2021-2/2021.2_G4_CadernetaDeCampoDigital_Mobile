import 'package:flutter/material.dart';
import '../../components/loading.dart';
import '../../components/topbar_arrow_back.dart';
import '../../controllers/without_technician/without_technician.dart';
import '../../utils/utils.dart';
import 'components/estate_icon_card.dart';

class WithoutTechnician extends StatefulWidget {
  const WithoutTechnician({Key? key}) : super(key: key);

  @override
  State<WithoutTechnician> createState() => _WithoutTechnicianState();
}

class _WithoutTechnicianState extends State<WithoutTechnician> {
  WithoutTechnicianController withoutTechnicianController =
      WithoutTechnicianController();
  String search = "";
  List items = [];
  late Future _future;


  @override
  void initState() {
    super.initState();
    _future = withoutTechnicianController.getEstates();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopbarArrowBack(
        hasActions: false,
        title: "Propriedades sem Técnico",
        topbarHeight: size * 0.11,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Pesquise pelo nome",
                ),
                onChanged: (text) {
                  setState(() {
                    items = [];
                    search = text;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: size.height * 0.75,
              width: size.width * 0.95,
              child: FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data == true) {
                      if (search.isNotEmpty) {
                        for (dynamic item
                            in withoutTechnicianController.estates) {
                          String name = item.complemento.toString().toLowerCase();
                          if (name.contains(search.toLowerCase())) {
                            items.add(item);
                          }
                        }
                      } else {
                        items.addAll(withoutTechnicianController.estates);
                      }
                      if (items.isEmpty) {
                        return ListView(
                          shrinkWrap: true,
                          children: const <Widget>[
                            ListTile(title: Text('Nenhum item encontrado...')),
                          ],
                        );
                      }
                      // ignore: newline-before-return
                      return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return EstateIconCard(
                            estate: items[index],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'Não existem propriedades',
                          style: Utils.estateTextStyle,
                        ),
                      );
                    }
                  } else {
                    return Loading();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
