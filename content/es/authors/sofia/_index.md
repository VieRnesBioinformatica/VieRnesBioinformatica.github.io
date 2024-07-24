---
title: "Sofia Salazar"
---

Undergrad genomic sciences student, interested in bioinformatics, AI, genomics, RNA-seq analysis.


```python
class Sofia(Bioinformatician):
    def __init__(self):
        self.pronouns = ["Ella", "She", "Her"]
        self.programming_languages = [
            "Python",
            "R",
            "C++",
            "C#",
            "SQL",
            "PHP",
            "HTML",
            "Perl"
        ]
        self.languages = [
            "Spanish",
            "English"
        ]
        self.interest = [
            "AI",
            "RNA-seq",
            "Statistics"
        ]
        self.education = {
            2024: {
                "Universidad Nacional Autónoma de México (UNAM)": "BSc. Genomic Sciences"
            }
        }
        self.contact = {
            "E-mail": "sogusama02@gmail.com",
            "X": "ssalazar_02"
        }

    def __repr__(self):
        return "Welcome to my GitHub profile! Check out my page for more information :D"

me = Sofia()
print(me)
```

