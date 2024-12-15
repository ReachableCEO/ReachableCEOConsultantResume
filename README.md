# MarkdownResume-Pipeline-ClientExample

Example client repository for using the [MarkdownResume-Pipeline](https://git.knownelement.com/reachableceo/MarkdownResume-Pipeline) resume building
microservice. The microservice is vendored into this repository.

## Quickstart

### Runtime Requirements

- Bash (this entire project was developed on msys2 on Windows 10)
- Ensure you have pandoc installed and in your path.

### Steps

- Edit local/build/CandidateVariables.env to refelct your information.
- Edit local/Templates/MarkdownResume/WorkHistory/WorkHistory.csv
- Create and edit local/Templates/MarkdownResume/JobHistoryDetails/<position>.md to match the value in the first field of WorkHistory.csv
- Repeat as necessary for your job history.
- Edit local/Templates/MarkdownResume/SkillsAndProjects/Projects.md
- Edit local/Template/MarkdownResume/SkillsAndProjects/Skills.csv
- Edit local/Templates/MarkdownResume/CandidateInfoSheet.md
- cd to the local/build directory and run bash build-demo-markdown.sh
- Examine the PDF/MSWord output in local/build-output/*
