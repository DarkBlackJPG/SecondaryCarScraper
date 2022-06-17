import pandas as pd
import re

def extract_number(cena):
    only_numbers_regex = r'([0-9\.]+)'
    if type(cena) is float:
        return float('nan')
    try:
        if cena == '[]':
            return float('nan')
        else:
            cena_extracted = re.findall(only_numbers_regex, cena)[0].replace('.', '')
            return cena_extracted
    except:
        print('error')

def format_serbian(x: str):
    if type(x) == float:
        return None
    reg = '(.*)\(.*\)'
    x = x.lower()
    x = x.replace('š', 's').replace('č', 'c').replace('ć', 'c').replace('ž', 'z').replace('đ', 'dj')
    t = re.findall(reg, x)
    if len(t) == 1:
        return t[0]
    else:
        return x

def format_data():
    csv_file = pd.read_csv('../polovni_automobili_database_removed_newlines.csv')

    cena_popust = csv_file['cena_popust']
    cena_regularna = csv_file['cena_regularna']
    kilometraza = csv_file['kilometraza']
    kubikaza = csv_file['kubikaza']
    csv_file['grad'] = csv_file['grad'].apply(lambda x: format_serbian(x))
    csv_file['cena_popust'] = cena_popust.apply(lambda x: extract_number(x))
    csv_file['cena_regularna'] = cena_regularna.apply(lambda x: extract_number(x))
    csv_file['kilometraza'] = kilometraza.apply(lambda x: extract_number(x))
    csv_file['kubikaza'] = kubikaza.apply(lambda x: extract_number(x))

    # Totally retarded record ------
    csv_file = csv_file.drop(csv_file[csv_file['broj_oglasa'] == 8292270].index)
    # ------------------------------

    csv_file.to_csv('../polovni_automobili_database_formatted_data.csv', index=False)



if __name__ == '__main__':
    format_data()