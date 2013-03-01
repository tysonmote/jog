Jog
===

Simple command-line tool for logging what you've been up to in plain text files.

Create / edit log entry for today
---------------------------------

```shell
> jog today
```

By default, this will create a blank file at `~/jog/YYYY/MM/DD.txt'` and open it with the editor specified by your `EDITOR` environment variable (or `vim`, if none is set). If the file already exists, it will be opened in your editor.

Configuration
-------------

When run, `jog` will walk up your directory tree from your current working directory looking for `.jogrc` and `.jogtemplate`. If it can't find them, it will look in your home directory. If they don't exist there, it will use the built-in defaults.

To view your current configuration, run `jog config`:

```shell
> jog config
Config
------
{:root=>"/Users/tyson/Dropbox/log",
 :path_format=>"%Y/%B/%d.txt"}

Template
--------
---
Date: <%= Time.now.strftime( "%B %-d, %Y" ) %>
Time: <%= Time.now.strftime( "%-I:%M%P %Z" ) %>
---
```

### `.jogrc`

Example:

    root: ~/Dropbox/log
    path_format: '%Y/%B/%d.txt'

### `.jogtemplate`

Jog template files are processed through ERB at runtime. Example:

    ---
    Date: <%= Time.now.strftime( "%A %B %-d, %Y" ) %>
    Time: <%= Time.now.strftime( "%-I:%M%P %Z" ) %>
    ---

Changelog
---------

* **0.0.6** - Fix nil template when no `.jogtemplate` is provided, fix for
  `.jogrc` being used as template when `.jogtemplate` wasn't present.
* **0.0.5** - Initial release.

