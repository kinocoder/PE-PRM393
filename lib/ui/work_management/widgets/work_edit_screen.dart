import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/work.dart';
import '../view_model/work_view_model.dart';

class WorkEditScreen extends ConsumerStatefulWidget {
  final Work work;

  const WorkEditScreen({super.key, required this.work});

  @override
  ConsumerState<WorkEditScreen> createState() => _WorkEditScreenState();
}

class _WorkEditScreenState extends ConsumerState<WorkEditScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  late bool _hoanThanh;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.work.title);

    _descriptionController = TextEditingController(
      text: widget.work.description,
    );

    _hoanThanh = widget.work.hoanThanh;
  }


  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    final work = Work(
      workId: widget.work.workId,
      title: title,
      description: description,
      hoanThanh: _hoanThanh,
    );

    await ref.read(workViewModelProvider.notifier).updateWork(work);

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chỉnh sửa công việc')),

      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Tên công việc',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Vui lòng nhập tên công việc';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Mô tả',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Vui lòng nhập mô tả';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            SwitchListTile(
              title: const Text('Đã hoàn thành'),
              value: _hoanThanh,
              onChanged: (value) {
                setState(() {
                  _hoanThanh = value;
                });
              },
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Lưu thay đổi'),
            ),
          ],
        ),
      ),
    );
  }
}
