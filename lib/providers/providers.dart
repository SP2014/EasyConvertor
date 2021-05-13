import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'loading_state_provider.dart';

final loadingStateProvider =
    ChangeNotifierProvider((ref) => LoadingStateProvider());
