# 📝 ToDoListManager - A Blockchain To-Do List Smart Contract

This Solidity smart contract allows users to manage their personal to-do lists on the Ethereum blockchain. Each user can add, complete, delete, and retrieve their own tasks using their wallet address.

---

## 💡 Overview

The contract provides a simple and decentralized way for individuals to maintain their task lists. Each user's tasks are private and securely mapped to their Ethereum address.

---

## ⚙️ Features

- ➕ Add new tasks
- ✅ Mark tasks as completed
- ❌ Delete tasks (gas-efficient)
- 🔐 User-specific task storage (private to each wallet)
- 📤 Emit events for frontend tracking

---

## 🔩 Smart Contract Details

### Task Structure

```solidity
struct Task {
    string description;
    bool isCompleted;
}

```
contract details: 0x3b28157415367b90b512f1b41a39f98ae1829242

![WhatsApp Image 2025-05-26 at 15 00 05_168169a3](https://github.com/user-attachments/assets/cc2d59e5-3681-43bf-ac1a-380dd1dc660b)
