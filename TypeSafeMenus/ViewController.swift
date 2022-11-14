//
//  ViewController.swift
//  TypeSafeMenus
//
//  Created by Justin Bush on 11/14/22.
//

import Cocoa

class ViewController: NSViewController {
  
  @IBOutlet weak var menuObject: NSPopUpButton!
  
  // All menu items
  let menuItems = TypeSafeMenu.allItems()
  // Sub menu items
  let subMenuItems = TypeSafeMenu.build(withItems: [.iOS, .macOS, .tvOS])
  // Individual menu item
  let macMenuItem = TypeSafeMenu.macOS()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    initStaticMenu()
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
    updateMenu(withItems: menuItems, selectedItem: macMenuItem)
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


}

