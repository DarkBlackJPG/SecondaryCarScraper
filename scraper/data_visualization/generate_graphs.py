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
    return cur.fetchall(), headings

plt.style.use('dark_background')

top_10_script_location = read_script_from_file('./scripts/top_10.sql')
top_10_results, top_10_headings = read_script_and_execute('./scripts/top_10.sql')

x = [city[0] for city in top_10_results]
y = [city[1] for city in top_10_results]

# plot
fig1 = plt.figure(figsize=(6.4, 6.4))
fig2 = plt.figure(figsize=(6.4, 6.4))
ax1 = fig1.add_subplot(1, 1, 1)
ax1.bar(x, y, width=1, edgecolor="white", linewidth=0.7)



fig1.figsize = (19, 10)

ax2 = fig2.add_subplot(1, 1, 1)
ax2.bar(x, y, width=1, edgecolor="white", linewidth=0.7)

fig2.figsize = (19, 10)
plt.xticks(rotation=30, ha='right')
plt.show()

cur.close()
conn.close()