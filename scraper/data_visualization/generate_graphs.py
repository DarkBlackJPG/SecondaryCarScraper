import matplotlib.pyplot as plt
import numpy as np
import psycopg2


conn = psycopg2.connect("dbname=polovniautomobili user=postgres password=123")
cur = conn.cursor()

# Return only one line
def read_script_from_file(script_location):
    with open(script_location, 'r', encoding='utf8') as script:
        temp = script.readlines()
        return "".join(map(str, temp))

def read_script_and_execute(script_location):
    sql_string = read_script_from_file(script_location)
    cur.execute(sql_string)
    headings = [desc[0] for desc in cur.description]
    return cur.fetchall(), headings,

def draw_single_bar(x, y, name):
    plt.style.use('dark_background')
    # plot
    fig = plt.figure(figsize=(10, 10))
    ax1 = fig.add_subplot(1, 1, 1)
    ax1.bar(x, y, width=1, edgecolor="white", linewidth=0.7)

    plt.xticks(rotation=30, ha='right')
    plt.savefig(f'./graphs/{name}.png')

def draw_single_pie(x, y, name):
    plt.style.use('default')
    # plot
    fig = plt.figure(figsize=(10, 10))
    ax1 = fig.add_subplot(1, 1, 1)
    ax1.pie(y, labels=x, autopct='%1.1f%%',
            shadow=True, startangle=90)
    ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

    plt.savefig(f'./graphs/{name}.png')


top_10_script_location                      = './scripts/top_10.sql'
grouped_by_km_script_location               = './scripts/grouped_by_km.sql'
grouped_by_year_script_location             = './scripts/grouped_by_year.sql'
automatic_manual_percent_script_location    = './scripts/automatic_manual_percent.sql'
price_categorization_script_location        = './scripts/price_categorization.sql'

top_10_graph_location                      = './graphs/top_10.png'
grouped_by_km_graph_location               = './graphs/grouped_by_km.png'
grouped_by_year_graph_location             = './graphs/grouped_by_year.png'
automatic_manual_percent_graph_location    = './graphs/automatic_manual_percent.png'
price_categorization_graph_location        = './graphs/price_categorization.png'

top_10_results, _ = read_script_and_execute                     (top_10_script_location                  )
grouped_by_km_results, _ = read_script_and_execute              (grouped_by_km_script_location           )
grouped_by_year_results, _ = read_script_and_execute            (grouped_by_year_script_location         )
automatic_manual_percent_results, _ = read_script_and_execute   (automatic_manual_percent_script_location)
price_categorization_results, _ = read_script_and_execute       (price_categorization_script_location    )

draw_single_bar([element[0] for element in top_10_results]
                , [element[1] for element in top_10_results]
                , 'top_10_lokacija')

draw_single_bar([element[0] for element in grouped_by_km_results]
                , [element[1] for element in grouped_by_km_results]
                , 'po_kilometrima')


draw_single_bar([element[0] for element in grouped_by_year_results]
                , [element[1] for element in grouped_by_year_results]
                , 'po_godinama')

draw_single_pie([element[0] for element in automatic_manual_percent_results]
                , [element[1] for element in automatic_manual_percent_results]
                , 'menjaci_procenat')

draw_single_bar([element[0] for element in automatic_manual_percent_results]
                , [element[2] for element in automatic_manual_percent_results]
                , 'menjaci_ukupno')

draw_single_pie([element[0] for element in price_categorization_results]
                , [element[2] for element in price_categorization_results]
                , 'cenovni_opseg_procenat')

draw_single_bar([element[0] for element in price_categorization_results]
                , [element[1] for element in price_categorization_results]
                , 'cenovni_opseg_ukupno')

cur.close()
conn.close()