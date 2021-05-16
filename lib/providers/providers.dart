import 'package:easy_convertor/providers/nue_theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'loading_state_provider.dart';

final loadingStateProvider =
    ChangeNotifierProvider((ref) => LoadingStateProvider());

final neuThemeStateProvider =
    Provider<NeuThemeProvider>((ref) => NeuThemeProvider());
