# Markdown Headings
[heading__top]:
  #markdown-headings
  "&#x2B06; Vim plugin that adds short-cuts/commands for MarkDown headings"


Vim plugin that adds short-cuts/commands for MarkDown headings


## [![Byte size of Markdown Headings][badge__main__markdown_headings__source_code]][markdown_headings__main__source_code] [![Open Issues][badge__issues__markdown_headings]][issues__markdown_headings] [![Open Pull Requests][badge__pull_requests__markdown_headings]][pull_requests__markdown_headings] [![Latest commits][badge__commits__markdown_headings__main]][commits__markdown_headings__main]


------


- [:arrow_up: Top of Document][heading__top]

- [:building_construction: Requirements][heading__requirements]

- [:zap: Quick Start][heading__quick_start]

- [&#x1F9F0; Usage][heading__usage]

- [&#x1F5D2; Notes][heading__notes]

- [:card_index: Attribution][heading__attribution]

- [:balance_scale: Licensing][heading__license]


------



## Requirements
[heading__requirements]:
  #requirements
  "&#x1F3D7; Prerequisites and/or dependencies that this project needs to function properly"


Vim should be installed prior to using this plugin, eg...


```Bash
sudo apt-get install vim
```


___


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; Perhaps as easy as one, 2.0,..."


Clone this project...


```Bash
mkdir -vp ~/git/hub/vim-utilities

cd ~/git/hub/vim-utilities

git clone git@github.com:vim-utilities/markdown-headings.git
```


If **not** utilizing some form of Vim plugin manager, then the `linked-install.sh` may be run on most 'nix devices...


```Bash
./linked-install.sh
```


After installation, plugin documentation may be accessed via Vim's `:help` command, eg...


```Vim
:help markdown-heading-transform

:help markdown-heading-link
```


___


## Usage
[heading__usage]:
  #usage
  "&#x1F9F0; How to utilize this project"


Features of this plugin automatically activate if detected `filetype` is `markdown`


**Example Usage**


0. Write a line of text...


```MarkDown
Heading line to be
```

1. Use Vim leader sequence to convert line into level `2` MarkDown heading...


```Vim
<Leader>h2
```

2. Example results...


```MarkDown
## Heading line to be
```


3. Use Vim command to build Heading Link with title text...


```Vim
:Hl Text about heading
```


4. Example results...


```MarkDown
## Heading line to be
[heading__heading_line_to_be]: #heading-line-to-be "Text about heading"
```


5. Edit text of heading...


```MarkDown
## Edited heading line
[heading__heading_line_to_be]: #heading-line-to-be "Text about heading"
```

6. Use Vim leader sequence to update Heading Link...


```Vim
<Leader>hl
```


7. Example results...


```MarkDown
## Edited heading line
[heading__edited_heading_line]: #edited-heading-line "Text about heading"
```


... Note, either `:Hl` or `<Leader>hl` will update any references to the heading within the document too!


For example for a table of contents similar to...


```MarkDown
- [Link to Some Heading][heading__heading_line_to_be]
```


... would be updated to...


```MarkDown
- [Link to Some Heading][heading__edited_heading_line]
```


8. Convert the level two heading to a level three heading...


```Vim
<Leader>h3
```


... example results...


```Vim
### Edited heading line
```


___


## Notes
[heading__notes]:
  #notes
  "&#x1F5D2; Additional things to keep in mind when developing"


Notice, some MarkDown interpreters may _sanitize_ symbols within heading text slightly different to GitHub.


This repository may not be feature complete and/or fully functional, Pull Requests that add features or fix bugs are certainly welcomed.


- [Fork][markdown_headings__fork_it] this repository to an account that you have write permissions for.

- Add remote for fork URL. The URL syntax is _`git@github.com:<NAME>/<REPO>.git`_...


```Bash
cd ~/git/hub/vim-utilities/markdown-headings

git remote add fork git@github.com:<NAME>/markdown-headings.git
```


- Commit your changes and push to your fork, eg. to fix an issue...


```Bash
cd ~/git/hub/vim-utilities/markdown-headings


git commit -F- <<'EOF'
:bug: Fixes #42 Issue


**Edits**


- `<SCRIPT-NAME>` script, fixes some bug reported in issue
EOF


git push fork main
```


> Note, the `-u` option may be used to set `fork` as the default remote, eg. _`git push fork main`_ however, this will also default the `fork` remote for pulling from too! Meaning that pulling updates from `origin` must be done explicitly, eg. _`git pull origin main`_


- Then on GitHub submit a Pull Request through the Web-UI, the URL syntax is _`https://github.com/<NAME>/<REPO>/pull/new/<BRANCH>`_


> Note; to decrease the chances of your Pull Request needing modifications before being accepted, please check the [dot-github](https://github.com/vim-utilities/.github) repository for detailed contributing guidelines.


___


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [Dev Hints -- Vim Help](https://devhints.io/vim-help)

- [Gist -- An overview of what belongs in each directory of a Vim plugin](https://gist.github.com/nelstrom/1056049/784e252c3de653e204e9e128653010e19fbd493f)

- [GitHub -- `github-utilities/make-readme`](https://github.com/github-utilities/make-readme)

- [Learn Vimscript the Hard Way -- Function Arguments](https://learnvimscriptthehardway.stevelosh.com/chapters/24.html)

- [StackExchange -- How to write a gvim-help-doc-like text file?](https://stackoverflow.com/questions/5576091/)

- [StackOverflow -- How to insert text from a variable at current cursor position](https://vi.stackexchange.com/questions/21825/)

- [StackOverflow -- Save current line in variable](https://stackoverflow.com/questions/13821350/)

- [StackOverflow -- vim how to pass arguments to functions from user commands](https://stackoverflow.com/questions/3213657/)

- [YouTube -- Start Turning vim into a /comfy/ IDE! -- Luke Smith](https://www.youtube.com/watch?v=Q4I_Ft-VLAg)


___


## License
[heading__license]:
  #license
  "&#x2696; Legal side of Open Source"


```
Vim plugin that adds short-cuts/commands for MarkDown headings
Copyright (C) 2020 S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```


For further details review full length version of [AGPL-3.0][branch__current__license] License.



[branch__current__license]:
  /LICENSE
  "&#x2696; Full length version of AGPL-3.0 License"


[badge__commits__markdown_headings__main]:
  https://img.shields.io/github/last-commit/vim-utilities/markdown-headings/main.svg

[commits__markdown_headings__main]:
  https://github.com/vim-utilities/markdown-headings/commits/main
  "&#x1F4DD; History of changes on this branch"


[markdown_headings__community]:
  https://github.com/vim-utilities/markdown-headings/community
  "&#x1F331; Dedicated to functioning code"


[issues__markdown_headings]:
  https://github.com/vim-utilities/markdown-headings/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."

[markdown_headings__fork_it]:
  https://github.com/vim-utilities/markdown-headings/
  "&#x1F531; Fork it!"

[pull_requests__markdown_headings]:
  https://github.com/vim-utilities/markdown-headings/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

[markdown_headings__main__source_code]:
  https://github.com/vim-utilities/markdown-headings/
  "&#x2328; Project source!"

[badge__issues__markdown_headings]:
  https://img.shields.io/github/issues/vim-utilities/markdown-headings.svg

[badge__pull_requests__markdown_headings]:
  https://img.shields.io/github/issues-pr/vim-utilities/markdown-headings.svg

[badge__main__markdown_headings__source_code]:
  https://img.shields.io/github/repo-size/vim-utilities/markdown-headings


[vim_home]:
  https://www.vim.org
  "Home page for the Vim text editor"

[vim__github]:
  https://github.com/vim/vim
  "Source code for Vim on GitHub"
