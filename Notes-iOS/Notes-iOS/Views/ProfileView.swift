import UIKit

class ProfileView: UIView {

    var contentWrapper: UIScrollView!
    var nameValueLabel: UILabel!
    var emailValueLabel: UILabel!
    var logoutButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupContentWrapper()
        setUpProfileValueLabel()
        setUpEmailValueLabel()

        initConstraints()
    }

    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }

    func setUpProfileValueLabel() {
        nameValueLabel = UILabel()
        nameValueLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameValueLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameValueLabel)
    }

    func setUpEmailValueLabel() {
        emailValueLabel = UILabel()
        emailValueLabel.font = emailValueLabel.font.withSize(18)
        emailValueLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(emailValueLabel)
    }
    
    func setUpLogoutButton() {
        logoutButton = UIButton()
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.red, for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoutButton)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            
            //Scroll view
            contentWrapper.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.heightAnchor),

            //Name Label
            nameValueLabel.centerXAnchor.constraint(
                equalTo: contentWrapper.centerXAnchor),
            nameValueLabel.topAnchor.constraint(
                equalTo: contentWrapper.topAnchor, constant: 32),

            //Email Label
            emailValueLabel.topAnchor.constraint(
                equalTo: nameValueLabel.bottomAnchor, constant: 30),
            emailValueLabel.centerXAnchor.constraint(
                equalTo: contentWrapper.centerXAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
