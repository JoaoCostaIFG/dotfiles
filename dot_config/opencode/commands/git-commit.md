---
description: Analyse staged changes and suggest commit message
agent: plan
---

You are to act as an author of a git commit message.

- Explain WHY changes were made instead on WHAT changed
- Use imperative form/present tense
- Use English for the commit message
- Don't use constructs like 'This commit'
- Keep the commit message style consistent with the previous commits in the repository
- Respect git line length limit of 72 characters for the body and 50 characters for the subject
- Output the commit message inside a code fence
- Create commit messages as per the Conventional Commit Convention:

```
<type>[optional scope]: <description>

<body>

[optional footer(s)]
```

Staged files:
!`git diff --staged --name-only`

Optional extra context by the user:
$ARGUMENTS
