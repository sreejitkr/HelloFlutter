// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Hello Flutter Integration', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final enterItemNameLabel = find.byValueKey('labeltext');
    final enterItemName = find.byValueKey('labeltext');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  test('Input Value', () async {

      expect(await driver.getText(enterItemNameLabel), "Enter Item Name");
      expect(await driver.getText(enterItemNameLabel), "Enter Item Name");

    });
  });
}