import UIKit

class LoginView: UIView {

    var scrollView: UIScrollView!
    var wrapperView: UIView!
    var loginLabel: UILabel!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    var signUpLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpScrollView()
        setUpWrapperView()
        setUpLoginLabel()
        setUpEmailLabel()
        setUpEmailTextField()
        setUpPasswordLabel()
        setUpPasswordField()
        setUpLoginButton()
        setUpSignUpLabel()

        initConstraints()
    }

    func setUpScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
    }

    func setUpWrapperView() {
        wrapperView = UIView()
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(wrapperView)
    }

    func setUpLoginLabel() {
        loginLabel = UILabel()
        loginLabel.text = "Log in"
        loginLabel.font = .boldSystemFont(ofSize: 32)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(loginLabel)
    }

    func setUpEmailLabel() {
        emailLabel = UILabel()
        emailLabel.text = "Email address"
        emailLabel.font = .systemFont(ofSize: 16)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(emailLabel)
    }

    func setUpEmailTextField() {
        emailTextField = UITextField()
        emailTextField.placeholder = "example@email.com"
        emailTextField.font = .systemFont(ofSize: 16)
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.borderWidth = 1
        emailTextField.translatesAutoresizingMaskIntoConstraints = false

        wrapperView.addSubview(emailTextField)
    }

    func setUpPasswordLabel() {
        passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.font = .systemFont(ofSize: 16)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(passwordLabel)
    }

    func setUpPasswordField() {
        passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.font = .systemFont(ofSize: 16)
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderWidth = 1
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(passwordTextField)
    }

    func setUpLoginButton() {
        loginButton = UIButton()
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = 8
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(loginButton)
    }

    //Using Attributed String as per: stackoverflow.com/a/32269975/15136189
    func setUpSignUpLabel() {
        signUpLabel = UILabel()
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.textAlignment = .center
        signUpLabel.font = UIFont.systemFont(ofSize: 14)

        let normalText = "Don't have an account? "
        let signUpText = "Sign up"
        let attributedString = NSMutableAttributedString(string: normalText)
        let signUpAttributedString = NSAttributedString(
            string: signUpText,
            attributes: [
                .foregroundColor: UIColor.black,
                .font: UIFont.boldSystemFont(ofSize: 14)
            ])

        attributedString.append(signUpAttributedString)
        signUpLabel.attributedText = attributedString
        signUpLabel.isUserInteractionEnabled = true
        wrapperView.addSubview(signUpLabel)
    }

    func initConstraints() {

        NSLayoutConstraint.activate([
            
            // Scroll view
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),

            // Wrapper view
            wrapperView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            wrapperView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            wrapperView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            wrapperView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -48),

            // Login label
            loginLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 0),
            loginLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),

            // Email label
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),

            // Email text
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 6),
            emailTextField.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),

            // Password label
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),

            // Password text field
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 6),
            passwordTextField.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),

            // Login button
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),

            // Signup label
            signUpLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            signUpLabel.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor),
            signUpLabel.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -20)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
