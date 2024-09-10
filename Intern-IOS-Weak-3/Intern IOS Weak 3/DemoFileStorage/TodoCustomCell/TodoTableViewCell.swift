//
//  TodoTableViewCell.swift
//  Dang Vu Gia Huy
//
//  Created by Huy Gia on 8/9/24.
//

import UIKit

protocol TodoTableViewCellDelegate: AnyObject {
    func dropCell(with indexPath: IndexPath)
    func updateTask(with task: Todo, at indexPath: IndexPath)
    func updateHeightTaskcell(_ cell: TodoTableViewCell, _ textView: UITextView)
}

class TodoTableViewCell: UITableViewCell {
    
    weak var delegate: TodoTableViewCellDelegate?
    
    @IBOutlet weak var taskContentTextView: UITextView!
    @IBOutlet weak var checkCompleteTaskButton: UIButton!
    
    var todoTask: Todo? {
        didSet {
            setupData()
        }
    }
    
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkCompleteTaskButton.setImage(UIImage(systemName: "circle"), for: .normal)
        checkCompleteTaskButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        taskContentTextView.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if taskContentTextView.text.isEmpty {
            taskContentTextView.becomeFirstResponder()
        }
    }
    
    private func setupData() {
        if let todoTask = todoTask {
            taskContentTextView.text = todoTask.task
            checkCompleteTaskButton.isSelected = todoTask.isCompleted
            taskContentTextView.isEditable = !checkCompleteTaskButton.isSelected
        }
    }
    
    @IBAction func checkCompleteTask(_ sender: Any) {
        checkCompleteTaskButton.isSelected.toggle()
        taskContentTextView.isEditable.toggle()
        todoTask?.isCompleted = checkCompleteTaskButton.isSelected
        delegate?.updateTask(with: todoTask!, at: indexPath!)
    }
}

extension TodoTableViewCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            if !taskContentTextView.text.isEmpty {
                todoTask?.task = taskContentTextView.text
                delegate?.updateTask(with: todoTask!, at: indexPath!)
            } else {
                delegate?.dropCell(with: indexPath!)
            }
            taskContentTextView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if let delegate = delegate {
            delegate.updateHeightTaskcell(self, taskContentTextView)
        }
    }
}
