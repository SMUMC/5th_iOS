import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let loginTextView = UITextField()
    let passwordTextView = UITextField()
    lazy var textLabel = {
        let textLabel = UILabel()
        textLabel.text = "LOGIN OR SIGNUP"
        textLabel.font = UIFont.boldSystemFont(ofSize: 20)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 1
        return textLabel
    }()
    lazy var loginBtn = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 5
        return button
    }()
    lazy var signUpBtn = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextView.placeholder = "ID"
        loginTextView.borderStyle = .roundedRect
        
        passwordTextView.placeholder = "Password"
        passwordTextView.borderStyle = .roundedRect
        
        
        loginBtn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(signButtonTapped), for: .touchUpInside)
        
        setupUI()
    }
    
    @objc private func loginButtonTapped() {
        guard let username = loginTextView.text, let password = passwordTextView.text else {
            return
        }
        
        if let savedPassword = UserDefaults.standard.string(forKey: username) {
            if password == savedPassword {
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                textLabel.text = "로그인 성공! 사용자: \(username)"
            } else {
                textLabel.text = "비밀번호가 일치하지 않습니다."
            }
        } else {
            textLabel.text = "존재하지 않는 사용자입니다."
        }
    }

        
    @objc private func signButtonTapped() {
        guard let username = loginTextView.text, let password = passwordTextView.text else {
            return
        }
        
        if UserDefaults.standard.string(forKey: username) != nil {
            showAlert(message: "이미 등록된 사용자입니다.")
        } else {
            UserDefaults.standard.set(password, forKey: username)
            showAlert(message: "회원가입이 완료되었습니다.")
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    
    private func setupUI(){
        self.view.backgroundColor = .white
        self.view.addSubview(textLabel)
        self.view.addSubview(loginTextView)
        self.view.addSubview(passwordTextView)
        self.view.addSubview(loginBtn)
        self.view.addSubview(signUpBtn)
        
        textLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(loginTextView).offset(-50)
            make.width.equalToSuperview()
        }
        loginTextView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.view).offset(-100)
            make.width.equalTo(200)
        }
        passwordTextView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginTextView).offset(50)
            make.width.equalTo(200)
        }
        loginBtn.snp.makeConstraints{ make in
            make.trailing.equalTo(passwordTextView.snp.trailing).offset(-75)
            make.top.equalTo(passwordTextView).offset(40)
            make.width.equalTo(200)
        }
        signUpBtn.snp.makeConstraints{ make in
            make.trailing.equalTo(passwordTextView.snp.trailing).offset(-70)
            make.top.equalTo(loginBtn).offset(25)
            make.width.equalTo(200)
        }
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {

    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 pro"))
        }

    }
} #endif
