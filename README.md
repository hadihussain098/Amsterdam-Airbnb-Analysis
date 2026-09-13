# Amsterdam-Airbnb-Analysis
SQL analysis of Amsterdam Airbnb listings to find best value for tourists

# 🏠 Amsterdam Airbnb Analysis

## Project Overview
Planning a trip to Amsterdam and not sure where to stay? 
This project analyses 6,377 Airbnb listings across 22 
Amsterdam neighbourhoods to help tourists find the best 
value accommodation — and avoid getting ripped off!

---

## Business Question
> "Which Amsterdam Airbnb listings offer the best value 
> for money — and which ones are complete rip offs?"

---

## Questions Answered
1. Which neighbourhoods have the lowest average price?
2. Which neighbourhoods have the highest average rating?
3. What room type offers the best price and rating combo?
4. Which listings are rip offs?
5. Do superhosts offer better value than regular hosts?
6. Which neighbourhoods have the best value score?
7. How do listings rank within each neighbourhood by value?
8. Which price band does each listing fall into?
9. Which hosts consistently overcharge?
10. What is the custom tourist recommendation score?

---

## Tools Used
- SQL Server Management Studio (SSMS)
- GitHub

---

## Data Source
- **Source:** Inside Airbnb (insideairbnb.com)
- **City:** Amsterdam, Netherlands
- **Listings:** 10,369 raw → 6,377 after cleaning
- **Neighbourhoods:** 22 across Amsterdam

---

## Architecture
This project follows the Medallion Architecture:

| Layer | Description |
|-------|-------------|
| 🥉 Bronze | Raw data loaded as-is from CSV |
| 🥈 Silver | Cleaned data split into 2 tables |
| 🥇 Gold | 10 analysis queries answering business questions |

---

## Key Findings

### 💰 Price
- **Osdorp** is the cheapest neighbourhood at **$175/night**
- Budget listings start from **~$39/night**
- Premium listings can exceed **$500+/night**

### ⭐ Ratings
- **Noord-West, Bos en Lommer and Zuid** have the highest 
  average ratings at **4.87/5**
- **Osdorp** is both cheapest AND highly rated (4.86) 
  — making it the best overall value for tourists!

### 🛏️ Room Types
- **Shared rooms** offer the best price-to-rating ratio
- Followed by private rooms, hotel rooms and entire homes

### 🦸 Superhosts
- Superhosts charge **LESS** ($270 avg vs $344 for regular hosts)
- Yet deliver **HIGHER** ratings (4.86 vs 4.83)
- **Conclusion: Always book a superhost for better value!**

### 🏆 Best Value Neighbourhoods
1. IJburg - Zeeburgereiland → 4.699 value score
2. Noord-West → 4.693 value score
3. Zuid → 4.687 value score

### 🚨 Rip Off Detection
- Listings with price/value ratio above threshold flagged
- Only listings with value score below 3.0 considered rip offs
- Centrum-Oost has highest concentration of overpriced listings

### 🎯 Tourist Score
Custom formula created combining:
- Rating (20%) + Value (30%) + Location (30%) - Price penalty (20%)
- Top 10 best listings shown per neighbourhood

---

## Folder Structure

amsterdam-airbnb-analysis/
│
├── bronze/
│ └── bronze_airbnb.sql
│
├── silver/
│ ├── silver_exploration.sql
│ ├── silver_listing.sql
│ └── silver_host.sql
│
├── gold/
│ ├── 01_cheapest_neighbourhoods.sql
│ ├── 02_highest_rated_neighbourhoods.sql
│ ├── 03_best_room_type.sql
│ ├── 04_rip_off_listings.sql
│ ├── 05_superhost_analysis.sql
│ ├── 06_best_value_neighbourhoods.sql
│ ├── 07_rank_by_value_score.sql
│ ├── 08_price_bands.sql
│ ├── 09_overcharging_hosts.sql
│ └── 10_tourist_score.sql
│└── README.md


---

## Author
**Hadi Hussain**
Data Analyst | SQL | Python
📍 Birmingham, UK
🔗 [GitHub](https://github.com/hadihussain098)
