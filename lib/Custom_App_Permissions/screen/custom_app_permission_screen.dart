import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Custom_App_Permissions/resources/permissions_service.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';

class CustomAppPermissionScreen extends StatefulWidget {
  const CustomAppPermissionScreen({Key? key}) : super(key: key);

  @override
  _CustomAppPermissionScreenState createState() =>
      _CustomAppPermissionScreenState();
}

class _CustomAppPermissionScreenState extends State<CustomAppPermissionScreen> {
  PermissionsService _permissionsService = PermissionsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Custom App Permissions'),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              _permissionsService.requestContactPermissions(() {
                print('permission denied');
              });
            },
            child: Text("Contact"),
          ),
        ],
      ),
    );
  }
}
