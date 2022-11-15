# TypeSafeMenus
Simply type-safe Cocoa menus for Swift and Objective-C

## Example

### Setup

```swift
enum TypeSafeMenu {
  // define menu items (with optional custom titles)
  case iOS, macOS, tvOS, WindowsOS = "Windows OS", AndroidOS = "Android OS" 
}
```

### Access

```swift
// All menu items
let menuItems = TypeSafeMenu.allItems()
// Subset of menu items
let subMenuItems = TypeSafeMenu.build([.iOS, .macOS, .tvOS])
// Specific menu item
let macMenuItem = TypeSafeMenu.macOS()
// Selected menu item
var selectedMenuItem: TypeSafeMenu {
  return menuObject.selectedItem.observed()
}
```

### Implementation

```swift
// Populating menu
menuObject.addItems(menuItems)
// Show subset
menuObject.addItems(subMenuItems)
// Programmatically select item
menuObject.selectItem(macMenuItem)
// Get currently-selected item
_ = selectedMenuItem()
```
