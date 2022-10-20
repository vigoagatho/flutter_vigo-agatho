import 'package:finite_testing/screen/menu/menu_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var menuService = Provider.of<MenuService>(context, listen: false);
      await menuService.getMenu();
    });
  }
  

  Widget listView(MenuService menuService) {
    final provider = Provider.of<MenuService>(context);
    return ListView.builder(
        itemCount: provider.menu.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(provider.menu[index].id.toString() +
                '. ' +
                provider.menu[index].name),
          );
        });
  }

  Widget body(MenuService menuService) {
    final isLoading = menuService.state == MenuState.loading;
    final isError = menuService.state == MenuState.error;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isError) {
      return const Center(
        child: Text('Gagal Menampilkan Data'),
      );
    }

    return listView(menuService);
  }

  @override
  Widget build(BuildContext context) {
    MenuService menuService = Provider.of<MenuService>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          centerTitle: true,
        ),
        body: body(menuService));
  }
}
