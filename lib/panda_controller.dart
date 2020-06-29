import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';

class PandaController extends FlareControls {
  @override
  void initialize(FlutterActorArtboard artboard) {
    super.initialize(artboard);
    play("idle");
  }
  bool _isCover=false,_isSmile=true;
  //close panda eyes
  void coverEyes(cover){
    if(_isCover==cover)return;
    _isCover=cover;
    cover?
      play("password"):
      play("stop password");
    
  }
//make panda smile
void smile(smile){
    if(smile==_isSmile)return;
     _isSmile=smile;
    smile?play("yes"):play("no");
}

}
