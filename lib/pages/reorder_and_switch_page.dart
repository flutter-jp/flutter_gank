import 'package:flutter/material.dart';
import 'package:flutter_gank/blocs/app_model_bloc.dart';
import 'package:flutter_gank/blocs/bloc_provider.dart';
import 'package:flutter_gank/model/app_model.dart';

class ReorderAndSwitchPage extends StatefulWidget {
  static const realName = "/reorderAndSwitch";

  @override
  _ReorderAndSwitchPageState createState() => new _ReorderAndSwitchPageState();
}

class _ReorderAndSwitchPageState extends State<ReorderAndSwitchPage> {
  List<AppModel> allAppModel = [];

  AppModelBloc appModelBloc;

  @override
  void initState() {
    appModelBloc = BlocProvider.of<AppModelBloc>(context);
    _read();
    super.initState();
  }

  _read() async {
    allAppModel = await appModelBloc.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('模块排序及开关'),
      ),
      body: StreamBuilder(
        stream: appModelBloc.appModelStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final List<AppModel> allAppModel = snapshot.data;
            allAppModel.sort((a, b) {
              return a.modelIndex.compareTo(b.modelIndex);
            });
            return ReorderableListView(
                children: allAppModel.map(buildListTile).toList(),
                onReorder: _onReorder);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final AppModel item = allAppModel.removeAt(oldIndex);
      allAppModel.insert(newIndex, item);

      for (int i = 0; i < allAppModel.length; i++) {
        AppModel appModel = allAppModel[i];
        if (appModel.modelIndex != i) {
          appModel.modelIndex = i;
          appModelBloc.update(appModel);
        }
      }
      /* appModelBloc.delete(item);
      appModelBloc.insert(item);*/
    });
  }

  Widget buildListTile(AppModel item) {
    return CheckboxListTile(
      key: Key(item.nameEn),
      value: (item.enable == 1) ? true : false,
      onChanged: (bool newValue) {
        setState(() {
          item.enable = newValue ? 1 : 0;
          appModelBloc.update(item);
          print(item);
        });
      },
      title: Text(item.nameCn),
      secondary: Icon(Icons.drag_handle),
    );
  }
}

