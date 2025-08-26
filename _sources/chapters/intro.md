---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# EAS 503: Python for Data Scientists

Welcome to **EAS 503**! This course is offered by the Department of Engineering & Applied Sciences at the University at Buffalo.

---

## Course Information

- **Course Name:** Python for Data Scientists
- **Course Number:** EAS 503
- **Level:** Graduate
- **Credits:** 3
- **Prerequisite:** None

### Description

This course provides a comprehensive introduction to the essential tools and techniques used in data science, making it suitable for both beginners starting their data-centric journey and experienced programmers seeking to expand their expertise. Topics include Python programming, SQL database management, data visualization, and foundational concepts in machine learning, equipping students with the skills necessary to analyze, manage, and interpret data effectively.

### Registration

Students outside the MS and MPS Data Science programs should submit a force registration request: [Force Registration Request](https://academics.eng.buffalo.edu/).

---

## Course Content and Grading

- **Quizzes (7):** 25%
- **Programming Assignments (7):** 45%
- **Individual Mini-Projects (2):** 20%
- **Individual Final Project (1):** 10%

---

## Quizzes

1. **Format:** A total of 7 open-note quizzes will be completed via UB Learns.
2. **Availability:** Quizzes are posted on Saturdays.
3. **Completion Window:** You have three days to complete each quiz after it is posted.
4. **Time Limit:** Each quiz must be completed within three hours of starting.
5. **Academic Integrity:** Collaboration is prohibited. Use only authorized resources (course website). Violations will result in a score of 0 and will be reported to the Office of Academic Integrity.
6. **Respondus LockDown Browser:** Quizzes must be taken using this browser. Complete the practice quiz to familiarize yourself.
7. **Camera Requirement:** A functional camera is required. Ensure you remain in the frame throughout the quiz.
8. **UB ID Verification:** Display your UB ID before starting the quiz.
9. **Location Flexibility:** You may take the quiz from any location, but collaboration is strictly prohibited.

These policies ensure fairness and academic integrity. If you have questions, contact the instructor.

---

## Programming Assignments

1. **Codio License:** A \$48 Codio license is required for completing assignments.
2. **Platform:** Assignments are assigned and graded exclusively on Codio.
3. **Submission:** Submit assignments via Codio. Submissions on UB Learns will not be graded.
4. **Retries:** Unlimited retries are allowed until the deadline.
5. **Grade Contestation:** You have seven days after grading to contest your grade.

Programming assignments are designed to enhance your practical skills and reinforce theoretical concepts. Contact the instructor for assistance if needed.

---

## Mini-Projects

1. **Nature:** Mini-projects are extended, more complex versions of programming assignments.
2. **Platform:** Mini-projects are assigned and graded on Codio.
3. **Grade Contestation:** You have seven days after grading to contest your grade.

Mini-projects provide deeper engagement with the material and real-world applications. Contact the instructor for guidance if needed.

---

## Final Project Overview

The final project is an individual, intensive endeavor showcasing your skills in data analysis, machine learning, and deployment.

### Requirements

1. **Data Selection:** Choose a dataset with over 1,000 rows in CSV format for a classification problem.
2. **Data Parsing:** Use basic Python (no Pandas) for data parsing.
3. **Normalization and Database Loading:** Normalize data and load it into a database (TA approval required).
4. **Data Querying:** Use SQL join statements to query data and load it into Pandas.
5. **Machine Learning:** Perform classification tasks using Python ML libraries.
6. **Experiment Tracking:** Use MLFlow and DagsHub for experiment tracking.
7. **Deployment:** Deploy a Docker container for your classification pipeline.
8. **User Interface:** Create a Streamlit app for pipeline interaction.
9. **Presentation:**
   - Host your project on a JupyterBook website.
   - Record a 12-minute presentation following the rubric.
10. **Submission Deadline:**
    - **Wednesday, Dec. 18, 2024, 11:59 PM**
    - Submit the following on UB Learns:
      - MLFlow/DagsHub experiments
      - Docker Hub link
      - Streamlit app
      - JupyterBook website
      - Recorded presentation (UB Box link)
      - Completed rubric checklist

[Download Requirements in Word Format](chapters/ML_Project_Plan.docx)

---

## Late Submission Policy

1. **Late Days Allocation:** You have 10 late days for programming assignments and mini-projects.
2. **Maximum Delay:** No assignment can be submitted more than **3 days** after the due date.

Use late days wisely to manage unexpected challenges. Contact the instructor for clarification if needed.

---

## Course Resources

1. **Course Book:** [Course Book](https://mkzia.github.io/eas503-book)
2. **Lecture Materials:** [Lecture Notebooks on GitHub](https://github.com/mkzia/eas503)
3. **UB Learns:**
   - Submit the final project report.
   - Access course grades.
4. **Codio:** Submit programming assignments.
5. **Piazza:**
   - Announcements and updates
   - Instructor and TA queries
   - Classmate interaction
   - Lecture and solution recordings (pinned post)
   - Office hours and deadlines (pinned post)

These resources are essential for your success. Engage actively with them and seek help when needed.

---

## Preparing for the First Class

1. **UB Learns:** Confirm access to the EAS503 course page.
2. **Course Book:** Familiarize yourself with the [Course Book](https://mkzia.github.io/eas503-book).
3. **Codio License:** Obtain and log into Codio.
4. **Piazza Login:** Ensure access to Piazza for discussions and updates.
5. **Software Installation:**
   - Install [Anaconda](https://www.anaconda.com/products/individual).
   - Install [Visual Studio Code](https://code.visualstudio.com/).
   - For Windows users, install Python 3.12 from the App Store.

---

## Academic Integrity

Academic integrity is a cornerstone of the university's mission. Violations include:

1. **Collaboration:** Sharing identical homework solutions results in zero points for all involved.
2. **Online Platforms:** Posting or viewing solutions on platforms like Chegg or Course Hero results in severe penalties, including course failure.
3. **Codio Monitoring:** Codio tracks keystrokes, external pastes, and time spent in error states. Complete all work within Codio to avoid violations.

**Examples of Violations:**

- Posting assignment questions online.
- Copying code from another student.
- Sharing access to your computer or accounts.

**Submission of work indicates acceptance of the academic integrity policy.**

For more details, refer to the [UB Graduate Academic Integrity Policy](https://www.buffalo.edu/grad/succeed/current-students/policy-library.html#academic-integrity).

---

## Syllabus Review

```{code-cell} ipython3
:tags: ["remove-input"]
from jupyterquiz import display_quiz
display_quiz('syllabus_quiz.json', shuffle_answers=True, colors='fdsp')
```
