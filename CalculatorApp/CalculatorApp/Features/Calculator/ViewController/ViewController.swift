import UIKit

class ViewController: UIViewController {
    
    private var arithmeticController: ArithmeticOperationsController

    private let calculatorView = CalculatorView()
    
    init(arithmeticController: ArithmeticOperationsController = ArithmeticOperationsController()) {
        self.arithmeticController = arithmeticController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = calculatorView
        calculatorView.collectionView.delegate = self
        calculatorView.collectionView.dataSource = self
        
        arithmeticController.updateViews = { [weak self] in
            DispatchQueue.main.async {
                print("UI güncelleniyor")
                self?.calculatorView.collectionView.reloadData()
            }
        }

    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arithmeticController.buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalculatorCell.identifier, for: indexPath) as? CalculatorCell else {
            fatalError("Failed to  CalculatorCell")
        }
 
        let button = arithmeticController.buttons[indexPath.item]
        cell.configure(with: button)
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else {
            fatalError("Failed to  HeaderCell ")
        }
        header.configure(currentCalcText: arithmeticController.calculatorHeaderLabel)
        return header
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedButton = arithmeticController.buttons[indexPath.item]
        arithmeticController.didSelectButton(selectedButton)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 3
        let width = (view.bounds.width - padding * 4) / 4
        let height: CGFloat = 80
        
        if arithmeticController.buttons[indexPath.item] == .number(0) {
            return CGSize(width: width * 2 + padding, height: height)
        }
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let totalCellHeight = heightOfCellsInSection(collectionView: collectionView)
        let totalVerticalCellSpacing = CGFloat(10 * (arithmeticController.buttons.count / 4))
        
        let topPadding = view.safeAreaInsets.top
        let bottomPadding = view.safeAreaInsets.bottom
        
        let availableScreenHeight = view.frame.size.height - topPadding - bottomPadding
        
        let headerHeight = availableScreenHeight - totalCellHeight - totalVerticalCellSpacing
        
        return CGSize(width: view.frame.size.width, height: max(0, headerHeight))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    private func heightOfCellsInSection(collectionView: UICollectionView) -> CGFloat {
        let rows = ceil(CGFloat(arithmeticController.buttons.count) / 4)
        let cellHeight: CGFloat = 80
        let spacing: CGFloat = 10
        return rows * cellHeight + (rows - 1) * spacing
    }
}
