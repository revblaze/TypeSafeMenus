//
//  ViewController.swift
//  TypeSafeMenus
//
//  Created by Justin Bush on 11/14/22.
//

import Cocoa

class ViewController: NSViewController {
  
  @IBOutlet weak var menuObject: NSPopUpButton!
  @IBOutlet weak var selectedMenuItemLabel: NSTextField!
  
  // All menu items
  let menuItems = TypeSafeMenu.allItems()
  // Sub menu items
  let subMenuItems = TypeSafeMenu.build(withItems: [.iOS, .macOS, .tvOS])
  // Individual menu item
  let macMenuItem = TypeSafeMenu.macOS()
  // Selected menu item
  var selectedMenuItem: TypeSafeMenu {
    let selectedItem = menuObject.selectedItem!.safeItem
    return selectedItem
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    initStaticMenu()
    addObserver(menuObject)
  }
  
  func initStaticMenu() {
    updateMenu(withItems: menuItems)
  }
  
  func showOnlyApplePlatforms() {
    updateMenu(withItems: subMenuItems)
  }
  
  func showAllPlatforms() {
    updateMenu(withItems: menuItems)
  }
  
  func selectMacMenuItem() {
    selectMenu(item: macMenuItem) // or,
    // set new menu items with default selection:
    // updateMenu(withItems: menuItems, selectedItem: macMenuItem)
  }
  
  
  
  // MARK: - Menu Handler
  
  func updateMenu(withItems: [String]) {
    menuObject.removeAllItems()
    menuObject.addItems(withTitles: withItems)
  }
  
  func selectMenu(item: String) {
    if menuObject.itemTitles.contains(item) {
      menuObject.selectItem(withTitle: item)
    }
  }
  
  func updateMenu(withItems: [String], selectedItem: String) {
    updateMenu(withItems: withItems)
    selectMenu(item: selectedItem)
  }
  
  func updateSelectedItemLabel(text: String) {
    selectedMenuItemLabel.stringValue = text
    selectedMenuItemLabel.renderMono()
  }
  
  
  // MARK: - UI Handler
  
  @IBAction func toggleMenuSubsetCheckbox(_ sender: NSButton) {
    switch sender.state {
    case .on:
      showOnlyApplePlatforms()
    default:
      showAllPlatforms()
    }
  }
  
  @IBAction func selectMacMenuItemButtonAction(_ sender: NSButton) {
    selectMacMenuItem()
  }

  
  
  // MARK: - Observer
  
  func addObserver(_ forObject: NSPopUpButton) {
    NotificationCenter.default.addObserver(
        self,
        selector: #selector(self.didChangeItem(_:)),
        name: NSMenu.didChangeItemNotification,
        object: forObject.menu)
  }
  
  @objc func didChangeItem(_ notification: Notification?) {
    let title = selectedMenuItem()
    updateSelectedItemLabel(text: title)
  }
  

}



extension NSMenuItem {
  
  var safeItem: TypeSafeMenu {
    for i in TypeSafeMenu.allCases {
      if i() == self.title {
        return i
      }
    }
    return TypeSafeMenu.first
  }
  
}



extension NSTextField {
  
  func renderMono() {
    self.font = .monospacedSystemFont(ofSize: 13, weight: .medium)
  }
  
}
