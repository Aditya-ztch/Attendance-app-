# 🎯 Face‑Track

An attendance app for faculty that performs face‑based identification of students and logs attendance to an Excel file. 👩‍🏫📄

---

## 🧭 Overview
Face‑Track is a desktop application for classroom use at VIT Bhopal University that streamlines attendance with live face scanning and automatic record keeping. It uses a FaceNet embedding model for recognition, tracks sessions, and writes results to a structured Excel sheet for easy export and auditing. 🎥🧠📈

---

## ✨ Features
- 🔍 Real‑time face detection and recognition using a FaceNet‑based pipeline
- 🕹️ One‑click session start/stop with automatic Excel attendance logs
- 📦 Offline‑first: the model downloads once and is cached locally
- 🧑‍🏫 Simple UI designed for live classroom use

---

## 🛠️ Tech stack
- MATLAB App Designer (app: `AttendanceApp.mlapp`)
- MATLAB Computer Vision Toolbox & Deep Learning Toolbox (runtime)
- FaceNet model weights as `.mat` (fetched on first run)
- Windows installer built with MATLAB Compiler (`.exe`)

---

## 🗂️ Folder structure
- `AttendanceApp.mlapp` — main MATLAB App Designer application
- `faceNet_model.mat` — FaceNet embedding model (downloaded if missing)
- `faceNet_new/` — helper scripts, utilities, and model handling
- `facetrack.mp4` — demo video of the app
- `MyAppInstaller.exe` — Windows installer
- `README.md` — this documentation

---

## 🔄 How it works
1. 🎥 Start a session to capture the webcam feed  
2. 🧬 Generate FaceNet embeddings for each detected face  
3. ✅ Mark present when similarity exceeds the threshold  
4. 📁 On session end, save an Excel file with time, class metadata, and recognized IDs

---

## 🧩 Installation & run
1. Download `MyAppInstaller.exe`
2. Run the installer with default options
3. Launch Face‑Track
4. Allow the automatic model download to complete
5. Restart the app
6. Start a new attendance session

---

## 💻 System requirements
- 🪟 Windows 10/11 (64‑bit)
- 📷 Integrated or USB webcam; 4 GB RAM minimum (8 GB recommended)
- 🧰 MATLAB Runtime bundled (no full MATLAB required)
- 🌐 Internet access on first launch to fetch the model; permission to write Excel files

---

## 🙋 How to use

### 1) Create a faculty account
- click “New User”  
- Enter id and a secure password; an internal Account ID is generated  
- Account ID and password are stored locally in a separate Excel sheet for reference and offline sign‑in

### 2) Create slots
- Open “Slots” and click “New Slot”  
- Provide slot name (e.g., “CSE101‑A”)
- Save the slot; it appears in the slot list

### 3) Select a slot for attendance
- From the dashboard, choose the active slot from the dropdown  
- The selection sets the context for enrollment and attendance saving

### 4) Register students in a slot
- Open “Add Students” for the selected slot  
- For each student, enter Name and Registration Number  
- Click “Capture Face” to register the Face ID; ensure a clear, frontal view under good lighting  
- Save the record; repeat for all students in the slot

### 5) Take attendance
- With the desired slot selected, click “Take Attendance”  
- Ask students to come one by one in front of the camera  
- Each recognized student is marked Present automatically and appended to the current session log  
- Click “Stop” to finish; the Excel file for the session is generated in the output folder

Tips:
- Maintain consistent lighting; avoid strong backlight or occlusions  
- If a face isn’t recognized, recapture the student’s Face ID from the Register screen and retry

---

## 📊 Excel output
- New workbook per session (or appended sheet, depending on settings)  
- Typical columns: `Timestamp`, `Student ID/Name`, `Status (Present)`, `latitude`, `longitude`  

---

## 🙌 Credits
- Author: Group 157  
- Recognition pipeline: FaceNet‑based embeddings  
- Thanks to faculty and peers at VIT Bhopal University for feedback and testing
