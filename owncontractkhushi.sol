// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ToDoListManager {
    struct Task {
        string description;
        bool isCompleted;
    }

    // Mapping from user address to their array of tasks
    mapping(address => Task[]) private userTasks;

    // Event emitted when a new task is added
    event TaskAdded(address indexed user, uint256 taskId, string description);
    
    // Event emitted when a task is completed
    event TaskCompleted(address indexed user, uint256 taskId);

    // Event emitted when a task is deleted
    event TaskDeleted(address indexed user, uint256 taskId);

    // Add a new task
    function addTask(string memory _description) public {
        userTasks[msg.sender].push(Task(_description, false));
        emit TaskAdded(msg.sender, userTasks[msg.sender].length - 1, _description);
    }

    // Mark a task as completed
    function completeTask(uint256 _taskId) public {
        require(_taskId < userTasks[msg.sender].length, "Invalid task ID");
        Task storage task = userTasks[msg.sender][_taskId];
        require(!task.isCompleted, "Task already completed");
        task.isCompleted = true;
        emit TaskCompleted(msg.sender, _taskId);
    }

    // Delete a task (swap and pop for gas efficiency)
    function deleteTask(uint256 _taskId) public {
        uint256 length = userTasks[msg.sender].length;
        require(_taskId < length, "Invalid task ID");
        userTasks[msg.sender][_taskId] = userTasks[msg.sender][length - 1];
        userTasks[msg.sender].pop();
        emit TaskDeleted(msg.sender, _taskId);
    }

    // Get all tasks for the caller
    function getTasks() public view returns (Task[] memory) {
        return userTasks[msg.sender];
    }
}