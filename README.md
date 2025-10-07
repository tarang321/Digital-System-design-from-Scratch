# Digital System Design from Scratch 💻🔬

**A comprehensive, hands-on guide to learning digital system design, from fundamental logic gates to building a simple CPU. All from scratch!**

This repository is dedicated to anyone who wants to understand the core principles of digital logic and computer architecture. Instead of relying on high-level abstractions, we'll build our understanding from the ground up, starting with basic gates and progressively constructing more complex circuits.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub Stars](https://img.shields.io/github/stars/tarang321/Digital-System-design-from-Scratch?style=social)](https://github.com/tarang321/Digital-System-design-from-Scratch/stargazers)

---

## 🎯 Project Goal

The mission of this project is to demystify digital electronics and computer architecture. By following the modules in this repository, you will gain a practical and intuitive understanding of how modern computers work at the hardware level. This is a journey from a single transistor to a functional processor, designed for self-learners, students, and enthusiasts.



---

## ✨ What You Will Learn

This repository is structured as a step-by-step learning path. You will cover a wide range of topics, including:

* **Fundamentals of Digital Logic:**
    * Basic Logic Gates (AND, OR, NOT, XOR, etc.)
    * Boolean Algebra and Logic Simplification
* **Combinational Logic Circuits:**
    * Adders (Half-Adder, Full-Adder)
    * Multiplexers (MUX) and Demultiplexers (DEMUX)
    * Encoders and Decoders
    * Arithmetic Logic Unit (ALU)
* **Sequential Logic Circuits:**
    * Latches and Flip-Flops (SR, D, JK, T)
    * Registers and Counters
    * State Machines
* **Memory Elements:**
    * Building basic RAM and ROM from logic gates.
* **Computer Architecture:**
    * Designing a simple CPU with a custom Instruction Set Architecture (ISA).
    * Understanding the Control Unit, data path, and memory interface.

---

## 📂 Repository Structure

The repository is organized into modules, each building upon the concepts of the previous one.

* **`01-Logic-Gates/`**: Implementation of basic logic gates using transistors or simulation tools.
* **`02-Combinational-Logic/`**: Designs for circuits like adders, multiplexers, and a basic ALU.
* **`03-Sequential-Logic/`**: Designs for memory elements like flip-flops, registers, and counters.
* **`04-Memory/`**: Building small-scale RAM and ROM components.
* **`05-CPU-Design/`**: The capstone project, where all previous components are integrated to build a simple, functional CPU.
* **`simulations/`**: Contains simulation files for tools like Logisim, Verilog, or others.
* **`docs/`**: Additional learning resources, datasheets, and theoretical explanations.

---

## 🚀 How to Use This Repository

1.  **Start at the Beginning:** It is highly recommended to follow the modules in order, starting from `01-Logic-Gates`.
2.  **Read the `README.md` in Each Module:** Every module directory contains its own `README.md` file with specific goals, explanations, and exercises.
3.  **Simulate and Experiment:** Use a logic simulator (like Logisim, CEDAR Logic, or a Verilog/VHDL simulator) to build and test the circuits. This hands-on practice is crucial for understanding the concepts.
4.  **Challenge Yourself:** Try to complete the exercises and challenges at the end of each module to solidify your knowledge.

---

## 🛠️ Tools

You can use a variety of tools to follow along. Here are some popular free options:

* **Logisim-evolution:** A great graphical tool for designing and simulating digital logic circuits.
* **Verilator/Icarus Verilog:** For those who want to learn Hardware Description Languages (HDLs).
* **KiCad/EasyEDA:** For designing actual PCBs of the circuits you create.

---

## 🤝 Contributing

This is a community-driven learning project. Contributions are welcome!

* **Add Explanations:** If you can clarify a concept better, please submit a pull request to update the documentation.
* **Create New Examples:** Add more circuit designs or simulation examples.
* **Fix Errors:** If you find any mistakes in the diagrams, code, or text, please open an issue or submit a pull request.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/NewCircuit`)
3.  Commit your Changes (`git commit -m 'Add a 4-bit ripple-carry adder'`)
4.  Push to the Branch (`git push origin feature/NewCircuit`)
5.  Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

## 🙏 Acknowledgements

* Inspired by the amazing work of communities like **nand2tetris**.
* All the educators and content creators who make learning complex topics accessible to everyone.
