import pandas as pd

def findHeavyAnimals(animals: pd.DataFrame) -> pd.DataFrame:
    selected_rows = animals[animals['weight'] > 100]
    sortedByWeight = selected_rows.sort_values(by='weight', ascending=False)
    name = sortedByWeight[['name']]
    return name