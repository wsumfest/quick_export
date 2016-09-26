require "quick_export/version"
require "active_support"

module QuickExport
	extend ActiveSupport::Concern
	class Base 

		def self.generate_random_filename
			o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
			str_prefix = (0...30).map { o[rand(o.length)] }.join
			str_prefix
		end

	end
end
