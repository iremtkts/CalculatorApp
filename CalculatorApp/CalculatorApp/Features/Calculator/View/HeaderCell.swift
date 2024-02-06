
import UIKit

class HeaderCell: UICollectionViewCell {
    
    static let identifier = "HeaderCell"
    
    let label: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 45)
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
    
    public func configure(currentCalcText: String) {
        self.label.accessibilityIdentifier = "resultLabel" //ui testi için
        let newSize = currentCalcText.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 45)])

        if newSize.width <= self.label.frame.width {
            self.label.text = currentCalcText
        }
    }

    
    private func setupUI() {
        self.backgroundColor = .black
        self.addSubview(label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
         self.label.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -5),
         self.label.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
         self.label.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -35),
         ])
    }
}
