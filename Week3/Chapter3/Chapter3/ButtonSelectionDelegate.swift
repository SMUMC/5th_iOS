//
//  ButtonSelectionDelegate.swift
//  Chapter3
//
//  Created by 김영준 on 2023/10/10.
//

import Foundation

protocol ButtonSelectionDelegate: AnyObject {
    func didSelectButtons(mediumSelected: Bool, largeSelected: Bool)
}
