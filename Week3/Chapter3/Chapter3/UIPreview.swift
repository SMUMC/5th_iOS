//
//  UIPreview.swift
//  Chapter3
//
//  Created by 김영준 on 2023/10/08.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

// MARK: - Preview for UIView
@available(iOS 13.0, *)
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View

    init( builder: @escaping () -> View) {
        view = builder()
    }

    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

// MARK: - Preview for UIViewController
@available(iOS 13.0, *)
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init( builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    func makeUIViewController(context: Context) -> ViewController {
        return viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        viewController.view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        viewController.view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

#endif
