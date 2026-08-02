# ============================================================
#  LIVE DEMO SCRIPT — Git Versioning & Deployment Strategies
#  Friday Dev Session
# ============================================================

# -------------------------------------------------------
# PART 1: INITIAL SETUP — First commit to main
# -------------------------------------------------------

git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Stage all files
git add .

# First commit — this is your baseline
git commit -m "feat: initial project setup — Team Dashboard v1.0.0"

# Rename branch to main (best practice)
git branch -M main

# Connect to GitHub (create repo on GitHub first, then:)
git remote add origin https://github.com/<your-username>/git-demo-session.git

# Push to GitHub
git push -u origin main


# -------------------------------------------------------
# PART 2: BRANCHING STRATEGY
# Explain: main = production, develop = integration, feature/* = work
# -------------------------------------------------------

# Create develop branch from main
git checkout -b develop
git push -u origin develop

# Create a feature branch from develop
git checkout -b feature/add-team-section
# (make a small change to index.html — add a new card)


# -------------------------------------------------------
# PART 3: MESSY COMMITS (realistic dev scenario)
# Show how devs make multiple small commits while working
# -------------------------------------------------------

# Simulate 3 messy work-in-progress commits
git add index.html
git commit -m "wip: started team section"

git add index.html
git commit -m "wip: added names"

git add index.html
git commit -m "fix typo"


# -------------------------------------------------------
# PART 4: SQUASH — Clean up before merging
# Combine those 3 messy commits into 1 clean commit
# -------------------------------------------------------

# Squash last 3 commits interactively
git rebase -i HEAD~3

# In the editor that opens:
#   pick  abc1234  wip: started team section
#   squash def5678  wip: added names
#   squash ghi9012  fix typo
#
# Change "squash" → save → write new message:
#   feat: add team members section

# Result: 1 clean commit instead of 3 messy ones
git log --oneline


# -------------------------------------------------------
# PART 5: MERGE FEATURE → DEVELOP (clean history)
# -------------------------------------------------------

git checkout develop
git merge --no-ff feature/add-team-section -m "merge: feature/add-team-section into develop"
git push origin develop

# Delete the feature branch (cleanup)
git branch -d feature/add-team-section
git push origin --delete feature/add-team-section


# -------------------------------------------------------
# PART 6: MERGE DEVELOP → MAIN (release)
# -------------------------------------------------------

git checkout main
git merge --no-ff develop -m "release: merge develop into main for v1.1.0"
git push origin main


# -------------------------------------------------------
# PART 7: PRODUCTION TAGS — Versioning
# Tags = permanent markers on a commit = your release history
# -------------------------------------------------------

# Lightweight tag (quick reference)
git tag v1.0.0

# Annotated tag (recommended for production — has message, author, date)
git tag -a v1.1.0 -m "Release v1.1.0 — added team members section"

# Push tags to GitHub
git push origin --tags

# List all tags
git tag

# See tag details
git show v1.1.0


# -------------------------------------------------------
# PART 8: DEPLOYMENT — GitHub Pages
# -------------------------------------------------------
# 1. Go to your GitHub repo
# 2. Settings → Pages
# 3. Source: Deploy from branch → main → / (root)
# 4. Save → your site is live at:
#    https://<your-username>.github.io/git-demo-session


# -------------------------------------------------------
# PART 9: HOTFIX WORKFLOW (bonus — real production scenario)
# -------------------------------------------------------

# Bug found in production! Create hotfix from main directly
git checkout main
git checkout -b hotfix/fix-version-badge

# Make the fix...
git add .
git commit -m "fix: correct version badge text on dashboard"

# Merge back to main AND develop
git checkout main
git merge --no-ff hotfix/fix-version-badge -m "hotfix: fix version badge"
git tag -a v1.1.1 -m "Hotfix release v1.1.1"
git push origin main --tags

git checkout develop
git merge --no-ff hotfix/fix-version-badge -m "merge hotfix into develop"
git push origin develop

git branch -d hotfix/fix-version-badge


# -------------------------------------------------------
# PART 10: CLEAN COMMIT HISTORY — Best Practices
# -------------------------------------------------------

# View clean log
git log --oneline --graph --all

# Good commit message format:
#   type: short description (max 72 chars)
#
#   Types: feat | fix | docs | style | refactor | test | chore
#
#   Examples:
#   feat: add user login page
#   fix: resolve null pointer in auth service
#   docs: update README with deployment steps
#   chore: update .gitignore

# ============================================================
# END OF DEMO
# ============================================================
