//
//  TypeSafeMenu.swift
//  TypeSafeMenus
//
//  Created by Justin Bush on 11/14/22.
//

enum TypeSafeMenu: String, CaseIterable {
  // Menu items
  case iOS, macOS, tvOS, WindowsOS = "Windows OS", AndroidOS = "Android OS"
  
  static var first: TypeSafeMenu {
    return .iOS
  }
  
  var title: String {
    return self.rawValue
  }
  
  static var all: [String] {
    return self.allCases.map { $0.rawValue }
  }
  
  static func allItems() -> [String] {
    return self.allCases.map { $0.rawValue }
  }
  
  static func build(withItems: [TypeSafeMenu]) -> [String] {
    return withItems.map { $0.rawValue }
  }
  
  func callAsFunction() -> String {
      return self.rawValue
  }
  
//  static func selectedItem(_ menuItem: NSMenuItem) -> TypeSafeMenu {
//    return menuItem.safeItem
//  }
  
}

//extension String {
//  
//  var menuItem: TypeSafeMenu {
//    for itm in TypeSafeMenu.allCases {
//      if self == itm() {
//        return itm
//      }
//    }
//    return TypeSafeMenu.first
//  }
//  
//}

