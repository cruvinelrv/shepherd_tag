/// Annotation used to tag a Dart file (widget, contract or constant file)
/// with a unique feature identifier for the Shepherd automation suite.
///
/// The Shepherd CLI will scan your project for files annotated with
/// [@ShepherdTag] and use the [id] to generate Maestro flow YAML files
/// linked to the corresponding User Story.
///
/// ### Usage
///
/// Create a dedicated constants/contract file for your feature and annotate it:
///
/// ```dart
/// import 'package:shepherd_tag/shepherd_tag.dart';
///
/// @ShepherdTag(
///   id: 'US-001',
///   description: 'Login flow with valid credentials',
/// )
/// class LoginTags {
///   static const String emailField   = 'login_email_field';
///   static const String passwordField = 'login_password_field';
///   static const String submitButton  = 'login_submit_button';
/// }
/// ```
class ShepherdTag {
  /// Unique identifier for the feature or User Story.
  ///
  /// Should match the story ID registered via the Shepherd CLI
  /// (e.g. `'US-001'`).
  final String id;

  /// Optional human-readable description of what this tagged widget/file
  /// represents. Used by the CLI to generate richer YAML comments.
  final String? description;

  /// Creates a [ShepherdTag] annotation.
  ///
  /// [id] must be unique within the project.
  const ShepherdTag({
    required this.id,
    this.description,
  });
}
