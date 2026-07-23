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

  /// Whether to wrap the widget with [Semantics] for external QA automation tools.
  /// Defaults to true. If false, only attaches [MetaData] for heatmap tracking.
  final bool enableSemantics;

  const ShepherdElementKey({
    super.key,
    required this.id,
    required this.child,
    this.enableSemantics = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = MetaData(
      metaData: ShepherdElementMetaData(id: id),
      behavior: HitTestBehavior.translucent,
      child: child,
    );

    if (!enableSemantics) {
      return content;
    }

    return Semantics(
      identifier: id,
      child: content,
    );
  }
}

/// Metadata object attached to the widget tree for elements.
class ShepherdElementMetaData {
  final String id;
  const ShepherdElementMetaData({required this.id});
}
