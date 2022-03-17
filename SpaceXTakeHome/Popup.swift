//
//  Popup.swift
//  SpaceXTakeHome
//
//  Created by Saturn on 3/15/22.
//

import UIKit

class Popup: UIView {
    
    let dao = DAO.sharedInstance

    
    fileprivate let yearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitle("Choose the YEARS", for: .normal)
        return button
    }()
    
    
    
    fileprivate let container: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 24
        return containerView
    }()
    
    func createSingleButton(yearString: String)->UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .blue
        button.setTitle(yearString, for: .normal)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        return button
    }
    
    @objc func buttonAction(_ sender:UIButton!)
    {
        if sender.backgroundColor == .blue {
            print("selected to see \(sender.titleLabel!.text!)") // ?? "Unsure")")
//            sender.setTitle("456789", for: .normal)
            sender.backgroundColor = .red
            dao.currentYearsShow.append(sender.titleLabel!.text!)
        }
        else {
            print("deselected")
            sender.backgroundColor = .blue
            if let index = dao.currentYearsShow.firstIndex(of: "\(sender.titleLabel!.text!)") {
                dao.currentYearsShow.remove(at: index)
            }

        }

        print(dao.currentYearsShow)
    }
    
    fileprivate lazy var stack: UIStackView = {
        var arrayOfButtons: [UIButton] = [yearButton]
        for i in 2018...2020 {
            arrayOfButtons.append(createSingleButton(yearString: "\(i)"))
        }
        //        let arrayOfButtons = [yearLabel, button2018, button2019, button2020]
        let stack = UIStackView(arrangedSubviews: arrayOfButtons)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 5
        return stack
    }()
    
    @objc fileprivate func animateOut() {
        //        UIView.animate(withDuration: 0.3) {
        //            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        //        }
        self.removeFromSuperview()
        //        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
        //
        //        }) { (complete) in
        //            if complete {
        //                self.removeFromSuperview()
        //        }
        //    }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
        
        
        self.backgroundColor = .gray
        self.frame = UIScreen.main.bounds
        
        self.addSubview(container)
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45).isActive = true
        
        container.addSubview(stack)
        stack.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7).isActive = true
        stack.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        //        stack.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        //        stack.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        stack.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder")
    }
}
/*
 fileprivate let button2018: UIButton = {
 let button = UIButton()
 button.translatesAutoresizingMaskIntoConstraints = false
 button.backgroundColor = .red
 button.setTitle("2018", for: .normal)
 return button
 }()
 
 fileprivate let button2019: UIButton = {
 let button = UIButton()
 button.translatesAutoresizingMaskIntoConstraints = false
 button.backgroundColor = .blue
 button.setTitle("2019", for: .normal)
 return button
 }()
 
 fileprivate let button2020: UIButton = {
 let button = UIButton()
 button.translatesAutoresizingMaskIntoConstraints = false
 button.backgroundColor = .blue
 button.setTitle("2020", for: .normal)
 return button
 }()
 
 */


/*
 fileprivate let yearLabel: UILabel = {
 let label = UILabel()
 label.translatesAutoresizingMaskIntoConstraints = false
 label.font = UIFont.systemFont(ofSize: 16)
 label.text = "Choose the YEARS"
 label.textAlignment = .center
 return label
 }()
 
 */
