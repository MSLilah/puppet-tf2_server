module Puppet::Parser::Functions
  newfunction(:prefix_and_suffix, :type => :rvalue, :doc => <<-EOS
This function applies a prefix and a suffix to all elements in an array.
  EOS
  ) do |args|

    raise(Puppet::ParseError, 
          "prefix_and_suffix(): Wrong number or arguments, requires 3") if args.size != 3
    arr = args[0]
    
    unless arr.is_a?(Array)
      raise Puppet::ParseError, "prefix_and_suffix(): first argument must be an array"
    end

    prefix = args[1]
    
    unless prefix.is_a?(String)
      raise Puppet::ParseError, "prefix_and_suffix(): prefix must be a string"
    end

    suffix = args[2]

    unless suffix.is_a?(String)
      raise Puppet::ParseError, "prefix_and_suffix(): suffix must be a string"
    end

    return arr.map { |n| "#{prefix}#{n}#{suffix}" }
  end
end
