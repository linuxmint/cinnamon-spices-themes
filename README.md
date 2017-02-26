# cinnamon-spices-themes

This repository hosts all the themes available for the Cinnamon desktop environment.

Users can install spices from https://cinnamon-spices.linuxmint.com, or directly from within Cinnamon -> System Settings.

# Definitions

## UUID

Each spice is given a name which uniquely identifies them.

That name is their UUID and it is unique.

## Author

Each spice has an author.

The github username of the author is specified in the spice's info.json file.

# File structure

A spice can contain many files, but it should have the following file structure:

- UUID/
- UUID/info.json
- UUID/icon.png
- UUID/screenshot.png
- UUID/README.md
- UUID/files/
- UUID/files/UUID
- UUID/files/UUID/cinnamon/cinnamon.css

There are two important directories:

- UUID/ is the root level directory, it includes files which are used by the website and on github.
- UUID/files/ represents the content of the ZIP archive which users can download from https://cinnamon-spices.linuxmint.com or which is sent to Cinnamon when installing the spice from System Settings. This is the content which is interpreted by Cinnamon itself.

As you can see, the content of the spice isn't placed inside UUID/files/ directly, but inside UUID/files/UUID/ instead. This guarantees files aren't extracted directly onto the file system, but placed in the proper UUID directory. The presence of this UUID directory, inside of files/ isn't actually needed by Cinnamon (as Cinnamon creates it if it's missing), but it is needed to guarantee a proper manual installation (i.e. when users download the ZIP from the Cinnamon Spices website).

At the root level:

- info.json contains information about the spice. For instance, this is the file which contains the github username of the spice's author.
- icon.png is the icon associated with the spice.
- screenshot.png is a screenshot of the spice in action.
- README.md is optional and can be used to show instructions and information about the spice. It appears both in Github and on the website.

# Spice content

Spices should not contain files which are not relevant to them.

For instance, icons, desktop backgrounds or MDM themes should not be included in themes. They end up in ~/.local/share/themes/UUID/ once installed and are not supposed to be there at all.

Arguably, gnome-shell, Xfce and Unity themes aren't relevant to Cinnamon users either, at least not within the Cinnamon desktop environment.

# Rights and responsibility of the author

The author is in charge of the development of the spice.

Authors can modify their spice under the following conditions:

- They need to respect the file structure and workflow defined here
- They cannot introduce malicious code or code which would have a negative impact on the environment

Authors are able to accept or refuse changes from other people which modify the features or the look of their spice.

# Pull requests from authors and workflow

To modify a spice, developers create a Pull Request.

Members of the cinnamon-spices-artists team review the pull request.

If the author of the pull request is the spice author (his github username matches the author field in UUID/info.json), the reviewer only has to perform the following checks:

- The changes only impact spices which belong to that author
- The changes respect the spices file structure
- The changes do not introduce malicious code or code which would negatively impact the desktop environment

If everything is fine, the PR is merged, the website is updated and users can see a spice update in System Settings.

# Pull requests from other people

In addition to the checks specified above, if the pull requests comes from somebody else than the author, the reviewer will need to check the nature of the changes.

If the changes represent a bug fix, the PR can be merged.

If the changes represent a change in functionality, or in look and feel, or if their implementation could be questioned and/or discussed, the reviewer should leave the PR open and ask the author to review it.

If the author is happy with the PR, it can then be merged. If he's not, it can be closed instead.

# Deletions

Authors are entitled to remove their spice.

The Cinnamon team is also entitled to do so. Common reasons are lack of maintenance, critical bugs, or if the features are already provided, either by Cinnamon itself, or by another spice which is more successful.

# Additions

New spices can be added by Pull Request.

The Cinnamon team can accept or reject the addition and should give justification in the PR comments section.

# Reporting Bugs

It's important to use a proper title when opening new issues. The title must be in the format `spice name: simple description of the problem`.

Issues that don't follow this format will be closed.

# Getting Started

The default theme is in the Cinnamon github repository under Cinnamon/data/theme
This will give you a good idea of the CSS that Cinnamon responds to, and provides a default set of graphical elements.
Cinnamon will generally pick CSS elements out of the default theme if there is something absent from your theme.
Themes can use this facility for some smaller aspects and still look fine. Each panel is in three parts .panelLeft .panelCenter and .panelRight
The same names are used if a panel is vertical.

Cinnamon themes are read from the .themes directory in your home directory

If things are not working as you expect then it is worth looking in the error files .cinnamon/glass.log and .xsession-errors
in your home directory. If your screen reverts to the default Cinnamon theme then your CSS is probably failing to parse and contains a syntax error.

Please check that your theme works correctly with a panel on any of the four sides of the screen.  This is the most common fault in submitted themes. If you have CSS that needs to work differently on different sides of the screen then .panel-top .panel-bottom .panel-left and .panel-right will be your friend.

# Git basics

If you are used to creating a theme as a zip file and hosting it somewhere like deviantart you might want a few pointers as to how to use git. It is not hard at all for simple use, but the huge complexity of what it can do can be offputting if you browse around and find your head hurting from articles dealing with complex cases.  For what you are going to need to do it doesn't have to be complicated

First of all get yourself a github account and set up git locally  https://help.github.com/articles/set-up-git/

Now fork the cinnamon-spices-themes repo  https://help.github.com/articles/fork-a-repo/  this will create a fork of the linux mint repo in your own github account. Now clone it onto your machine. That is all in that same article. So let's say that you were in a directory dev under your home account when you started the cloning on your local machine, you will now find dev/cinnamon-spices-themes in there, if you change directory into there then you can fire off the git commands you need in terminal. However first you need to create your theme. You might well want to copy a suitable theme out of the repository to ensure you have a working file hierarchy first. Git will be tracking everything you do in the git directory so doing all your development work elsewhere is protection against whoopsies.  Just make sure you copy rather than move ;-). The theme development is all over to you - I generally work dual panel in nemo, copy each iteration to the .themes directory for testing, and hit alt-ctrl-esc to restart Cinnamon,  but your working style is entirely up to you. You need to ensure that the UUID directory names have no spaces in, dashes are fine. So let's assume that you have just created your theme called Wunderbar-Black for example. 

Don't copy it into your git directory yet. That would put it into your master branch, and that will cause confusion if you want to work on multiple themes, or intend to make further changes over time.

Create a branch wb1 - say - the name is entirely up to you, and check it out

git branch wb1
git checkout wb1

Now you can copy your new theme in

Typing 'git status' should show that git is aware of the new directory tree Wunderbar-Black/
It mmay well show up in red to indicate it is new to git

now type git add Wunderbar-Black/

copy and paste is your friend here

now git status will show a long list of files, probably in green. They are not committed yet, that is the next step

git commit -m "Wunderbar-Black: Initial creation"

This will create a single commit ready to be pushed, we prefer our commit comments to have the theme name at the front like this.

Now push to your github account

git push origin wb1

you will have to enter your github username and password at this point.

Your new pull request should be transferred successfully to your github account.

Now go to your github account and navigate to your cinnamon-spices-themes fork. If you do this within a reasonable time after pushing from your computer github will tell you that you have a new commit ready for pushing upstream. Pretty much all you have to do now is to go into it and press the green button. A Pull Request will be created on the linuxmint repository, and it is now over to one of us to pull the commit through to live.  Once we have checked it over to ensure that it is safe and appears to function, of course ...

Don't forget that you are still in branch wb1 on your local machine. If you start work on something new without changing branch then it will be layered on top of your first set of work. Which is probably not what you want. So at this stage I will usually change to a new branch just so I don't have to keep track of where I was

git checkout master
git branch wb2
git checkout wb2

Hope this helps get you going. We look forward to seeing your themes !


