//
//  PaymentViewController.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//

import UIKit
private let reuseId = "PaymentCell"
final class PaymentViewController: UIViewController, UICollectionViewDelegateFlowLayout, PaymentViewProtocol{
    
    var presenter: PaymentPresenterProtocol!
    let configurator: PaymentContainerProtocol = PaymentContainer()

    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tableView = UITableView()
    let tableViewHeight = UIScreen.main.bounds.height / 2
    var isPresenting = false
    
    lazy var backdropView: UIView = {
        let bdView = UIView(frame: self.view.bounds)
        bdView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return bdView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator.configure(with: self)
        self.view.backgroundColor = .clear
        self.view.addSubview(backdropView)
        self.view.addSubview(tableView)
            
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        backdropView.addGestureRecognizer(tapGesture)
        
        configureUI()
    }
    
    @objc
    func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    func configureUI() {
        configureTableView()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 155/255, green: 155/255, blue: 250/255, alpha: 1)
    }
    
    func configureTableView() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalToConstant: tableViewHeight).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60

        tableView.register(PaymentCell.self, forCellReuseIdentifier: reuseId)
         

        

         tableView.tableFooterView = UIView()
    }

}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return POptions.allCases.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView,viewForHeaderInSection section: Int)-> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255,green : 255/255, blue: 255/255, alpha: 1)
        
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize:16)
        title.textColor = .gray
        title.text = "Оплата"
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        
        return view
        
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSEction section: Int)->CGFloat{
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! PaymentCell
        
        let options = POptions(rawValue: indexPath.row)
        cell.textLabel?.text = options?.description
        cell.paymentType = options
       
         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            
            self.presenter.showMethods()
        case 1:
            
            self.presenter.showStat()
        case 2:
            
            self.presenter.showSettings()
        default:
            print("noaction")
        }
    }
    
}


extension PaymentViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        guard let toVC = toViewController else { return }
        isPresenting = !isPresenting
        if isPresenting == true {
        containerView.addSubview(toVC.view)
            self.tableView.frame.origin.y += tableViewHeight
        backdropView.alpha = 0
            
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            self.tableView.frame.origin.y -= self.tableViewHeight
            self.backdropView.alpha = 1.0
        }, completion: { (finished) in
            transitionContext.completeTransition(true)
        })
            
        }
        else {
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.tableView.frame.origin.y += self.tableViewHeight
                self.backdropView.alpha = 0
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
}
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}
