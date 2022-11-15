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
    return self.allCases[0]
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
  
}
