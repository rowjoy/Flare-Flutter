import 'package:flare_flutter/asset_provider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

/// Fetches a Flare from an [AssetBundle].
@immutable
class AssetFlare extends AssetProvider {
  /// The bundle from which the Flare will be obtained.
  ///
  /// The Flare is obtained by calling [AssetBundle.load] on the given [bundle]
  /// using the key given by [name].
  final AssetBundle bundle;

  /// The key to use to obtain the resource from the [bundle]. This is the
  /// argument passed to [AssetBundle.load].
  final String name;

  const AssetFlare({
    required this.bundle,
    required this.name,
  });


  /*
  hashValues to change Object.hash 

  Flutter update version error : 
  You are applying Flutter's main Gradle plugin imperatively using the apply script method, which is deprecated and will be removed in a future release. Migrate to applying Gradle plugins with the declarative plugins block: https://flutter.dev/to/flutter-gradle-plugin-apply

  /C:/Users/Mobile%20Apps/AppData/Local/Pub/Cache/hosted/pub.dev/flare_flutter-3.0.2/lib/provider/asset_flare.dart:25:23: Error: The method 'hashValues' isn't defined for the class 'AssetFlare'.
   - 'AssetFlare' is from 'package:flare_flutter/provider/asset_flare.dart' ('/C:/Users/Mobile%20Apps/AppData/Local/Pub/Cache/hosted/pub.dev/flare_flutter-3.0.2/lib/provider/asset_flare.dart').
  Try correcting the name to the name of an existing method, or defining a method named 'hashValues'.
    int get hashCode => hashValues(bundle, name);
                        ^^^^^^^^^^
  Target kernel_snapshot_program failed: Exception
  2
  
  FAILURE: Build failed with an exception.
  
  * What went wrong:
  Execution failed for task ':app:compileFlutterBuildDebug'.
  > Process 'command 'C:\flutter\flutter\bin\flutter.bat'' finished with non-zero exit value 1


  I solved this error : Change one line : 
   Old line : int get hashCode => hashValues(bundle, name);
   New line : int get hashCode => Object.hash(bundle, name);

   Work for me .....
    
  
  */
  @override
  int get hashCode => Object.hash(bundle, name);

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is AssetFlare && other.bundle == bundle && other.name == name;
  }

  @override
  Future<ByteData> load() => bundle.load(name);

  @override
  String toString() => '$runtimeType(bundle: $bundle, name: "$name")';
}
