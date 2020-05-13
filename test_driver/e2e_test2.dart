import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:screenshots/screenshots.dart';
import 'package:image/image.dart';
import 'package:diff_image/diff_image.dart';
import 'package:ozzie/ozzie.dart';
@Tags(const ['varuna'])
void main() {

  group('hi', () {
    final enterItemNameLabel = find.byValueKey('labeltext');
    final enterItemName = find.byValueKey('textfield');
    FlutterDriver driver;
    Ozzie ozzie;

    setUpAll(() async {
      new Directory('/tmp/screenshots').create();
      driver = await FlutterDriver.connect();
      ozzie = Ozzie.initWith(driver, groupName: 'SmokeTest2');
    });

    takeScreenshot(FlutterDriver driver, String path) async {
      final List<int> pixels = await driver.screenshot();
      final File file = new File(path);
      await file.writeAsBytes(pixels);
      print(path);
    }

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
        ozzie.generateHtmlReport();
      }
    });

    test('Test Scenario E2E2', () async {
      expect(await driver.getText(enterItemNameLabel), "Enter Item Name");
      expect(await driver.getText(enterItemName), "Add Item");
      await ozzie.takeScreenshot('E2E2');
    });
  });
}
