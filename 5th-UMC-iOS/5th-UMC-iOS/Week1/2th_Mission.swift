//
//  2th_Mission.swift
//  5th-UMC-iOS
//
//  Created by 황인성 on 2023/10/07.
//

import UIKit
import SnapKit

class Study2WeekViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Create an array to hold your data
    let data = [
        ("Item 1", "heart.fill", "Subtitle 1", "Detail 1", "Extra 1"),
        ("Item 2", "star.fill", "Subtitle 2", "Detail 2", "Extra 2"),
        ("Item 3", "circle.fill", "Subtitle 3", "Detail 3", "Extra 3"),
        ("Item 4", "square.fill", "Subtitle 4", "Detail 4", "Extra 4"),
        ("Item 5", "triangle.fill", "Subtitle 5", "Detail 5", "Extra 5"),
        ("Item 6", "heart.fill", "Subtitle 6", "Detail 6", "Extra 6"),
        ("Item 7", "star.fill", "Subtitle 7", "Detail 7", "Extra 7"),
        ("Item 8", "circle.fill", "Subtitle 8", "Detail 8", "Extra 8"),
        ("Item 9", "square.fill", "Subtitle 9", "Detail 9", "Extra 9"),
        ("Item 10", "triangle.fill", "Subtitle 10", "Detail 10", "Extra 10")
    ]
    
    // Create a UITableView
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the table view to the view controller's view
        view.addSubview(tableView)
        
        // Register the custom cell class
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        // Use SnapKit to set up Auto Layout constraints for the table view
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

    }
    
    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue the custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        // Set the custom cell's properties
        let (title, imageName, subtitle, detail, extra) = data[indexPath.row]
        cell.titleLabel.text = title
        cell.cellImageView.image = UIImage(systemName: imageName)
        cell.cellImageView.tintColor = UIColor.blue
        
        // 추가적인 텍스트 요소들 설정
        cell.subtitleLabel.text = subtitle
        cell.detailLabel.text = detail
        cell.extraLabel.text = extra
        
        return cell
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection
        print("Selected: \(data[indexPath.row].0)")
    }
    
    // MARK: - UITableViewDelegate methods for cell height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 여기에서 각 셀의 높이를 동적으로 설정할 수 있습니다.
        return 120.0 // 예: 모든 셀의 높이를 120으로 설정
    }
}

class CustomTableViewCell: UITableViewCell {
    
    // 커스텀 셀의 UI 요소들을 정의합니다.
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 추가적인 텍스트 요소들을 정의합니다.
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let extraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 다른 커스텀 셀 요소들을 추가할 수 있습니다.
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 커스텀 셀 요소들을 서브뷰로 추가하고 SnapKit을 사용하여 Auto Layout 제약조건을 설정합니다.
        addSubview(titleLabel)
        addSubview(cellImageView)
        addSubview(subtitleLabel)
        addSubview(detailLabel)
        addSubview(extraLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(cellImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        cellImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel)
        }
        
        extraLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HorizontalScrollViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Create an array to hold your data
    let data = [
        ("Item 1", "heart.fill", "Subtitle 1", "Detail 1", "Extra 1"),
        ("Item 2", "star.fill", "Subtitle 2", "Detail 2", "Extra 2"),
        ("Item 3", "circle.fill", "Subtitle 3", "Detail 3", "Extra 3"),
        ("Item 4", "square.fill", "Subtitle 4", "Detail 4", "Extra 4"),
        ("Item 5", "triangle.fill", "Subtitle 5", "Detail 5", "Extra 5"),
        ("Item 6", "heart.fill", "Subtitle 6", "Detail 6", "Extra 6"),
        ("Item 7", "star.fill", "Subtitle 7", "Detail 7", "Extra 7"),
        ("Item 8", "circle.fill", "Subtitle 8", "Detail 8", "Extra 8"),
        ("Item 9", "square.fill", "Subtitle 9", "Detail 9", "Extra 9"),
        ("Item 10", "triangle.fill", "Subtitle 10", "Detail 10", "Extra 10")
    ]
    
    // Create a UITableView
    lazy var tableView2: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2) // 테이블 뷰를 90도 회전
        tableView.showsHorizontalScrollIndicator = false // 가로 스크롤바 숨김
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the table view to the view controller's view
        view.addSubview(tableView2)
        
        // Register the custom cell class
        tableView2.register(CustomTableViewCell2.self, forCellReuseIdentifier: "customCell")
        
        // Use SnapKit to set up Auto Layout constraints for the table view
        tableView2.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        // 스크롤을 가장 아래로 이동
        scrollToBottom(animated: true)
    }
    
    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue the custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell2
        
        // Set the custom cell's properties
        let (title, imageName, subtitle, detail, extra) = data[indexPath.row]
        cell.titleLabel.text = title
        cell.cellImageView.image = UIImage(systemName: imageName)
        cell.cellImageView.tintColor = UIColor.blue
        
        // 추가적인 텍스트 요소들 설정
        cell.subtitleLabel.text = subtitle
        cell.detailLabel.text = detail
        cell.extraLabel.text = extra
        
        // 텍스트 및 이미지를 가로로 표시하도록 회전
        cell.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection
        print("Selected: \(data[indexPath.row].0)")
    }
    
    // MARK: - UITableViewDelegate methods for cell height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 // 셀의 높이를 테이블 뷰의 너비로 설정 (가로 스크롤을 위해)
    }
    
    // MARK: - Scroll to Bottom
    
    func scrollToBottom(animated: Bool) {
        let sections = tableView2.numberOfSections
        let rows = tableView2.numberOfRows(inSection: sections - 1)
        if rows > 0 {
            let indexPath = IndexPath(row: rows - 1, section: sections - 1)
            tableView2.scrollToRow(at: indexPath, at: .bottom, animated: animated)
        }
    }
}

class CustomTableViewCell2: UITableViewCell {
    
    // 커스텀 셀의 UI 요소들을 정의합니다.
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 추가적인 텍스트 요소들을 정의합니다.
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let extraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 다른 커스텀 셀 요소들을 추가할 수 있습니다.
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 커스텀 셀 요소들을 서브뷰로 추가하고 SnapKit을 사용하여 Auto Layout 제약조건을 설정합니다.
        addSubview(titleLabel)
        addSubview(cellImageView)
        addSubview(subtitleLabel)
        addSubview(detailLabel)
        addSubview(extraLabel)
        
        
        cellImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(cellImageView.snp.bottom)
            make.centerX.equalTo(cellImageView.snp.centerX)
            //            make.leading.equalTo(cellImageView.snp.trailing).offset(16)
            //            make.trailing.equalToSuperview().offset(-16)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel)
        }
        
        extraLabel.snp.makeConstraints { make in
            make.top.equalTo(detailLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#if DEBUG
import SwiftUI
struct Study2WeekViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        Study2WeekViewController()
    }
}
@available(iOS 13.0, *)
struct Study2WeekViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            Study2WeekViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14pro"))
        }
    }
} #endif
