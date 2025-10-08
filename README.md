lbj-ad-lineup-analysis

Power partnership study of LeBron James and Anthony Davis. The goal is to answer a practical policy question: when should the Lakers play LeBron and AD together vs staggered? We use NBA play-by-play from 2017–18 to 2019–20 and summarize lineup outcomes, on/off splits, and simple predictive models.

Project question (Part A)

How does a team best use a “power partnership”? In our case: LeBron James and Anthony Davis on the Lakers.

What “success” means here
	•	Possession outcomes: points per possession (PPP), net rating.
	•	Win probability change by shift.
	•	Shot context: location and distance patterns that co-occur with duet vs solo minutes.
	•	On/off splits: LeBron-only, AD-only, both on, both off.

Data
	•	NBA play-by-play: 2017–18, 2018–19, 2019–20 (provided by course).
	•	We focus on 2019–20 for the main duet season, with 2017–19 as context.

Results at a glance
	•	LeBron-only minutes have the most consistent scoring rate across periods (about ~1.0 points per play).
	•	The LeBron-AD duo peaks in period 3, then dips in period 4.
	•	AD-only configurations show a late-game drop in period 5 in the sampled games.
	•	Overall, all three configurations hover near ~1 point per play. One takeaway: LeBron drives stable offense alone, while AD’s peak impact shows more when paired with LeBron.  ￼

Methods overview
	•	Lineup tagging: derive on-court stints and label each possession as both, lebron_only, ad_only, or neither.
	•	Outcome modeling:
	•	Regression of PPP or win-prob change on stint label, opponent strength, period, score margin, rest, and home/away.
	•	Simple KNN baseline for shot success to sanity-check whether duet vs solo shifts change the local shot profile.
	•	Spatial analysis: half-court shot density maps for LeBron by season to see role changes as AD arrives.
	•	Policy read: compare predicted outcomes for “play together” vs “stagger” under different game states.

Repo structure

.
├─ data/
│  ├─ raw/                 # original play-by-play files (not tracked)
│  └─ processed/           # tidy stints, shots, possessions
├─ notebooks/
│  ├─ HW1.ipynb            # main analysis and figures
│  └─ exploration.ipynb    # scratch EDA
├─ scripts/
│  ├─ build_stints.py      # parse pbp → stints with on-court labels
│  ├─ compute_metrics.py   # PPP, net rating, win-prob deltas
│  └─ models.py            # regression + KNN baselines
├─ R/
│  └─ HW1_Heat_Map.R       # shot density maps for LeBron by season
├─ figs/                   # exported charts
├─ requirements.txt        # Python deps
├─ renv.lock / DESCRIPTION # if you choose to track R deps
└─ README.md

Quickstart

1) Python setup

conda create -n lbj-ad python=3.11 -y
conda activate lbj-ad
pip install -r requirements.txt

Suggested requirements.txt:

pandas
numpy
matplotlib
scikit-learn
pyyaml

2) R setup

Open R/HW1_Heat_Map.R and install any missing packages when prompted. Typical:

install.packages(c("tidyverse","ggplot2"))

3) Put data in place

Drop the provided play-by-play CSVs into data/raw/. Keep them out of version control.

4) Build processed tables

python scripts/build_stints.py \
  --in data/raw \
  --out data/processed/stints.parquet

python scripts/compute_metrics.py \
  --stints data/processed/stints.parquet \
  --out data/processed/possessions.parquet

5) Run the notebook

Open notebooks/HW1.ipynb, run all cells, and export figures to figs/.

6) Make the heat maps

Run R/HW1_Heat_Map.R to generate season-by-season shot density maps for LeBron.

How to read the outputs
	•	figs/summary_ppp_by_period.png shows PPP by period for both, lebron_only, and ad_only.
	•	figs/lebron_shot_density_2017_2018.png (and other years) show shot density changes as AD joins.
	•	figs/duo_vs_stagger_effects.png compares predicted outcomes for together vs staggered minutes by game state.

Reproducing the core comparison
	1.	Filter stints to the 2019–20 season.
	2.	Tag possessions into the four lineup states.
	3.	Regress PPP on lineup state + controls (period, margin, opponent).
	4.	Plot marginal effects for both vs lebron_only and ad_only.
	5.	Cross-check with win-probability deltas computed from scoring events.

Limitations
	•	Single-season duet samples can be noisy.
	•	Play-by-play lacks full tracking detail, so matchup quality and off-ball gravity are proxied.
	•	KNN shot models are sanity checks, not production-grade predictors.

Extending the project
	•	Add other duos (e.g., Curry-Thompson) to compare policy differences.
	•	Bring in player tracking or matchup data to tighten causal claims.
	•	Use causal ML for conditional treatment effects by game state.

License

MIT. Update if your course requires something else.

Acknowledgments

Course staff for providing the data. Teammates and reviewers for feedback.
