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

Welcome to **EAS 503**! This course is offered by the Department of Engineering and Applied Sciences at the University at Buffalo.

---

## Course Information

- **Course name:** Python for Data Scientists
- **Course number:** EAS 503
- **Level:** Graduate
- **Credits:** 3
- **Prerequisites:** None

### Description

This course provides a comprehensive introduction to essential tools and techniques in data science. It is suitable for beginners starting their data-centric journey and for experienced programmers seeking to expand their expertise. Topics include Python programming, SQL database management, data visualization, and foundational machine learning concepts, equipping students with the skills to analyze, manage, and interpret data effectively.

### Registration

Students outside the MS and MPS in Data Science programs should submit a force registration request: [Force Registration Request](https://academics.eng.buffalo.edu/).

---

## Course Content and Grading

- **Quizzes (12–14):** 10%
- **Programming assignments (7):** 45%
- **Individual mini-projects (2):** 30%
- **Individual final project (1):** 15%

---

## Quizzes

1. **Format:** Weekly open-note quizzes completed via UB Learns.
2. **Availability:** Quizzes are posted on Saturdays.
3. **Completion window:** You have three days to complete each quiz after it is posted.
4. **Time limit:** Each quiz must be completed within three hours of starting.
5. **Academic integrity:** Collaboration is prohibited. Use only authorized resources (course website). Violations will result in a score of 0 and will be reported to the Office of Academic Integrity.
6. **Respondus LockDown Browser:** Quizzes must be taken using this browser. Complete the practice quiz to familiarize yourself.
7. **Camera requirement:** A functional camera is required. Remain in frame throughout the quiz.
8. **UB ID verification:** Display your UB ID before starting the quiz.
9. **Location:** You may take the quiz from any location, but collaboration is strictly prohibited.

---

## Programming Assignments

1. **Codio license:** A $48 Codio license is required.
2. **Platform:** Assignments are distributed and graded exclusively on Codio.
3. **Submission:** Submit assignments via Codio. Submissions on UB Learns will not be graded.
4. **Retries:** Unlimited retries are allowed until the deadline.
5. **Grade contestation:** You have seven days after grading to contest your grade.

Programming assignments are designed to build practical skills and reinforce key concepts.

---

## Mini-Projects

### Nature

Mini-projects are extended, more complex programming assignments designed to assess applied skills and multi-component problem-solving. There will be two mini-projects in total.

### Platform and Grading

Each mini-project is assigned and submitted on Codio and is graded in two parts:

- **Automated component (Codio):** Automated tests and checks run on your submission.
- **Manual component:** A live presentation to a TA or grader. For the manual component, you must deploy a Streamlit app containerized with Docker. During the presentation, be prepared to:
  - Demonstrate the deployed Streamlit app and its functionality.
  - For projects that include a database: show that the app connects to and uses the database correctly.
  - Provide access to the project repository and Docker artifacts (Dockerfile and/or docker-compose), or otherwise run the container for the grader to inspect.

Mini-projects provide deeper engagement with the material and real-world applications.

---

## Final Project Overview

The final project is an individual, intensive endeavor showcasing your skills in data analysis, machine learning, and deployment.

### Requirements

1. **Data selection:** Choose a CSV dataset with over 1,000 rows for a classification problem.
2. **Data parsing:** Use basic Python (no Pandas) for data parsing.
3. **Normalization and database loading:** Normalize the data and load it into a database (TA approval required).
4. **Data querying:** Use SQL JOIN statements to query the data and load it into Pandas.
5. **Machine learning:** Perform classification tasks using Python ML libraries.
6. **Experiment tracking:** Use MLflow and DagsHub for experiment tracking.
7. **Deployment:** Deploy a Docker container for your classification pipeline.
8. **User interface:** Create a Streamlit app for pipeline interaction.
9. **Presentation:**
   - Host your project on a Jupyter Book website.
   - Deliver a live 12-minute presentation following the rubric.
10. **Submission deadline:**
    - Wednesday, Dec. 17, 2024, 11:59 PM
    - Submit the following on UB Learns:
      - MLflow/DagsHub experiments
      - Docker Hub link
      - Streamlit app
      - Jupyter Book website
      - Recorded presentation (UB Box link)
      - Completed rubric checklist

[Download requirements in Word format](ML_Project_Plan.docx)

---

## Late Submission Policy

1. **Maximum delay:** No assignment may be submitted more than three days after the due date.

---

## Course Resources

1. **Course book:** [Course Book](https://mkzia.github.io/eas503-book)
2. **Lecture materials:** [Lecture notebooks on GitHub](https://github.com/mkzia/eas503)
3. **UB Learns:**
   - Submit final project materials.
   - Access course grades.
4. **Codio:** Submit programming assignments.
5. **Piazza:**
   - Announcements and updates
   - Instructor and TA Q&A
   - Classmate interaction
   - Lecture and solution recordings (pinned post)
   - Office hours and deadlines (pinned post)

Engage actively with these resources and seek help when needed.

---

## Preparing for the First Class

1. **UB Learns:** Confirm access to the EAS 503 course page.
2. **Course book:** Review the [Course Book](https://mkzia.github.io/eas503-book).
3. **Codio license:** Obtain and log into Codio.
4. **Piazza:** Ensure access to Piazza for discussions and updates.
5. **Software installation:**
   - Install [Anaconda](https://www.anaconda.com/products/individual).
   - Install [Visual Studio Code](https://code.visualstudio.com/).
   - For Windows users: install Python 3.13 from the Microsoft Store.
   - Install [Docker](https://docker.com).

---

## Academic Integrity

Academic integrity is a cornerstone of the university’s mission. Violations include:

1. **Collaboration:** Sharing identical homework solutions results in zero points for all involved.
2. **Online platforms:** Posting or viewing solutions on platforms such as Chegg or Course Hero results in severe penalties, including course failure.
3. **Codio monitoring:** Codio tracks keystrokes, external pastes, and time spent in error states. Complete all work within Codio to avoid violations.

**Examples of violations:**

- Posting assignment questions online.
- Copying code from another student.
- Sharing access to your computer or accounts.

**Submission of work indicates acceptance of the academic integrity policy**. For more details, refer to the [UB Graduate Academic Integrity Policy](https://www.buffalo.edu/grad/succeed/current-students/policy-library.html#academic-integrity).

## Syllabus Review

```{code-cell} ipython3
:tags: ["remove-input"]
from jupyterquiz import display_quiz
display_quiz('syllabus_quiz.json', shuffle_answers=True, colors='fdsp')
```
