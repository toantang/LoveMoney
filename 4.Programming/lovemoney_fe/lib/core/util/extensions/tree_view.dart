import 'dart:developer';

import 'package:flutter/material.dart';

typedef OnTap = Function(Map data);

class DynamicTreeView extends StatefulWidget {
  final List<BaseData> listData;
  final OnTap? onTap;
  final double? width;

  const DynamicTreeView(
      {Key? key, required this.listData, this.onTap, this.width})
      : super(key: key);

  @override
  _DynamicTreeViewState createState() => _DynamicTreeViewState();
}

class _DynamicTreeViewState extends State<DynamicTreeView> {
  final ChildTapListener _childTapListener = ChildTapListener(null);
  List<ParentWidget>? treeView = [];

  @override
  void initState() {
    _buildTreeView();
    _childTapListener.addListener(childTapListener);
    super.initState();
  }

  void childTapListener() {
    if (widget.onTap != null) {
      var k = _childTapListener.getMapValue()!;
      widget.onTap!(k);
    }
  }

  _buildTreeView() {
    List<String> childrenOfRoot = widget.listData
        .where((data) {
          if (data.getParentId() == Config.ROOT_ID) {
            return true;
          }
          return false;
        })
        .map((data) => data.getId())
        .toSet()
        .toList()
      ..sort((i, j) => i.compareTo(j));

    log('dynamic tree view class, childrenOfRoot: ' +
        childrenOfRoot.toString());
    List<ParentWidget> parentWidgets = [];
    for (var element in childrenOfRoot) {
      ParentWidget? parentWidget = _buildParentWidget(element, null);
      if (parentWidget != null) {
        parentWidgets.add(parentWidget);
      }
    }
    setState(() {
      treeView = parentWidgets;
    });
  }

  ParentWidget? _buildParentWidget(String parentId, String? name) {
    List<BaseData>? listData = _getChildrenFromParent(parentId);
    if (listData == null) {
      return null;
    }
    BaseData baseData =
        widget.listData.firstWhere((data) => data.getId() == parentId);
    name ?? baseData.getTitle();
    ParentWidget? parentWidget = ParentWidget(
      baseData: baseData,
      children: _buildChildren(listData),
      onTap: widget.onTap,
      key: ObjectKey(baseData.toMap()),
    );

    return parentWidget;
  }

  List<BaseData>? _getChildrenFromParent(String parentId) {
    return widget.listData
        .where((data) => data.getParentId() == parentId)
        .toList();
  }

  List<Widget> _buildChildren(List<BaseData> listData) {
    List<Widget> children = [];
    for (var baseData in listData) {
      List<BaseData>? _childrenData = _getChildrenFromParent(baseData.getId());
      if ((_childrenData?.length ?? 0) > 0) {
        String name = widget.listData
            .firstWhere((element) => element.getId() == baseData.getId())
            .getTitle();
        ParentWidget? parentWidget = _buildParentWidget(baseData.getId(), name);
        if (parentWidget != null) {
          children.add(parentWidget);
        }
      } else {
        children.add(
          ListTile(
            onTap: () {

              if (widget.onTap != null) {
                widget.onTap!(baseData.toMap());
              }
            },
            title: Text(
              baseData.getTitle(),
            ),
          ),
        );
      }
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    if (treeView != null && treeView!.isNotEmpty) {
      return SingleChildScrollView(
        child: SizedBox(
          width: widget.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: treeView!,
            ),
            physics: const BouncingScrollPhysics(),
          ),
        ),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      );
    }

    return Container();
  }

  @override
  void dispose() {
    _childTapListener.removeListener(childTapListener);
    _childTapListener.dispose();
    super.dispose();
  }
}

class ChildWidget extends StatefulWidget {
  final List<Widget>? children;
  final bool shouldExpand;

  const ChildWidget({Key? key, this.children, this.shouldExpand = false})
      : super(key: key);

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> sizeAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    prepareAnimation();
    super.initState();
  }

  void prepareAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    Animation<double> curve = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    sizeAnimation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(ChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldExpand) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  List<Widget> _buildChildren() {
    if (widget.children != null) {
      return widget.children!.map((element) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: element,
          ),
        );
      }).toList();
    }
    return [
      Container(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: sizeAnimation,
      axisAlignment: -1,
      child: Column(
        children: _buildChildren(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}

class ParentWidget extends StatefulWidget {
  final List<Widget> children;
  final BaseData baseData;
  final OnTap? onTap;

  const ParentWidget(
      {Key? key, required this.children, required this.baseData, this.onTap})
      : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>
    with SingleTickerProviderStateMixin {
  late bool shouldExpand = false;
  late final Animation<double> sizeAnimation;
  late final AnimationController animationController;

  @override
  void initState() {
    prepareAnimation();
    super.initState();
  }

  void prepareAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    Animation<double> curve = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    sizeAnimation = Tween(begin: 0.0, end: 0.5).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          onTap: () {
            /*var map = <String, dynamic>{};
            map['id'] = widget.baseData.getId();
            map['parent_id'] = widget.baseData.getParentId();
            map['title'] = widget.baseData.getTitle();
            map['extra'] = widget.baseData.getExtraData();*/
            if (widget.onTap != null) {
              widget.onTap!(widget.baseData.toMap());
            }
          },
          title: Text(widget.baseData.getTitle()),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                shouldExpand = !shouldExpand;
              });
              if (shouldExpand) {
                animationController.forward();
              } else {
                animationController.reverse();
              }
            },
            icon: RotationTransition(
              turns: sizeAnimation,
              child: const Icon(Icons.keyboard_arrow_down),
            ),
          ),
        ),
        ChildWidget(
          children: widget.children,
          shouldExpand: shouldExpand,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}

class ChildTapListener extends ValueNotifier<Map<String, dynamic>?> {
  Map<String, dynamic>? _mapValue;

  ChildTapListener(Map<String, dynamic>? value) : super(value);

  void addMapValue(Map<String, dynamic> map) {
    _mapValue = map;
    notifyListeners();
  }

  Map? getMapValue() {
    if (_mapValue == null) {
      log('dynamic tree view class: ', error: '_mapValue is null');
    }
    return _mapValue;
  }
}

class BaseData {
  final String id;
  final String parentId;
  final String name;

  Map<String, dynamic>? extra;
  BaseData({required this.id,  required this.parentId,  required this.name, this.extra});

  @override
  String toString() {
    return 'BaseData{id: ' +
        getId().toString() +
        ', parentId: ' +
        getParentId().toString() +
        ', title: ' +
        getTitle().toString() +
        ', extraData: ' +
        getExtraData().toString() +
        '}';
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map[Config.ID] = getId();
    map[Config.PARENT_ID] = getParentId();
    map[Config.TITLE] = getTitle();
    map[Config.EXTRA] = getExtraData();
    return map;
  }

  static BaseData toBaseData(Map<dynamic, dynamic> map) {
    return BaseData(
      id: map[Config.ID],
      name: map[Config.TITLE],
      parentId: map[Config.PARENT_ID],
      extra: map[Config.EXTRA],
    );
  }

  String getId() {
    return id;
  }

  Map<String, dynamic>? getExtraData() {
    return extra;
  }

  String getParentId() {
    return parentId.toString();
  }

  String getTitle() {
    return name;
  }
}

class Config {
  static const String ID = 'id';
  static const String PARENT_ID = 'parent_id';
  static const String TITLE = 'title';
  static const String EXTRA = 'extra';

  static const String ROOT_ID = '0';
}
