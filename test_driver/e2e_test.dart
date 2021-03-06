import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:screenshots/screenshots.dart';
import 'package:image/image.dart';
import 'package:diff_image/diff_image.dart';
import 'package:ozzie/ozzie.dart';

void main() {

  group('Smoke Tests', () {
    final enterItemNameLabel = find.byValueKey('labeltext');
    final enterItemName = find.byValueKey('textfield');
    FlutterDriver driver;
    Ozzie ozzie;

    setUpAll(() async {
      new Directory('/tmp/screenshots11').create();
      driver = await FlutterDriver.connect();
      ozzie = Ozzie.initWith(driver, groupName: 'E2E1');
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

    test('Test Scenario 2',() async{
      await ozzie.takeScreenshot('Scenario2');
    });
    test('Test Scenario 1', () async {
      final config = Config();
      expect(await driver.getText(enterItemNameLabel), "Enter Item Name");
      expect(await driver.getText(enterItemName), "Add Item");
      await screenshot(driver, config, 'varuna');
      await ozzie.takeScreenshot('Scenario1');
//      await screenshots(
//          configPath: 'screenshots.yaml',
//          mode: 'recording',
//          flavor: 'no flavor',
//          isBuild: false,
//          isVerbose: true);
//      await screenshots(
//          configPath: 'screenshots.yaml',
//          mode: 'comparison',
//          flavor: 'no flavor',
//          isBuild: false,
//          isVerbose: true);
//      await takeScreenshot(driver, 'screenshots/anc.png');
//      var diff = await DiffImage.compareFromUrl('file://screenshots/anc.png', 'file://screenshots/varuna.png');
//      print('The difference between images is: $diff %');
    });
  });
}
