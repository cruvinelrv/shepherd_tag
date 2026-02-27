import 'package:flutter/widgets.dart';

/// A widget that wraps its child with [Semantics] to expose a unique
/// identifier to the Shepherd automation suite and Maestro.
///
/// Similar to [ValueKey], but instead of being internal to Flutter's
/// reconciliation, it is exposed to the platform's accessibility tree
/// so it can be targeted by Maestro tests.
class ShepherdElementKey extends StatelessWidget {
  /// Unique identifier for this element.
  final String id;

  /// The child widget to wrap.
  final Widget child;

  const ShepherdElementKey({
    super.key,
    required this.id,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      explicitChildNodes: true,
      label: id,
      identifier: id,
      child: child,
    );
  }
}
