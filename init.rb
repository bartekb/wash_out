require 'crack/xml'
require 'wash_out/param'
require 'wash_out/dispatcher'
require 'wash_out/wash_with_soap'

ActionController::Base.class_eval do
  include WashOut::WashWithSoap
end

ActionController::Base.helper(WashOutHelper)

module ActionDispatch::Routing
  class Mapper
    def wash_with_soap(controller)
      match "#{controller.to_s}/wsdl" => "#{controller.to_s}#wsdl"
      match "#{controller.to_s}/soap" => "#{controller.to_s}#soap"
    end
  end
end