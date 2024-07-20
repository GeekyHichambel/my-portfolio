import 'package:flutter/material.dart';

class Config with ChangeNotifier{
  int _hovered_nav = -1;
  int _hovered_bento = -1;
  int _hovered_footer_icon = -1;
  int _hovered_skill = -1;
  int _visible_project = 0;
  bool _know_more = false;
  bool _collapse = false;
  String _section_visible = '';

  int get hovered_nav => _hovered_nav;
  int get hovered_bento => _hovered_bento;
  int get hovered_footer_icon => _hovered_footer_icon;
  int get hovered_skill => _hovered_skill;
  int get visible_project => _visible_project;
  String get section_visble => _section_visible;
  bool get know_more => _know_more;
  bool get collapse => _collapse;

  void set_visible_project(int v){
    _visible_project = v;
    notifyListeners();
  }

  void set_hovered_nav(int nav){
    _hovered_nav = nav;
    notifyListeners();
  } 

  void set_hovered_bento(int bento){
    _hovered_bento = bento;
    notifyListeners();
  } 

   void set_hovered_footer(int icon){
    _hovered_footer_icon = icon;
    notifyListeners();
  } 

  void set_know_more(bool v){
    _know_more = v;
    notifyListeners();
  }

  void  set_collapse(bool v){
    _collapse = v;
    notifyListeners();
  }

  void set_skill_hovered(int v){
    _hovered_skill = v;
    notifyListeners();
  }

   void set_section_visible(String sec){
    _section_visible = sec;
    notifyListeners();
  } 
}