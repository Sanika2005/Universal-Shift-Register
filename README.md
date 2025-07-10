# 4-Bit Universal Shift Register

## 📌 Project Title
**Universal Shift Register (4-bit) Implementation on FPGA using Vivado VIO & ILA**

---

## 🧠 Description

This project implements a 4-bit **Universal Shift Register** that supports:

- **Hold** (no change)
- **Shift Right**
- **Shift Left**
- **Parallel Load**

The design is tested on an **FPGA board** using **Virtual Input/Output (VIO)** and **Integrated Logic Analyzer (ILA)** cores in **Vivado**.

---

## 🎯 Objectives

- Design a 4-bit universal shift register using Verilog
- Control the inputs (`reset`, `mode`, `data_in`, `sr`, `sl`) using **VIO**
- Observe the output (`q[3:0]`) using **ILA**
- Deploy the design on an FPGA board and test in real-time

---

## 🔧 Features

- Mode selection using 2-bit input:
  - `00` – Hold
  - `01` – Shift Right
  - `10` – Shift Left
  - `11` – Parallel Load
- Reset functionality
- Controlled and monitored via VIO/ILA on Vivado

---

## 🔁 Modes of Operation

| Mode | Binary | Description            |
|------|--------|------------------------|
| Hold | `00`   | Retains current value  |
| SR   | `01`   | Shifts right, MSB ← sr |
| SL   | `10`   | Shifts left, LSB ← sl  |
| Load | `11`   | Loads `data_in`        |

---

## 🧩 Files Included

- `universal_shift_reg.v` – Main shift register logic
- `top.v` – Top module to connect VIO and ILA
- `README.md` – Project documentation
- `constraints.xdc` – Board-specific pin constraints

---

## 🧪 How to Test

### 📁 Setup

1. Open Vivado and create a new project
2. Add both Verilog files to your design
3. Create or import VIO and ILA IPs
4. Connect:
   - **Inputs from VIO:** `reset`, `mode`, `data_in`, `sr`, `sl`
   - **Outputs to ILA:** `q[3:0]`
5. Run synthesis and implementation
6. Generate bitstream and program FPGA
7. Open Hardware Manager
8. Control inputs via VIO, observe `q` via ILA

---

## 💻 Sample VIO Configuration

| Probe | Name     | Width | Direction |
|-------|----------|--------|-----------|
| 0     | reset    | 1      | Output    |
| 1     | mode     | 2      | Output    |
| 2     | data_in  | 4      | Output    |
| 3     | sr       | 1      | Output    |
| 4     | sl       | 1      | Output    |

## 📈 Sample ILA Probe

| Probe | Name | Width |
|-------|------|--------|
| 0     | q    | 4 bits |

---

## 🔍 Expected Output Examples

1. **Parallel Load**
   - Inputs: `mode=11`, `data_in=1010`
   - Output: `q=1010`

2. **Shift Left**
   - Inputs: `mode=10`, `sl=1`, `q=1010`
   - Output: `q=0101`

3. **Shift Right**
   - Inputs: `mode=01`, `sr=0`, `q=0101`
   - Output: `q=0010`
