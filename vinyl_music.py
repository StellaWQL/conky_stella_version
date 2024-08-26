import pandas as pd
import subprocess

def check_unwanted_strings(x):
    unwanted_strings = ["No album found", "No artist found", "No price available"]
    return any([str == x for str in unwanted_strings])

def get_random_number():
    command = "dd if=/dev/urandom bs=4 count=1 2>/dev/null | od -An -tu4"
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    random_number = int(result.stdout.strip())
    return random_number

df = pd.read_csv('vinyl_records.csv')
mask = df.applymap(check_unwanted_strings)
df_cleaned = df[~mask.any(axis=1)]

random_indexes = [get_random_number() % len(df_cleaned) for _ in range(3)]
selected_records = df.iloc[random_indexes]
for index, row in selected_records.iterrows():
    print(f"{row['Album']}|{row['Artist']}")
