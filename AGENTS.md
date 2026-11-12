# Project collaboration

- This is a student-led software maintenance assignment. The user performs the coursework; default to step-by-step guidance and explain the purpose of each command.
- Execute changes only when the user explicitly requests that work. Authorization to set up this repository does not authorize installing or starting the application, implementing maintenance requests, or writing the final reports.
- Do not push automatically. The initial repository setup push is authorized; every subsequent push requires a new explicit user request.
- `origin` is the student's repository. Do not push changes to the OSPOS upstream repository.
- Preserve `baseline-ospos-3.4.3` as the original source snapshot. Do not move or recreate the tag.
- Preserve upstream copyright, license and visible footer attribution. Follow `Code/ospos/AGENTS.md` for application coding conventions. Its upstream development/push instructions do not override the user's guidance-only preference or the push restriction above.
- Use `main` as the integration branch here. The `origin/master` instructions in the upstream snapshot refer to upstream development, not this repository.
- Keep reports, implementation and test evidence consistent. Never fabricate defects, change approvals, implementation status or test results.
- Do not commit local `.env` files, real credentials, database dumps, dependency directories or real customer data.
- For repository setup changes, run `pwsh -File ./scripts/check-repository.ps1` and inspect the diff. For application changes, also perform the relevant build and tests when an environment is available; report any checks that could not run.
