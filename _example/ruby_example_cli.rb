require 'optparse'
require '../bash_string_escape.rb'

options = {
  input_to_escape: nil,
  is_escape_space: true,
  is_disable_input_print: false
}

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: ruby_example_cli.rb [OPTIONS]"
  opt.separator  ""
  opt.separator  "Options (options without [] are required)"

  opt.on("--input INPUT_TO_ESCAPE", "input to escape") do |value|
    options[:input_to_escape] = value
  end

  opt.on("--is-escape-space [true/false]", "if true (default) then spaces will be escaped. If false then spaces will be ignored, won't be escaped.") do |value|
    if value == 'false'
      options[:is_escape_space] = false
    end
  end

  opt.on("--disable-input-print [true/false]", "if false (default) then inputs will be printed. If true then only the output will be printed.") do |value|
    if value == 'true'
      options[:is_disable_input_print] = true
    end
  end

  opt.on("-h","--help","Shows this help message") do
    puts opt_parser
  end
end


opt_parser.parse!

unless options[:is_disable_input_print]
  puts "Provided options: #{options}"
end

unless options[:input_to_escape] and options[:input_to_escape].length > 0
  puts opt_parser
  exit 1
end

puts bash_string_escape(options[:input_to_escape], options[:is_escape_space])
