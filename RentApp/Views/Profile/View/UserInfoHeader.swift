import UIKit

class UserInfoHeader: UIView {

    var dict: [String: AnyObject]
   
   // MARK: - Properties
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "profile")
        return iv
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    func personal_name() -> String {
        return self.dict["name"]! as! String
    }
    func set_name(name: String) {
        usernameLabel.text = name
    }
    func get_email() -> String {
        return self.dict["email"]! as! String
    }
    func set_email(email: String) {
        emailLabel.text = email
    }
    
    
    init(frame: CGRect, dict: [String: AnyObject]) {
             
        self.dict = dict
        super.init(frame: frame)
        let profileImageDimension: CGFloat = 80
        
        addSubview(profileImageView)
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: profileImageDimension).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: profileImageDimension).isActive = true
        profileImageView.layer.cornerRadius = profileImageDimension / 2
        
        addSubview(usernameLabel)
        set_name(name: personal_name())
        set_email(email: get_email())
        usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: -10).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
       
        
        addSubview(emailLabel)
        emailLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: 20).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
    }
   
}
