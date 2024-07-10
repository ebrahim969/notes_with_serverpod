import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:notes_flutter/core/functions/navigation.dart';
import 'package:notes_flutter/features/note/presentation/provider/create_note_provider.dart';
import 'package:notes_flutter/features/note/presentation/provider/get_all_notes_provider.dart';
import 'package:notes_flutter/features/note/presentation/widgets/custom_note_txt_form_feild.dart';
import 'package:provider/provider.dart';

class CreateNoteForm extends StatefulWidget {
  const CreateNoteForm({super.key});

  @override
  State<CreateNoteForm> createState() => _CreateNoteFormState();
}

class _CreateNoteFormState extends State<CreateNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateNoteProvider>(
      builder: (context, createNoteProvider, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (createNoteProvider.state == CreateNoteStates.success) {
            Provider.of<GetAllNotesProvider>(context, listen: false)
                .getAllNotesEvent();
            custompopNavigate();
            createNoteProvider.resetState();
          }
        });
        return Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormFeild(
                  controller: titleController, hintText: "title"),
              SizedBox(
                height: 35.rh,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    createNoteProvider.createNoteEvent(
                        title: titleController.text);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: createNoteProvider.state == CreateNoteStates.loading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text('Create Note'),
                ),
              ),
              SizedBox(
                height: 16.rh,
              ),
              createNoteProvider.state == CreateNoteStates.failure
                  ? Text(createNoteProvider.errorMessage.toString())
                  : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
