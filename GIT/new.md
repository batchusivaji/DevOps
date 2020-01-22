 # GIT

## Git Stages

* Working tree/Local tree
* Staging area/Indexing area
* Local Repository
* Remote Repository
* Stash

## Git commands

```
1. Create a folder enter in to the folder
      git init
2. Adding changes of working tree to staging area (single file)
      git add <filename>
3. Adding changes of working tree to staging area (adding all changes at a time)
      git add .
      git add --all
      git add -A
4. Before doing commit you have to give give your details to git to know who you are
      git config --global user.name "<username>"
      git config --global user.mail "<usermail-id>"

5. If everything is ok save the changes from Staging Area to Local Repo
      git commit -m "Commit messege"
6. To know the status of the git
      git status
7. To see history of (here you will get long commitid)
      git log
      git log --oneline   (here you will get short commitid)
8. You want add changes of already existing file
      git add -u
9. Whatever the changes you added to the staging area code you dont want to present in staging area
    you want to revert back is possible with reset command
      git reset         (here the changes made in staging area will be reverted but not deletes the modifications in working tree)
      git reset --hard  (here all the changes made in working tree and staging area will be reverted)
10. To go back to your code history
      git checkout <commit-id>
      git checkout master (to come back your latest commit in your branch)  
*   Here you are added some changes you want to revert back that changes
      git checkout --<filename> (the changes you added to that particularfile is reverted)
11. Remove all untracked files
      git clean -fd
12. To know what going on in tree what are the changes made from one to one 
      git cat-file -p <commit-id>
13. Remove files from local repository
      rm <filename>
14. To add Remote repository url
      git remote add <name-of-remote> <url>
      git remote add origin <url>
15. Push the code from Local repository to Remote repository (adding your changes to remote repo)
      git push <name-of-the-remote> <branchname> (whereever you want to add the changes to that branch switch in to that branch then push)
      git push origin master
16. Pull the code from Remote repository to Local repository (taking other changes to your local repo)
      git pull
```


# Rebase Commands

* Rebasing is the process of moving or combining a sequence of commits to a new base commit. Rebasing is most useful and easily visualized in the context of a feature branching workflow.
* Running git rebase with the -i flag begins an interactive rebasing session. Instead of blindly moving all of the commits to the new base, interactive rebasing gives you the opportunity to alter individual commits in the process.
* This lets you clean up history by removing, splitting, and altering an existing series of commits.
* The command line argument --onto can be passed to git rebase. When in git rebase --onto mode the command expands to

```
1. git rebase <base> (checkin into which branch you want to rebase)
2. git rebase -i <base> ( here picking individual commits)
3. git rebase --onto <newbase> <oldbase>
4. git rebase --onto master featureA featureB
```
# changing the last commit(commit messege also changed)

* The git commit --amend command is a convenient way to modify the most recent commit. It lets you combine staged changes with the previous commit instead of creating an entirely new commit.
```
1. git commit --amend
2. git commit --amend -m "an updated commit message"
```

