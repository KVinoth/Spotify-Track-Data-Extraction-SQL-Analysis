# Spotify Track Data Extraction, Storage & SQL Analysis

## Project Overview
This project extracts track data from Spotify, stores it in a MySQL database, and performs SQL-based analysis. It also includes basic data visualization and saves extracted track details into CSV files.

---

## Workflow
1. **Extract Track Data 🎧** – Fetch track details using Spotify API and process them.
2. **Store Data 💾** – Save the extracted data into CSV files and a MySQL database.
3. **Analyze Data 📊** – Perform SQL queries for insights and visualization.

---

## Project Structure
```
Spotify-Track-Analysis
│── python
│   ├── spotify.py                # Visualizes & prints track info, saves data to CSV  
│   ├── spotify_mysql.py          # Uploads a single track to MySQL  
│   ├── spotify_mysql_urls.py     # Extracts Spotify URLs, processes IDs & stores in MySQL  
│  
│── sql  
│   ├── query.sql                 # Defines table structure & constraints  
│   ├── data_analytics_1.sql      # SQL queries for data analysis  
```

---

## Technologies Used
- **Python 🐍** – Data extraction, processing & visualization
- **MySQL 🛢️** – Database storage & querying
- **SQL 📊** – Data analysis using advanced queries

---

## SQL Topics Covered
- ✅ Table Constraints (Primary Keys, Indexing, Partitioning)
- ✅ Aggregation (SUM, AVG, COUNT, MIN, MAX)
- ✅ CASE Statements (Conditional Categorization)
- ✅ NULL Handling (COALESCE, IFNULL)
- ✅ String Functions (Substring, Replace, Trim)
- ✅ Subqueries (Filtering & Nested Queries)
- ✅ Views (Reusable Query Structures)
- ✅ Joins (INNER, LEFT, RIGHT, FULL)
- ✅ Window Functions (RANK, DENSE_RANK, ROW_NUMBER)
- ✅ UNION & UNION ALL (Combining Results)
- ✅ Regular Expressions (REGEXP) (Pattern Matching)

---

> **Note:** This project leverages Spotify's API for data extraction, MySQL for data storage, and SQL for analysis, offering a comprehensive solution for working with Spotify track data.
