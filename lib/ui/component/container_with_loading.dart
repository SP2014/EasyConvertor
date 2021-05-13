import 'package:easy_convertor/providers/providers.dart';
import 'package:easy_convertor/ui/component/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContainerWithLoading extends StatelessWidget {
  final Widget _child;
  ContainerWithLoading({Widget child}) : _child = child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _child,
        HookBuilder(builder: (context) {
          final state = useProvider(loadingStateProvider);
          return state.isLoading ? const Loading() : const SizedBox();
        })
      ],
    );
  }
}
