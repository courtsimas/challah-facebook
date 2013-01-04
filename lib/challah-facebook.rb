require 'challah'
require 'challah/facebook'

if Challah.respond_to?(:register_technique)
  Challah.register_technique :facebook, Challah::Facebook::Technique
  Challah.register_provider :facebook,  Challah::Facebook::Provider
end