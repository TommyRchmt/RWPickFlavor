/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class PickFlavorDataSource: NSObject {
  
  // MARK: Identifiers
  
  private enum Identifiers {
    static let ScoopCell = "ScoopCell"
  }
  
  // MARK: Instance Variables
  
  var flavors: [Flavor] = []
  
  // MARK: Outlets
  
  @IBOutlet var collectionView: UICollectionView!
  
  // MARK: -
  
  private func scoopCellAtIndexPath(indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: Identifiers.ScoopCell, for: indexPath) as? ScoopCell else {
        return UICollectionViewCell()
    }

    configureScoopCell(cell: cell, atIndexPath: indexPath)
    return cell
  }
  
  private func configureScoopCell(cell: ScoopCell, atIndexPath indexPath: IndexPath) {
    let flavor = flavors[indexPath.row]
    cell.updateWithFlavor(flavor)
  }
  
}

// MARK: UICollectionViewDataSource
extension PickFlavorDataSource: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return flavors.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    return scoopCellAtIndexPath(indexPath: indexPath)
  }
}
