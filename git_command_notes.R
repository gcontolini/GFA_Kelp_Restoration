## Start the workflow in git ##
# Clone from remote. 
git remote add origin https://github.com/gcontolini/GFA_Kelp_Restoration.git
# open the directory locally
cd ~/Desktop/GFA_Kelp_Restoration
# pull from remote
git pull 
# see what files are being tracked
git ls-files 
# you should see all your files.
git status 
# shows if you are working on a branch or if you're up to date with main.
# do some work, then add something you worked on
git add filename.Rmd
# commit what you just added
git commit -m "message"
# amend a commit since you're not done with the thing you're working on yet
git add filename.Rmd
git commit --amend --no-edit
# make the final commit after you finished amending a bunch of times
git add filename.Rmd
git commit --amend -m "Implement awesome feature; closes #43"
# push (to local? to remote? IDK)
git push


## fork someone else's repo so you can make changes and then push them back to that person's repo.
# This way, you can commit and push changes locally to a remote copy of the forked repo, and then ask to push them back to that person's repo in a "pull request."

You can do this With usethis: usethis::create_from_github("OWNER/REPO", fork = TRUE)

Apparently this is not possible within git or RStudio (except as shown above?).
Source: https://happygitwithr.com/common-remote-setups
More detailed instructions: https://happygitwithr.com/fork-and-clone#fork-and-clone