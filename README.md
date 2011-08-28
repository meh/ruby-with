`with` statement, because Ruby can't miss something that Python has, amirite?
=============================================================================

It works almost exactly as the Python `with` statement, except you can pass more than one
variable to it.

If there's an `__enter__` method it calls it, and if there's an `__exit__` method it calls it
passing the eventual Exception. If any `__exit__` returns `true` when an exception has been
raised it is ignored, if nothing returns `true` the exception is raised again.

If you want Python-like functionality for standard objects (for example passing an IO object to
the with and having it closed) you can `require 'with/adapters'`, otherwise those features are
not present.

Example:

```ruby
require 'with'
require 'with/adapters'

with File.new(ARGV.first, ?r) do |f|
  f.read
end # this will return the contents of the passed path
```
