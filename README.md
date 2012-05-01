Done
====

*In-progress.*

Simple command-line tool for logging what you've been up to in plain text files.

Create / edit log entry for today
---------------------------------

```shell
> done today
```

By default, this will create a blank file at `~/done/YYYY/MM/DD.txt'` and open it with Vim. If the file already exists, it will be opened.

Configuration
-------------

When run, `done` will walk up your directory tree from your current working directory looking for `.donerc` and `.donetemplate`. If it can't find them, it will look in your home directory. If they don't exist there, it will use the built-in defaults.

To view your current configuration:

```shell
> done config
Config
------
{:root=>"/Users/tyson/Dropbox/log",
 :editor=>"mate -w",
 :path_format=>"%Y/%B/%d.txt"}

Template
--------
---
Date: <%= Time.now.strftime( "%B %-d, %Y" ) %>
Time: <%= Time.now.strftime( "%-I:%M%P %Z" ) %>
---
```

### `.donerc` Example

    root: ~/Dropbox/log
    editor: vim -f
    path_format: '%Y/%B/%d.txt'

### `.dontemplate` Example

    ---
    Date: <%= Time.now.strftime( "%B %-d, %Y" ) %>
    Time: <%= Time.now.strftime( "%-I:%M%P %Z" ) %>
    ---
