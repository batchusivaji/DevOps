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

# Branching Commands

* The default git branch is Master

```
1. To create new branch
      git branch <branchname> (green mark indicates current branch name)
2. To see the branches list
      git branch
3. To create new branch and switch to that new branch
      git checkout -b <branchname>
4. To switch particular branch
      git checkout <branchname>
5. Merging child branch changes to Parent branch
      git merge <branchname> (move the destination branch)
6. To view the diffrence b/w branch or commitids
      git diff <commitid> <commitid>
      git diff <branch> <branch>
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

# Git flow

* Most widely used branching stratagie is Git flow most of the companies are using this git flow.
* Why because git flow supports
  1. Parallel Development
  2. Collabaration
  3. Release Staging Area
  4. Support for Emergency fixes

## Most Widely used Branching Stratagey

* In git we have different branches default branch is Master branch.
  1. Master branch
  2. Develop branch
  3. Feature branches
  4. Release branches
  5. Hotfix branches

   In mater branch nothing to be devloped and no code commits in master branch, whatever the new developent is done by on feature branches merged back to develop brnach.

* Development is not done in master branch . New devopment is done in feature branches, master brnch have only merges from develop, release, hotfix branches.
* From Master branch we crate Develop branch. From Develop branch we create Feature branches. On feature branches developres works on new development as features all this development of feature branches is merged to Develop branch. In Develop branch take the code in the form of url we do CI/CD in jenkins, cerate jobs in develop brnach. If build fails we report to the developres they again work on feature branches and add some commits and finally merge back to Develop branch.
* From Develop branch we create Release branch , if the jenkins job is build sucess we usually merge develop branch to release branch.
* We directlly dont give release to the product owner, first we test the application then we give a release to the PO. For that we create different environments for release branch like
  1. Dev Env
  2. Test Env
  3. Prod Env
* if our application is working properly on all the environments now our application is ready to give our PO. Now merge release branch to master branch and develop branch. If any bugs are find in the release branch developres work on again feature branches and they reslove fixes merged back to the develop branch.
* The master branch tracks released code only. The only commits to master are merges from release branches and hotfix branches.
Hotfix branches are used to create emergency fixes
* When ever release branch is ready we merge it to the Master branch if if PO find any Hotfixes we can create Hotfix branch from master and fix the the changes again we merge it back to the Develop&Master branch.

