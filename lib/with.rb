#--
#           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                   Version 2, December 2004
#
#  Copyleft meh. [http://meh.paranoid.pk | meh@paranoici.org]
#
#           DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

module Kernel
  def with (*objects, &block)
    result, exception = nil

    begin
      result = block.call *objects.map {|object|
        if object.respond_to? :__enter__
          object.__enter__
        else
          object
        end
      }
    rescue Exception => e
      exception = e
    end

    if objects.length == 1
      if objects.first.respond_to? :__exit__
        objects.first.__exit__ exception
      else
        raise exception if exception
      end
    else
      raise exception if exception
    end

    result
  end
end
