
import UIKit

class CalculatorCell: UICollectionViewCell {
    
    static let identifier = "ButtonCell"

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
       
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with button: CalculatorButtons) {
    self.label.text = button.title
    self.accessibilityIdentifier = "button\(button.title)"
    }
    
    func setupUI () {
        self.layer.cornerRadius = self.frame.size.height / 2
        backgroundColor = .purple
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo:self.layoutMarginsGuide.topAnchor),
            label.trailingAnchor.constraint(equalTo:self.layoutMarginsGuide.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
        ])

    }
}
