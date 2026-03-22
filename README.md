# 🛡️ Revivify: Redefined Login Security

An advanced security architecture application engineered in **Java** to mathematically mitigate common credential interception tactics—specifically **Shoulder Surfing** and **Keylogging**. Revivify replaces standard static password entry with dynamic alphanumeric PINs mapped across randomized visual token boxes, rendering mechanical observation by attackers completely useless.

## 🚀 The Security Problem Solved
Traditional passwords mapped directly to physical keystrokes are inherently vulnerable. If an attacker observes a user's keyboard or installs a physical keylogger, the absolute credential string is instantly compromised. 

**Revivify** solves this by breaking the 1:1 mapping between *what the user types* and *what the true credential is*. 

## 🧠 Algorithmic Core
- **Dynamic Alphanumeric Grids:** At every login attempt, the system generates a fresh, fully randomized matrix of visual token boxes containing alphanumeric characters.
- **Cognitive Mapping:** The legitimate user maps their actual static PIN to the dynamically generated tokens shown strictly on that single, ephemeral session screen.
- **Useless Interception:** Because the token boxes randomize locations on every single login, an attacker capturing the raw input keystrokes or videotaping the screen cannot reconstruct the baseline credential without knowing the underlying mapping algorithm in real-time.

## 🛠️ Technology Stack
- **Core Engine:** Java (JDK 8+)
- **Architecture:** Applied Security Engineering & Cryptographic Design
- **Algorithms:** Randomization matrix algorithms and dynamic state-mapping logic
- **UI Architecture:** Java Swing / AWT (for visual grid rendering)

## 💻 Local Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/akg1998/Revivify.git
   cd Revivify
   ```

2. **Compile the Java source files:**
   ```bash
   javac src/main/java/com/security/*.java
   ```

3. **Execute the Application:**
   ```bash
   java -cp src/main/java com.security.RevivifyApp
   ```
   *(Note: Adjust the package and class names above dynamically to match the core runner within the src directory).*

---
*Developed by [Akshay Ghavale](https://github.com/akg1998) as an exploration into advanced authentication mechanisms and threat neutralization models.*
