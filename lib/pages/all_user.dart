import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';

class UserListPage extends StatefulWidget {
  final MainModel model;

  UserListPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _UserListPageState();
  }
}

class _UserListPageState extends State<UserListPage> {
  @override
  initState() {
    widget.model.fetchUsers();
    super.initState();
  }

  Widget _buildEditButton(BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(model.userList[index].userEmail),
                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.endToStart) {
                        // model.selectProduct(model.allProducts[index].id);
                        // model.deleteProduct();
                      } else if (direction == DismissDirection.startToEnd) {
                        print('Swiped start to end');
                      } else {
                        print('Other Swiping');
                      }
                    },
                    background: Container(color: Colors.red),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('assets/user.jpg'),
                          ),
                          title: Text(model.userList[index].userEmail),
                          subtitle: Text(model.userList[index].isEnabled
                              ? 'Enabled'
                              : 'Not Enabled'),
                          trailing: _buildEditButton(context, index, model),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
                itemCount: model.userList.length,
              );
      },
    );
  }
}
