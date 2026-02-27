# shepherd_tag

[![pub package](https://img.shields.io/pub/v/shepherd_tag.svg)](https://pub.dev/packages/shepherd_tag)

Lightweight tagging system for the [Shepherd](https://pub.dev/packages/shepherd) automation suite.

`shepherd_tag` lets Flutter developers annotate their widgets and pages with **User Story identifiers**, enabling the Shepherd CLI to automatically generate [Maestro](https://maestro.mobile.dev/) test flows linked to those stories.

---

## Features

- `@ShepherdTag` — annotates a contract/constants file with a story `id`
- `ShepherdPageKey` — embeds the `id` into the widget tree via `Semantics`, making it detectable by Maestro and the Shepherd CLI
- **Zero runtime dependencies** beyond the Flutter SDK
- **No impact** on UI layout or behavior

---

## Getting started

Add `shepherd_tag` to your `pubspec.yaml`:

```yaml
dependencies:
  shepherd_tag: ^0.0.4
```

---

## Usage

### 1. Create a contract file with `@ShepherdTag`

```dart
// lib/features/auth/auth_tags.dart
import 'package:shepherd_tag/shepherd_tag.dart';

@ShepherdTag(
  id: 'US-001',
  description: 'Login flow with valid credentials',
)
class AuthTags {
  static const String emailField    = 'auth_email_field';
  static const String passwordField = 'auth_password_field';
  static const String submitButton  = 'auth_submit_button';
}
```

### 2. Wrap your page with `ShepherdPageKey`

```dart
// lib/features/auth/presentation/login_page.dart
import 'package:shepherd_tag/shepherd_tag.dart';
import '../auth_tags.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShepherdPageKey(
      id: 'US-001',
      child: Scaffold(
        body: Column(
          children: [
            ShepherdElementKey(
              id: AuthTags.emailField,
              child: const TextField(...),
            ),
            ShepherdElementKey(
              id: AuthTags.submitButton,
              child: ElevatedButton(...),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 3. Generate the Maestro flow via the Shepherd CLI

```bash
shepherd test gen --story US-001
# Finds all @ShepherdTag(id: 'US-001') in your project
# Generates .maestro/flows/auth/us001_login_test.yaml
```

---

## API Reference

### `@ShepherdTag`

| Parameter     | Type      | Required | Description                            |
|---------------|-----------|----------|----------------------------------------|
| `id`          | `String`  | ✅        | Unique story/feature identifier        |
| `description` | `String?` | ❌        | Human-readable description for the CLI |

### `ShepherdPageKey`

| Parameter  | Type      | Required | Default | Description                               |
|------------|-----------|----------|---------|-------------------------------------------|
| `id`       | `String`  | ✅        | —       | Story/feature identifier                  |
| `child`    | `Widget`  | ✅        | —       | The page/widget to wrap                   |
| `isReady`  | `bool`    | ❌        | `true`  | Whether this feature is ready to be tested |

---

## Additional information

- Part of the [Shepherd](https://pub.dev/packages/shepherd) ecosystem
- Report issues at the [issue tracker](https://github.com/cruvinelrv/shepherd_tag/issues)
