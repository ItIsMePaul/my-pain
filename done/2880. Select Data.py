import pandas as pd

def selectData(students: pd.DataFrame) -> pd.DataFrame:
    ans = students[students['student_id'] == 101]
    ans = ans[['name', 'age']]
    return ans