//
//  PlayerFormModalViewController.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 5/11/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation

class PlayerFormModalViewController: UIViewController {
    
    let playerForm = PlayerFormView()
    var player: RosterEntry?
    var successHandler: (() -> Void)?
    var cancelHandler: (() -> Void)?
    
    init(displayTitle: String, player: RosterEntry) {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        self.player = player
        self.playerForm.config(title: displayTitle, name: player.user?.displayName)
        
    }
    
    func present(presentingVC: UIViewController, successHandler: @escaping () -> Void, cancelHandler: @escaping () -> Void) {
        self.successHandler = successHandler
        self.cancelHandler = cancelHandler
        presentingVC.present(self, animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kbAdjustingView = playerForm
        self.view.sv(kbAdjustingView)
        playerForm.fillContainer()
        playerForm.delegate = self
        playerForm.positionSelector.delegate = self
        playerForm.positionSelector.dataSource = self
        
        setSelected(fieldPosition: player?.getFieldPosition())
        
        self.modalTransitionStyle = .crossDissolve
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.layoutIfNeeded()
        self.addKeyboardObservers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.removeKeyboardObservers()
    }
    
    func dismiss() {
        self.dismiss(animated: false, completion: nil)
    }
}

extension PlayerFormModalViewController: PlayerFormDelegate {
    func didCancel() {
        cancelHandler?()
        dismiss()
    }
    
    func didTapOkay(name: String) {
        player?.user?.displayName = name
        player?.setFieldPosition(FieldPosition.allValues[playerForm.positionSelector.selectedRow(inComponent: 0)])
        successHandler?()
        dismiss()
    }
}

extension PlayerFormModalViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func setSelected(fieldPosition: FieldPosition?) {
        if let position = fieldPosition {
            let row = FieldPosition.allValues.index(of: position)
            playerForm.positionSelector.selectRow(row!, inComponent: 0, animated: false)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return FieldPosition.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return FieldPosition.allValues[row].displayName
    }
}
