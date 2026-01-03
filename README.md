# LAN File Share (Docker + Nginx)

A lightweight project to share local system files across your LAN using Dockerized Nginx.

Here’s a polished **README.md** you can drop straight into your GitHub repo. It walks any viewer through the project step‑by‑step so they can clone, build, and run it easily.

---

```markdown
# 📂 Docker File Server with Custom UI

A simple file server built with **Nginx in Docker**.  
It serves any folder on your host machine over LAN with a **custom HTML/CSS UI** that shows icons, wraps long filenames, and supports subfolders via `files.json`.

---

## 🚀 Features
- ✅ Serve files and folders over LAN using Docker
- ✅ Custom UI with icons for files/folders
- ✅ Long filenames fully visible (wrapped)
- ✅ Subfolder support (`files.json` per folder)
- ✅ Lightweight and easy to run

---

## 📦 Project Structure
```
docker-file-server/
├── Dockerfile
├── nginx.conf
├── index.html
├── assets/
│   └── style.css
├── scripts/
│   ├── generate_files_json.ps1
│   └── generate_files_json_recursive.ps1
└── README.md
```

---

## 🛠 Prerequisites
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Share the drive containing your files (e.g., `C:\` or `G:\`) in Docker Desktop → Settings → Resources → File Sharing
- Windows PowerShell (for running the JSON generator scripts)

---

## ⚙️ Setup & Usage

### 1. Clone the repo
```bash
git clone https://github.com/ipraveenkohli/lan-file-share.git
cd docker-file-server
```

### 2. Build the Docker image
```bash
docker build -t file-server .
```

### 3. Run the container
Replace `G:\<location>` with the folder you want to serve:
```bash
docker run -d -p 8080:80 -v G:\<location>:/usr/share/nginx/html:ro file-server
```

### 4. Generate `files.json`
Run the recursive script to create `files.json` in every folder:
```powershell
cd G:\Shivali
.\scripts\generate_files_json_recursive.ps1
```

### 5. Access in browser
Find your LAN IP with:
```powershell
ipconfig
```
Then open:
```
http://<your-ip>:8080
```

---

## 🔄 Updating Files
- Whenever you add/remove files, re-run:
```powershell
.\scripts\generate_files_json_recursive.ps1
```
- Optionally, schedule this script in **Windows Task Scheduler** to run automatically.

---

## 🖼 Screenshots


---

## 📚 Notes
- `index.html` fetches `files.json` relative to the current folder, so each subfolder must have its own `files.json`.
- `assets/style.css` controls icons and filename wrapping — customize it to your liking.


---

## 🤝 Contributing
Pull requests are welcome!  





