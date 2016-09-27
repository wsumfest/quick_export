require "quick_export/version"
require "active_record"

@@csv_extension = ".csv"
@@xls_extension = ".xls"

class ActiveRecord::Base 
	"""
  	Generates a string of random letters for filenames.
  	""" 
    def self.generate_random_filename
		o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		(0...30).map { o[rand(o.length)] }.join
	end

	"""
	Getter method for csv file extension.
	"""
	def self.get_csv_extension
		@@csv_extension
	end

	"""
	Getter method for xls file extension.
	"""
	def self.get_xls_extension
		@@xls_extension
	end

	"""
	Generates a full filename with extension.
	"""
	def self.build_filename(is_csv=true)
		filename = ""
		if is_csv
			filename = generate_random_filename + get_csv_extension

		else
			filename = generate_random_filename + get_xls_extension
		end
		filename
	end
	
end

class ActiveRecord::Relation 
	"""
	Getter method for active record relations.
	"""
	def generate_sql
		self.to_sql
	end
end
