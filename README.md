
# Dynamic Tools

Help with some things in flutter

## Usage shortcuts with `context`
There's no secret, just an extension to make it easier to get the theme, screen size, scope functions, among others...
<hr>

Something like this is usually used within the build:
```dart
final theme = Theme.of(context);
```
This can be made easier by looking like this:
### Example:
```dart
class ThemeExample extends StatelessWidget {
  const ThemeExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      child: Center(
        child: Text(
          "Easy",
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
```
Obviously it will only return correctly if you correctly fill in the theme in the Material App!

Something similar happens when getting the screen size:

```dart
final sizeScreen = MediaQuery.of(context).size;
final screenHeight = screen.height;
```
### Example:
```dart
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight,
      color: context.colorScheme.background,
      child: Center(
        child: Text(
          "Easy",
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
```
