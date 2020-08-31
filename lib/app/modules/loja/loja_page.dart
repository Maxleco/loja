import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja/app/shared/utils/colors.dart';
import 'loja_controller.dart';

class LojaPage extends StatefulWidget {
  final String title;
  const LojaPage({Key key, this.title = "Loja"}) : super(key: key);

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends ModularState<LojaPage, LojaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: PRIMARY_COLOR,
              height: size.height * 0.35,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/logo_bwolf.png",
                    height: 150,
                  ),
                  Text("Think like a wolf",
                      style: GoogleFonts.chelseaMarket(fontSize: 30))
                ],
              ),
            ),
            Container(
              height: size.height * 0.68,
              child: Observer(
                builder: (BuildContext context) {
                  if (controller.lojas == null) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.lojas.length == 0) {
                    return Center(child: Text("Nenhum dado encontrado!"));
                  }

                  return ListView.builder(
                    itemCount: controller.lojas.length,
                    itemBuilder: (BuildContext context, int index) {
                      var currentItem = controller.lojas[index];
                      return ListTile(
                        onTap: () {
                          Modular.to.pushNamed(
                              "/produto/${currentItem.nome}/${currentItem.logo}/${currentItem.id}");
                        },
                        title: Text(
                          "${currentItem.nome}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text("Melhor Loja"),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/${currentItem.logo}"),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Observer(builder: (_) {
        if (controller.isLogged) {
          return FloatingActionButton(
            onPressed: () {
              Modular.to.pushNamed("/carrinho/Vindo da Loja");
            },
            backgroundColor: PRIMARY_COLOR,
            child: Icon(Icons.shopping_cart),
          );
        } else {
          return FloatingActionButton(
            onPressed: () {
              Modular.to.pushNamed("/login");
            },
            backgroundColor: Colors.red,
            child: Icon(Icons.person),
          );
        }
      }),
    );
  }
}
