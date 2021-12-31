import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/MVVM%20Architecture%20lib/view_model/view_model_implementation.dart';

class MVVMscreen extends StatefulWidget {
  const MVVMscreen({Key? key}) : super(key: key);

  @override
  _MVVMscreenState createState() => _MVVMscreenState();
}

class _MVVMscreenState extends State<MVVMscreen> {
  late final TextEditingController controller = TextEditingController();
  late SubscriptionViewModelImpl _viewModel;

  @override
  void initState() {
    _viewModel = SubscriptionViewModelImpl();

    controller.addListener(
      () {
        _viewModel.inputMailText.add(controller.text);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<String?>(
                stream: _viewModel.outputErrorText,
                builder: (context, snapshot) {
                  return TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      errorText: snapshot.data,
                      hintText: 'Email',
                    ),
                  );
                },
              ),
            ),
            StreamBuilder<bool>(
                stream: _viewModel.outputIsButtonEnabled,
                builder: (context, snapshot) {
                  return SubmitButton(enabled: snapshot.data ?? false);
                }),
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final bool enabled;
  const SubmitButton({Key? key, required this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Submit"),
      onPressed: !enabled ? null : () {},
    );
  }
}
