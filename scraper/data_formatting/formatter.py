import pandas as pd
import re

def extract_number(cena):
    only_numbers_regex = r'([0-9\.]+)'
    cena_extracted = 0
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

def format_data():
    #csv_file = pd.read_csv('../polovni_automobili_database_20220612-152247.csv')
    #csv_file.to_csv('../polovni_automobili_database_20220612-152247_removed_newlines.csv', index=False)
    csv_file = pd.read_csv('../polovni_automobili_database_20220612-152247_removed_newlines.csv')

    for idx, row in csv_file.iterrows():
        if idx == 2:
            break
        print(row)
        print('==================')


    cena_popust = csv_file['cena_popust']
    cena_regularna = csv_file['cena_regularna']
    kilometraza = csv_file['kilometraza']
    kubikaza = csv_file['kubikaza']

    csv_file['cena_popust'] = cena_popust.apply(lambda x: extract_number(x))
    csv_file['cena_regularna'] = cena_regularna.apply(lambda x: extract_number(x))
    csv_file['kilometraza'] = kilometraza.apply(lambda x: extract_number(x))
    csv_file['kubikaza'] = kubikaza.apply(lambda x: extract_number(x))

    csv_file.to_csv('../polovni_automobili_database_20220612-152247_formatted_data.csv', index=False)



if __name__ == '__main__':
    format_data()