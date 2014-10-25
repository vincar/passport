include FactoryGirl::Syntax::Methods
begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  Hirb::View.instance_eval do
    def enable_output_method
      old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
    end
  end

  Hirb.enable
end