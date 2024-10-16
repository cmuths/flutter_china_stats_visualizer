class MenuConfig {
  static final Map<String, String> iconMap = {
    'menu1': 'icon1.png',
    'menu2': 'icon2.png',
    // 添加更多菜单ID和对应的图标
  };

  static String getIcon(String id) {
    return iconMap[id] ?? '';
  }
}
