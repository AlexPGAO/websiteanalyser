# Website Analyzer

A simple Bash script for performing reconnaissance on websites using Nmap and WHOIS lookups. Perfect for security analysis, penetration testing practice, and understanding network infrastructure.

## 🔍 Overview

This tool combines network scanning and domain information gathering to provide a quick security overview of any website. It's designed for cybersecurity students, SOC analysts, and penetration testers who need a streamlined reconnaissance workflow.

## ✨ Features

- **Nmap Network Scanning**
  - SYN stealth scan (`-sS`)
  - Service version detection (`-sV`)
  - Verbose output for detailed information
  
- **WHOIS Domain Lookup**
  - Domain registrar information
  - Registrant details
  - Creation date and registration history
  - Optional log file saving

- **User-Friendly Interface**
  - Interactive prompts
  - Progress indicators
  - Optional output saving

## 🚀 Installation

### Prerequisites

Ensure you have the following installed on your system:

```bash
# Check if nmap is installed
nmap --version

# Check if whois is installed
whois --version
```

### Install Required Tools

**Kali Linux / Debian / Ubuntu:**
```bash
sudo apt update
sudo apt install nmap whois -y
```

**Arch Linux:**
```bash
sudo pacman -S nmap whois
```

**macOS:**
```bash
brew install nmap whois
```

### Download the Script

**Option 1: Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/website-analyzer.git
cd website-analyzer
chmod +x websiteanalyser.sh
```

**Option 2: Direct download**
```bash
wget https://raw.githubusercontent.com/YOUR_USERNAME/website-analyzer/main/websiteanalyser.sh
chmod +x websiteanalyser.sh
```

**Option 3: Manual creation**
```bash
# Create the file
nano websiteanalyser.sh

# Paste the script content
# Save and exit (Ctrl+X, Y, Enter)

# Make executable
chmod +x websiteanalyser.sh
```

## 📖 Usage

### Basic Usage

Run the script with sudo (required for SYN scan):

```bash
sudo ./websiteanalyser.sh
```

### Interactive Workflow

1. **Enter target website**
   ```
   Enter the website address you would like to analyse
   example.com
   ```

2. **Nmap scan runs automatically**
   - Performs SYN stealth scan
   - Detects service versions
   - Displays open ports and services

3. **WHOIS lookup**
   - Choose to save results to file or view in terminal
   - If saving: provide output file path
   - If not saving: displays key information (registrar, registrant, creation date)

### Example Session

```bash
$ sudo ./websiteanalyser.sh

--------------------------------------------------
Enter the website address you would like to analyse
example.com
--------------------------------------------------
Currently running simple silent nmap scan of example.com

Starting Nmap scan...
[Nmap output shows open ports and services]

NMAP OUTPUT COMPLETE, MOVING ON
--------------------------------------------------
Now checking domain ownership
Want to save this to a log file? (yes/no)
yes
Please enter the file location to save
./example_whois.txt
Saved to ./example_whois.txt
--------------------------------------------------
Analysis complete!
```

## 🛠️ What It Does

### Nmap Scan (`-sS -sV`)

| Flag | Purpose |
|------|---------|
| `-sS` | SYN stealth scan - Less detectable than full TCP connect |
| `-sV` | Version detection - Identifies service versions on open ports |

**Example Output:**
```
PORT     STATE SERVICE VERSION
80/tcp   open  http    nginx 1.18.0
443/tcp  open  ssl     nginx 1.18.0
22/tcp   open  ssh     OpenSSH 8.2p1
```

### WHOIS Lookup

Retrieves domain registration information:
- **Registrar** - Company managing the domain
- **Registrant** - Domain owner (may be privacy-protected)
- **Creation Date** - When domain was first registered
- **Expiration Date** - When domain registration expires
- **Name Servers** - DNS servers hosting the domain

## 📝 Output Options

### Terminal Output (No Save)
```
Registrar: GoDaddy.com, LLC
Registrant Organization: Privacy Protected
Creation Date: 1995-08-14T04:00:00Z
```

### File Output (With Save)
```bash
# Full WHOIS record saved to specified file
cat example_whois.txt
```

## ⚙️ Configuration

### Modify Scan Parameters

Edit the script to customize the Nmap scan:

```bash
# Original
sudo nmap -sS -sV $website

# Add OS detection
sudo nmap -sS -sV -O $website

# Add timing (faster scan)
sudo nmap -sS -sV -T4 $website

# Scan specific ports
sudo nmap -sS -sV -p 80,443,22 $website

# Aggressive scan (all features)
sudo nmap -A $website
```

### Add More WHOIS Filters

```bash
# Add expiration date
whois $website | grep -i "expiry date"

# Add name servers
whois $website | grep -i "name server"

# Add registrar email
whois $website | grep -i "registrar.*email"
```

## 🔒 Legal & Ethical Use

### ⚠️ IMPORTANT DISCLAIMER

**Only scan systems you own or have explicit permission to test.**

- Unauthorized network scanning may be illegal in your jurisdiction
- Always obtain written permission before scanning third-party systems
- Some organizations consider unauthorized scanning as an attack
- Use responsibly and ethically

### Recommended Use Cases

✅ **Appropriate:**
- Your own websites and servers
- Systems in your penetration testing lab
- Bug bounty programs with explicit scope
- Educational environments with permission
- Security assessments with signed authorization

❌ **Inappropriate:**
- Random websites without permission
- Competitor analysis without authorization
- Testing company networks without approval
- Any system you don't own or lack permission for

## 🎓 Learning Resources

This tool is designed for cybersecurity education. Expand your knowledge:

- **Nmap Mastery:** [Nmap Official Guide](https://nmap.org/book/)
- **WHOIS Understanding:** [ICANN WHOIS Info](https://whois.icann.org/)
- **Penetration Testing:** TryHackMe, HackTheBox
- **Network Security:** Cybrary, SANS courses

## 🐛 Troubleshooting

### "Permission denied" when running script

```bash
# Make script executable
chmod +x websiteanalyser.sh

# Run with sudo (required for -sS flag)
sudo ./websiteanalyser.sh
```

### "nmap: command not found"

```bash
# Install nmap
sudo apt install nmap

# Verify installation
nmap --version
```

### "whois: command not found"

```bash
# Install whois
sudo apt install whois

# Verify installation
whois --version
```

### Nmap scan shows no results

- **Firewall blocking:** Target may have firewall rules
- **No open ports:** System may have no services running
- **Network issue:** Check internet connection
- **Invalid target:** Verify website address is correct

### WHOIS returns "No match" or limited data

- **Privacy protection:** Domain owner uses WHOIS privacy
- **New TLD restrictions:** Some domains (.dev, .app) have limited WHOIS
- **Regional restrictions:** GDPR may limit WHOIS data in EU

## 🤝 Contributing

Contributions are welcome! Here's how:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a Pull Request

### Contribution Ideas

- Add error handling and input validation
- Implement colored output for better readability
- Add support for IPv6 addresses
- Create automated reporting features
- Add logging functionality
- Improve scan speed and efficiency

## 📄 License

MIT License - See LICENSE file for details

## 👤 Author

**AlexPGAO**
- GitHub: [@AlexPGAO](https://github.com/AlexPGAO)
- Cybersecurity enthusiast and SOC analyst in training

## 🙏 Acknowledgments

- Built for cybersecurity education and ethical hacking practice
- Inspired by the need for streamlined reconnaissance workflows
- Thanks to the Nmap and WHOIS communities

## 📊 Technical Stack

![Bash](https://img.shields.io/badge/-Bash-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/-Linux-FCC624?style=flat-square&logo=linux&logoColor=black)
![Kali Linux](https://img.shields.io/badge/-Kali_Linux-557C94?style=flat-square&logo=kali-linux&logoColor=white)
![Nmap](https://img.shields.io/badge/-Nmap-4682B4?style=flat-square&logo=nmap&logoColor=white)

---

**⭐ Found this useful? Give it a star!**

**🐛 Found a bug? Open an issue!**

**💡 Have an idea? Submit a PR!**

**⚠️ Remember: Always scan responsibly and ethically!**
