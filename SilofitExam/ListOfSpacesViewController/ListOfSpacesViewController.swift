//
//  ListOfSpacesViewController.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-03.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit
import CoreLocation

class ListOfSpacesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let spaces: [Space]
    let userCurrentLocation: CLLocation?

    init(spaces: [Space], userCurrentLocation: CLLocation?) {
        self.spaces = spaces
        self.userCurrentLocation = userCurrentLocation
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        preconditionFailure("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(SpaceCollectionViewCell.self)
    }
}

extension ListOfSpacesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spaces.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.reuse(cell: SpaceCollectionViewCell.self, for: indexPath)
        let space = spaces[indexPath.item]
        cell.configure(with: space, userCurrentLocation: userCurrentLocation)
        return cell
    }
}

extension ListOfSpacesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.width, height: 400)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
