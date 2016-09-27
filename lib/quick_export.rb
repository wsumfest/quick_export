require "quick_export/version"
require "active_support"

module QuickExport
  extend ActiveSupport::Concern
  class Base
  	@file_extension = nil
  	"""
  	Generates a string of random letters for filenames.
  	""" 
    def self.generate_random_filename
	  o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
	  (0...30).map { o[rand(o.length)] }.join
	end

	"""
	Getter method for file extension.
	"""
	def self.get_file_extension
		return @file_extension
	end

	"""
	Full filename is not implemented in Base class.
	"""
	def self.build_filename

	end

  end

  class To_CSV < Base
	@file_extension = ".csv"
	def self.dump_csv
	end

	"""
	Returns a random filename with a csv extension.
	"""
	def self.build_filename
		generate_random_filename + @file_extension
	end

  end

  class To_XLS < Base
	@file_extension = ".xls"
	def self.dump_xls
	end

	"""
	Returns a random filename with a xls extension.
	"""
	def self.build_filename
		generate_random_filename + @file_extension
	end
	
  end

end
