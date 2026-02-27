import 'package:flutter/widgets.dart';

/// A transparent widget that embeds a Shepherd [id] into the Flutter
/// widget tree via [Semantics], making it detectable by the Shepherd CLI
/// during automated test generation and by Maestro during test execution.
///
/// This widget does **not** alter the visual layout or behavior of [child].
///
/// ### Usage
///
/// Wrap your page or feature widget with [ShepherdPageTag]:
///
/// ```dart
/// import 'package:shepherd_tag/shepherd_tag.dart';
///
/// class LoginPage extends StatelessWidget {
///   const LoginPage({super.key});
///
///   @override
///   Widget build(BuildContext context) {
///     return ShepherdPageTag(
///       id: 'US-001',
///       child: Scaffold(
///         body: LoginForm(),
///       ),
///     );
///   }
/// }
/// ```
class ShepherdPageTag extends StatelessWidget {
  /// The unique identifier for this page/feature.
  ///
  /// Should match the [id] used in the corresponding [@ShepherdTag]
  /// annotation on the contracts/constants file.
  final String id;

  /// The child widget to wrap. The layout and behavior of [child] are
  /// not affected.
  ///
  /// When used as an annotation, this can be omitted.
  final Widget? child;

  /// Whether this feature is ready to be tested.
  ///
  /// When `false`, the Shepherd CLI may skip generating flows for
  /// this page. Defaults to `true`.
  final bool isReady;

  /// Creates a [ShepherdPageTag].
  const ShepherdPageTag({
    super.key,
    required this.id,
    this.child,
    this.isReady = true,
  });

  @override
  Widget build(BuildContext context) {
    return MetaData(
      metaData: _ShepherdMetaData(id: id, isReady: isReady),
      child: Stack(
        children: [
          // Render the tag physically behind the application child so it is
          // visually obscured by the Scaffold's opaque background, but fully
          // present in the standard rendering pipeline. This forces CanvasKit
          // to emit an explicit, readable accessibility text node for Maestro
          // without triggering any CSS visual culling optimizations.
          Semantics(
            label: 'shepherd:$id',
            identifier: 'shepherd:$id',
            child: Text(
              'shepherd:$id',
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                fontSize: 1,
                color: Color(0xFF222222), // Fully opaque color
              ),
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

/// Internal metadata object attached to the widget tree.
/// Used programmatically by the Shepherd CLI scanner.
class _ShepherdMetaData {
  final String id;
  final bool isReady;

  const _ShepherdMetaData({required this.id, required this.isReady});
}
