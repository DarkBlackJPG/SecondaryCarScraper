# PSZ Project

This project aims to implement a simple web scraper for second-hand cars, do data processing and simple analysis and,
finally, implement KNN and L2 Linear Regression (Ridge regression).

### The description for this project can be found in the pdf `PSZ_Projekat_Jun_Jul_2022_v1.0.pdf`

---
## Prerequisites
You will need to have python 3.10 installed, as well as NodeJS (npm) and AngularJS. Regarding the database requirement,
you will need to have Postgres installed with a database named `polovniautomobili`

Project specific python dependencies can be found in `requirements.txt`

---
## Usage

This project is implemented as a collection of multiple smaller "projects" and the execution should be followed in 
accordance with this README.

The initial raw data can be found within the `polovni_automobili_database_.csv`. This can be overridden by running the 
`main.py` in `./scrapy/`. 
#### NOTE:
```
Please note that scrapy does not have rotating proxies implemented! This is due to the project requirement regarding
execution time. The proxies which I had the opportunity to use were unacceptably slow! Be mindful if you run the scraper!
```
I highly suggest you run the project from PyCharm!

1. **[Optional]** Run the Scrapy project from within `./scraper` by running `main.py`
2. Run `trim_database.py` from `./scraper/data_formatting/`, this will generate the `polovni_automobili_database_removed_newlines.csv` file
3. Run `formatter.py` from `./scraper/data_formatting/`, this will generate the `polovni_automobili_database_formatted_data.csv` file
4. Load the dump file in `./scraper/db_migrating/pg_dump` to your database
5. **[Optional]** If you have data in your DB, run `db_truncate.py` from `./scraper/db_migrating/`
6. Run the `db_migrating.py` from  `./scraper/db_migrating/`
7. Run  `generate_document.py` from `./scraper/db_task_scripts/`
   1. Optionally open the `rezultati.docx` after the execution finishes
8. Run `generate_graphs.py` from `./scraper/data_visualization/`
   1. Optionally check the `./scraper/data_visualization/graphs`
   2. Optionally check the `./scraper/data_visualization/scripts`
   3. Optionally visit the `./scraper/data_visualization/web_view`
      1. Start the server `flask_main.py`
      2. Open `main.html`
9. **[Cauton! Runs too long]** Run `exploratory_testing.py` in `./scraper/ml/backend`
   1. The results of this can be found in `./scraper/ml/backend/exploratory_testing_results/`
10. Run `prepare_lin_regression_for_app.py` in `./scraper/ml/backend`
11. Start the server `server.py` in `./scraper/ml/backend`
12. Navigate to `./scraper/ml/frontend` and start the angular application with `ng serve --open`
    1. Note that you will most likely need to run the `npm install` command!
13. In the browser, select data and execute