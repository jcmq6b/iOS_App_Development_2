//
//  MainPageViewController.swift
//  ConstraintsChallenge

import UIKit

class MainPageViewController: UIViewController {

    let labelName = UILabel()
    let labelTitle = UILabel()
    let labelAmount = UILabel()
    let labelDescription = UILabel()
    
    let titleTextField = UITextField()
    let amountTextField = UITextField()
    let descriptionTextArea = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure Labels
        labelName.text = "Name" //Can be canged by func later if wanted
        labelTitle.text = "Title: "
        labelAmount.text = "Amount: "
        labelDescription.text = "Description:"
        
        //Configuring text elements
        titleTextField.placeholder = "Enter title here"
        amountTextField.placeholder = "Ex. 50.00"
        descriptionTextArea.text = ""
        
        //Add interface elements to the view
        //Not sure if there is a way to do this on one one line
        view.addSubview(labelName)
        view.addSubview(labelTitle)
        view.addSubview(labelAmount)
        view.addSubview(labelDescription)
        view.addSubview(titleTextField)
        view.addSubview(amountTextField)
        view.addSubview(descriptionTextArea)
        

    }
    
    private func setConstraintsNameLabel() -> [NSLayoutConstraint]{
        let constraintTop = NSLayoutConstraint(item: labelName, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide.topAnchor , attribute: .top, multiplier: 1.0, constant: 28.0)
        
        let constraintLeading = NSLayoutConstraint(item: <#T##Any#>, attribute: <#T##NSLayoutConstraint.Attribute#>, relatedBy: <#T##NSLayoutConstraint.Relation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutConstraint.Attribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
        
        let constraintTailing = NSLayoutConstraint(item: <#T##Any#>, attribute: <#T##NSLayoutConstraint.Attribute#>, relatedBy: <#T##NSLayoutConstraint.Relation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutConstraint.Attribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
        
        return [constraintTop, constraintLeading, constraintTrailing]
    }

}
