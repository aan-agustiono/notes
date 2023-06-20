<article class="markdown-body entry-content container-lg" itemprop="text">
<h1 tabindex="-1" dir="auto"><a id="user-content-git-commands" class="anchor" aria-hidden="true" href="#git-commands"></a>Git Commands</h1>
<hr>
<p dir="auto"><em>A list of my commonly used Git commands</em></p>
<p dir="auto"><em>If you are interested in my Git aliases, have a look at my <code>.bash_profile</code>, found here: <a href="https://github.com/joshnh/bash_profile/blob/master/.bash_profile">https://github.com/joshnh/bash_profile/blob/master/.bash_profile</a></em></p>
<p dir="auto">--</p>
<h3 tabindex="-1" dir="auto"><a id="user-content-getting--creating-projects" class="anchor" aria-hidden="true" href="#getting--creating-projects"></a>Getting &amp; Creating Projects</h3>
<table>
<thead>
<tr>
<th>Command</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>git init</code></td>
<td>Initialize a local Git repository</td>
</tr>
<tr>
<td><code>git clone ssh://git@github.com/[username]/[repository-name].git</code></td>
<td>Create a local copy of a remote repository</td>
</tr>
</tbody>
</table>
<h3 tabindex="-1" dir="auto"><a id="user-content-basic-snapshotting" class="anchor" aria-hidden="true" href="#basic-snapshotting"></a>Basic Snapshotting</h3>
<table>
<thead>
<tr>
<th>Command</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>git status</code></td>
<td>Check status</td>
</tr>
<tr>
<td><code>git add [file-name.txt]</code></td>
<td>Add a file to the staging area</td>
</tr>
<tr>
<td><code>git add -A</code></td>
<td>Add all new and changed files to the staging area</td>
</tr>
<tr>
<td><code>git commit -m "[commit message]"</code></td>
<td>Commit changes</td>
</tr>
<tr>
<td><code>git rm -r [file-name.txt]</code></td>
<td>Remove a file (or folder)</td>
</tr>
</tbody>
</table>
<h3 tabindex="-1" dir="auto"><a id="user-content-branching--merging" class="anchor" aria-hidden="true" href="#branching--merging"></a>Branching &amp; Merging</h3>
<table>
<thead>
<tr>
<th>Command</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>git branch</code></td>
<td>List branches (the asterisk denotes the current branch)</td>
</tr>
<tr>
<td><code>git branch -a</code></td>
<td>List all branches (local and remote)</td>
</tr>
<tr>
<td><code>git branch [branch name]</code></td>
<td>Create a new branch</td>
</tr>
<tr>
<td><code>git branch -d [branch name]</code></td>
<td>Delete a branch</td>
</tr>
<tr>
<td><code>git push origin --delete [branch name]</code></td>
<td>Delete a remote branch</td>
</tr>
<tr>
<td><code>git checkout -b [branch name]</code></td>
<td>Create a new branch and switch to it</td>
</tr>
<tr>
<td><code>git checkout -b [branch name] origin/[branch name]</code></td>
<td>Clone a remote branch and switch to it</td>
</tr>
<tr>
<td><code>git branch -m [old branch name] [new branch name]</code></td>
<td>Rename a local branch</td>
</tr>
<tr>
<td><code>git checkout [branch name]</code></td>
<td>Switch to a branch</td>
</tr>
<tr>
<td><code>git checkout -</code></td>
<td>Switch to the branch last checked out</td>
</tr>
<tr>
<td><code>git checkout -- [file-name.txt]</code></td>
<td>Discard changes to a file</td>
</tr>
<tr>
<td><code>git merge [branch name]</code></td>
<td>Merge a branch into the active branch</td>
</tr>
<tr>
<td><code>git merge [source branch] [target branch]</code></td>
<td>Merge a branch into a target branch</td>
</tr>
<tr>
<td><code>git stash</code></td>
<td>Stash changes in a dirty working directory</td>
</tr>
<tr>
<td><code>git stash clear</code></td>
<td>Remove all stashed entries</td>
</tr>
</tbody>
</table>
<h3 tabindex="-1" dir="auto"><a id="user-content-sharing--updating-projects" class="anchor" aria-hidden="true" href="#sharing--updating-projects"></a>Sharing &amp; Updating Projects</h3>
<table>
<thead>
<tr>
<th>Command</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>git push origin [branch name]</code></td>
<td>Push a branch to your remote repository</td>
</tr>
<tr>
<td><code>git push -u origin [branch name]</code></td>
<td>Push changes to remote repository (and remember the branch)</td>
</tr>
<tr>
<td><code>git push</code></td>
<td>Push changes to remote repository (remembered branch)</td>
</tr>
<tr>
<td><code>git push origin --delete [branch name]</code></td>
<td>Delete a remote branch</td>
</tr>
<tr>
<td><code>git pull</code></td>
<td>Update local repository to the newest commit</td>
</tr>
<tr>
<td><code>git pull origin [branch name]</code></td>
<td>Pull changes from remote repository</td>
</tr>
<tr>
<td><code>git remote add origin ssh://git@github.com/[username]/[repository-name].git</code></td>
<td>Add a remote repository</td>
</tr>
<tr>
<td><code>git remote set-url origin ssh://git@github.com/[username]/[repository-name].git</code></td>
<td>Set a repository's origin branch to SSH</td>
</tr>
</tbody>
</table>
<h3 tabindex="-1" dir="auto"><a id="user-content-inspection--comparison" class="anchor" aria-hidden="true" href="#inspection--comparison"></a>Inspection &amp; Comparison</h3>
<table>
<thead>
<tr>
<th>Command</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>git log</code></td>
<td>View changes</td>
</tr>
<tr>
<td><code>git log --summary</code></td>
<td>View changes (detailed)</td>
</tr>
<tr>
<td><code>git log --oneline</code></td>
<td>View changes (briefly)</td>
</tr>
<tr>
<td><code>git diff [source branch] [target branch]</code></td>
<td>Preview changes before merging</td>
</tr>
</tbody>
</table>
</article>
