# LBJ-AD Lineup Analysis

A power partnership study of LeBron James and Anthony Davis using NBA play-by-play data from 2017–2020. This project evaluates when the Lakers should play the duo together versus staggering their minutes based on possession outcomes and game state.

### **Technical Overview**

| Category | Details |
| :--- | :--- |
| **Data Source** | NBA play-by-play (2017–18 to 2019–20). |
| **Metrics** | Points Per Possession (PPP), Net Rating, Win Probability Delta. |
| **Models** | Linear Regression (Lineup Effects), KNN (Shot Success Baseline). |
| **Analysis** | Spatial Shot Density (R), On/Off Splits, and Policy Prediction. |

---

### **Key Findings**
* **Staggering Stability:** LeBron-only minutes provide the most consistent offensive floor (~1.0 PPP) across all periods.
* **Peak Performance:** The LeBron-AD duo reaches maximum efficiency in the 3rd period before seeing a slight dip in the 4th.
* **AD Impact:** Anthony Davis shows significantly higher impact when paired with LeBron than in solo configurations, which tend to dip in late-game scenarios.

---

### **Project Structure**
* `scripts/`: Python tools for lineup tagging and metric computation.
* `notebooks/`: Primary analysis, figures, and model evaluations.
* `R/`: Scripts for generating LeBron's season-by-season shot density heat maps.
* `figs/`: Visualizations of PPP by period and together vs. staggered effects.

---

### **Quickstart**

1. **Environment Setup:**
   ```bash
   conda create -n lbj-ad python=3.11 -y && conda activate lbj-ad
   pip install -r requirements.txt
