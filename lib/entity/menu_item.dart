
class MenuItem {
    final String id;
    final String name;
    final bool isLeaf;
    final String icon;
    final bool isActive;
    final List<MenuItem> children;

    MenuItem({
        required this.id,
        required this.name,
        this.isLeaf = false,
        this.icon = '',
        this.isActive = false,
        this.children = const [],
    });

    MenuItem copyWith({
        String? id,
        String? name,
        bool? isLeaf,
        String? icon,
        bool? isActive,
        List<MenuItem>? children,
    }) {
        return MenuItem(
            id: id ?? this.id,
            name: name ?? this.name,
            isLeaf: isLeaf ?? this.isLeaf,
            icon: icon ?? this.icon,
            isActive: isActive ?? this.isActive,
            children: children ?? this.children,
        );
    }
}
